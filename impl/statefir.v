`timescale 1ns/1ps

module statefir(
    input                   clock,
    input                   reset,
    input signed [15:0]     datain,
    input                   din_enable,
    output [5:0]            coeffaddress,
    input signed [35:0]     coeff,
    output signed [15:0]    dataout
);

// States
parameter   INIT = 3'b000,
            START = 3'b001,
            SET1 = 3'b100,
            SET2 = 3'b110,
            RUN = 3'b010,
            LOAD = 3'b011,
            STOP = 3'b101;
reg [2:0] state = INIT;
reg [2:0] nextState = INIT;

reg [6:0] countAddress = 0; // Extra black magic bit

// 6 least significant bits
assign coeffaddress = countAddress[5:0];

reg signed [15:0] input_buffer [127:0]; // 128x1 array of 16 bit registers
reg signed [15:0] output_buffer;

assign dataout = output_buffer;

reg signed [41:0] calc_output;
reg signed [33:0] aux_calcA;
reg signed [33:0] aux_calcB;

wire signed [15:0] muxOutA;
wire signed [15:0] muxOutB;
assign muxOutA = input_buffer[(countAddress << 1)]; // Even sample
assign muxOutB = input_buffer[(countAddress << 1) + 1]; // Odd sample

reg signed [15:0] sampleA;
reg signed [15:0] sampleB;

integer i;

always @(negedge clock)
begin
    case(state)
        INIT: // Init in this case is also a reset state   
            if(din_enable) nextState = START;
            else nextState = INIT;
        START:  nextState = SET1;
        SET1:   nextState = SET2; // Give time for the registers to load
        SET2:   nextState = RUN;
        RUN: 
            if(countAddress <= 65) nextState = RUN;
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
    //$display("STATE: %02d, count: %02d", state, countAddress);

    // Load the sample registers
    sampleA <= muxOutA;
    sampleB <= muxOutB;

    case(state)
        INIT:
        begin
            calc_output = 42'd0; // Clear both output buffers
            output_buffer <= 16'd0; 
            
            for (i = 0; i < 128; i = i + 1)
                input_buffer[i] <= 16'd0; // Fill input buffer with zeros
            
            sampleA <= 16'd0; // Clear the intermediate sample registers
            sampleB <= 16'd0;
        end
        START:
        begin
            countAddress <= 0; // Set the first address to load
            // Clear the outputs
            calc_output = 42'd0;

            // load the buffer
            for (i = 127; i > 0; i = i - 1) // shift the buffer positions
                input_buffer[i] <= input_buffer[i-1];
            input_buffer[0] <= datain; // load the current sample
        end
        SET1:
        begin
            countAddress <= 1; // Prepare the second address for reading
        end
        SET2:
        begin // Multiply the first values
            aux_calcA <= sampleA * $signed(coeff[17:0]);
            aux_calcB <= sampleB * $signed(coeff[35:18]);
            countAddress <= 2;
        end
        RUN:
        begin
            calc_output = calc_output + aux_calcA + aux_calcB;

            aux_calcA <= sampleA * $signed(coeff[17:0]); // Pipe line the slower multiplications
            aux_calcB <= sampleB * $signed(coeff[35:18]);
    
            countAddress <= {countAddress + 7'h1};
        end
        LOAD:
        begin
            output_buffer <= $signed(calc_output[31:16]);
        end
        STOP:
        begin 
            countAddress <= 0;
            //$display("Result: 0x%04h", output_buffer[0]);
        end
    endcase
end

endmodule