/*
 Filter bank toplevel module
 
jca@fe.up.pt, Nov 2022

	This Verilog code is property of University of Porto
	Its utilization beyond the scope of the course Digital Systems Design
	(Projeto de Sistemas Digitais) of the Master in Electrical 
	and Computer Engineering requires explicit authorization from the author.
 
Edited by:
    Jorge Pais
    Pedro Duarte
*/
`timescale 1ns/1ps

module profir(
    input                   clock, 
    input                   reset,
    input signed [15:0]     datain,
    input                   din_enable,
    output [5:0]            coeffaddress,
    input signed [35:0]     coeff0,
    input signed [35:0]     coeff1,
    input signed [35:0]     coeff2,
    input signed [35:0]     coeff3,
    input signed [35:0]     coeff4,
    input signed [35:0]     coeff5,
    input signed [35:0]     coeff6,
    input signed [35:0]     coeff7,
    output signed [15:0]    dataout0,
    output signed [15:0]    dataout1,
    output signed [15:0]    dataout2,
    output signed [15:0]    dataout3,
    output signed [15:0]    dataout4,
    output signed [15:0]    dataout5,
    output signed [15:0]    dataout6,
    output signed [15:0]    dataout7
);

// States
parameter   INIT = 3'b000,
            START = 3'b001,
            SET = 3'b100,
            RUN = 3'b010,
            LOAD = 3'b011,
            STOP = 3'b101;
reg [2:0] state = INIT;
reg [2:0] nextState = INIT;

reg [6:0] countAddress = 0; // Extra black magic bit

// 6 least significant bits
assign coeffaddress = countAddress[5:0]; 

/* Since the output samples are calculated by the convoluting the 18 bit
filter coefficients and the 16 bit samples of the filter we now that in 
the worst case scenario, the resulting output after 128 clocks is 43 bits */
reg signed [41:0] calc_output [7:0]; // 8x1 array of 42 bit registers
reg signed [15:0] input_buffer [127:0]; // 128x1 array of 16 bit registers

reg signed [15:0] output_buffer [7:0]; // 8x1 x 16bit

assign dataout0 = output_buffer[0];
assign dataout1 = output_buffer[1];
assign dataout2 = output_buffer[2];
assign dataout3 = output_buffer[3];
assign dataout4 = output_buffer[4];
assign dataout5 = output_buffer[5];
assign dataout6 = output_buffer[6];
assign dataout7 = output_buffer[7];

/* Main input buffer multiplexer (128x2), where the input are
grouped by the even and odd samples. */
wire signed [15:0] muxOutA;
wire signed [15:0] muxOutB;
assign muxOutA = input_buffer[(countAddress << 1)]; // Even sample
assign muxOutB = input_buffer[(countAddress << 1) + 1]; // Odd sample

// Intermediate sample registers
reg signed [15:0] sampleA;
reg signed [15:0] sampleB;

integer i;

// Finite state machine control
always @(negedge clock)
begin
    case(state)
        INIT: // Init in this case is also a reset state   
            if(din_enable) nextState = START;
            else nextState = INIT;
        START:  nextState = SET;
        SET:    nextState = RUN; // Give time for the registers to load
        RUN: 
            if(countAddress <= 64) nextState = RUN;
            else nextState = LOAD;
        LOAD: nextState = STOP;
        STOP:
            if(din_enable) nextState = START;
            else nextState = STOP;
    endcase
end

always @(posedge clock)
begin
    if(reset) state = INIT;
    else state = nextState;
    $display("STATE: %02d, count: %02d", state, countAddress);

    // Load the sample registers
    sampleA <= muxOutA;
    sampleB <= muxOutB;

    case(state)
        INIT:
        begin
            for (i = 0; i < 8; i = i +1)
            begin
                calc_output[i] <= 42'd0; // Clear the output buffers
                output_buffer[i] <= 16'd0; 
            end
            for (i = 0; i < 128; i = i + 1)
                input_buffer[i] <= 16'd0; // Fill input buffer with zeros
            
            sampleA <= 16'd0; // Clear the intermediate sample registers
            sampleB <= 16'd0;
        end
        START:
        begin
            countAddress <= 0; // Set the first address to load
            for (i = 0; i < 8; i = i + 1) // Clear the outputs
                calc_output[i] <= 42'd0;

            // load the buffer
            for (i = 127; i > 0; i = i - 1) // shift the buffer positions
                input_buffer[i] <= input_buffer[i-1];
            input_buffer[0] <= datain; // load the current sample
        end
        SET:
        begin
            countAddress <= 1; // Prepare the second address for reading
        end
        RUN:
        begin
            $display("Sample A: 0x%04H; Sample B: 0x%04H", sampleA, sampleB);
            $display("filterCoefficients[%02d] 0x%05H -- 0x%05H", countAddress - 1, coeff0[17:0], coeff0[35:18]);

            /* We could do this with a single expression but then it would be
            required to do a wire array and to attach each coefficient input */
            calc_output[0] <= calc_output[0] + (sampleA * $signed(coeff0[17:0])) + (sampleB * $signed(coeff0[35:18]));
            calc_output[1] <= calc_output[1] + (sampleA * $signed(coeff1[17:0])) + (sampleB * $signed(coeff1[35:18]));
            calc_output[2] <= calc_output[2] + (sampleA * $signed(coeff2[17:0])) + (sampleB * $signed(coeff2[35:18]));
            calc_output[3] <= calc_output[3] + (sampleA * $signed(coeff3[17:0])) + (sampleB * $signed(coeff3[35:18]));
            calc_output[4] <= calc_output[4] + (sampleA * $signed(coeff4[17:0])) + (sampleB * $signed(coeff4[35:18]));
            calc_output[5] <= calc_output[5] + (sampleA * $signed(coeff5[17:0])) + (sampleB * $signed(coeff5[35:18]));
            calc_output[6] <= calc_output[6] + (sampleA * $signed(coeff6[17:0])) + (sampleB * $signed(coeff6[35:18]));
            calc_output[7] <= calc_output[7] + (sampleA * $signed(coeff7[17:0])) + (sampleB * $signed(coeff7[35:18]));

            /* calc_output[0] = calc_output[0] + (sampleA * coeff0[17:0]) + (sampleB * coeff0[35:18]);
            calc_output[1] = calc_output[1] + (sampleA * coeff1[17:0]) + (sampleB * coeff1[35:18]);
            calc_output[2] = calc_output[2] + (sampleA * coeff2[17:0]) + (sampleB * coeff2[35:18]);
            calc_output[3] = calc_output[3] + (sampleA * coeff3[17:0]) + (sampleB * coeff3[35:18]);
            calc_output[4] = calc_output[4] + (sampleA * coeff4[17:0]) + (sampleB * coeff4[35:18]);
            calc_output[5] = calc_output[5] + (sampleA * coeff5[17:0]) + (sampleB * coeff5[35:18]);
            calc_output[6] = calc_output[6] + (sampleA * coeff6[17:0]) + (sampleB * coeff6[35:18]);
            calc_output[7] = calc_output[7] + (sampleA * coeff7[17:0]) + (sampleB * coeff7[35:18]); */
    
            countAddress <= countAddress + 1;
        end
        LOAD:
        begin
            for(i = 0; i < 8; i = i + 1)
                output_buffer[i] <= $signed(calc_output[i][31:16]);
        end
        STOP:
        begin 
            countAddress <= 0;
            $display("Result: 0x%04h", output_buffer[0]);
        end
    endcase
end
endmodule