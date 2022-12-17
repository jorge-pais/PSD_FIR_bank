/*
https://www.chipverify.com/verilog/verilog-arrays
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

// States for moore machine
parameter   INIT = 2'b00,
            START = 2'b01,
            RUN = 2'b10,
            STOP = 2'b11;
reg [1:0] state = INIT;
reg [1:0] nextState = INIT;

reg [6:0] countAddress = 0; // Extra black magic bit

// 6 least significant bits
assign coeffaddress = countAddress[5:0]; 

reg signed [15:0] output_buffer [7:0]; // 8x1 x 16bit

assign dataout0 = output_buffer[0];
assign dataout1 = output_buffer[1];
assign dataout2 = output_buffer[2];
assign dataout3 = output_buffer[3];
assign dataout4 = output_buffer[4];
assign dataout5 = output_buffer[5];
assign dataout6 = output_buffer[6];
assign dataout7 = output_buffer[7];

/*
Since the output samples are calculated by the convoluting the 18 bit
filter coefficients and the 16 bit samples of the filter we now that in 
the worst case scenario, the resulting output after 128 clocks is 43 bits
*/
reg [41:0] calc_output [0:7]; // 8x1 array of 41 bit registers
reg [15:0] input_buffer [0:127]; // 128x1 array of 16 bit registers

reg [15:0] sampleA;
reg [15:0] sampleB;

reg started = 0;

/* Main input buffer multiplexer (128x2), where the input are
grouped by the even and odd samples.
Posedge already loads the registers with the multiplexer output
*/
wire signed [15:0] muxOutA;
wire signed [15:0] muxOutB;
assign muxOutA = input_buffer[(countAddress << 1)]; // Even sample
assign muxOutB = input_buffer[(countAddress << 1) + 1]; // Odd sample

integer i;

// OLD IMPLEMENTATION
always @(posedge clock)
begin
    if(reset) // Synchronous reset
    begin
        for (i = 0; i < 8; i = i +1)
            calc_output[i] <= 43'd0; // Clear the calculation output
        for (i = 0; i < 128; i = i + 1)
            input_buffer[i] <= 16'd0; // Fill input buffer with zeros
        
        sampleA <= 16'd0; // Clear the intermediate sample registers
        sampleB <= 16'd0;
        started = 0;
    end
    else
    begin
        sampleA <= input_buffer[(countAddress << 1)]; // Even sample
        sampleB <= input_buffer[(countAddress << 1) + 1]; // Odd sample
        if(din_enable) // The first iteration
        begin
            // reset the calculation outputs
            for (i = 0; i < 8; i = i + 1)
            begin
                calc_output[i] <= 42'd0;
                output_buffer[i] <= 16'd0;
            end

            // load the buffer
            for (i = 127; i > 0; i = i - 1) // shift the buffer positions
                input_buffer[i] <= input_buffer[i-1];
            input_buffer[0] <= datain; // load the current sample

            started = 1;
            countAddress = 0;
        end
        else
            if(started) // Every other cycle
            begin
                // Update the coefficient address
                countAddress = countAddress + 1;
                // Multiply & accumulate until last sample
                if(countAddress <= 64)
                begin
                    calc_output[0] <= calc_output[0] + sampleA*coeff0[35:18] + sampleB*coeff0[17:0];
                    calc_output[1] <= calc_output[1] + sampleA*coeff1[35:18] + sampleB*coeff1[17:0];
                    calc_output[2] <= calc_output[2] + sampleA*coeff2[35:18] + sampleB*coeff2[17:0];
                    calc_output[3] <= calc_output[3] + sampleA*coeff3[35:18] + sampleB*coeff3[17:0];
                    calc_output[4] <= calc_output[4] + sampleA*coeff4[35:18] + sampleB*coeff4[17:0];
                    calc_output[5] <= calc_output[5] + sampleA*coeff5[35:18] + sampleB*coeff5[17:0];
                    calc_output[6] <= calc_output[6] + sampleA*coeff6[35:18] + sampleB*coeff6[17:0];
                    calc_output[7] <= calc_output[7] + sampleA*coeff7[35:18] + sampleB*coeff7[17:0];
                
                    //$display("Sample A: 0x%4H; Sample B: 0x%4H", sampleA, sampleB);
                    //$display("filterCoefficients[%2d] 0x%6H -- 0x%6H", countAddress - 1, coeff0[35:18], coeff0[17:0]);
                end
                else
                begin
                    // load the most significant 16 bits to the output
                    started = 0;

                    for(i = 0; i < 8; i = i + 1)
                        output_buffer[i] <= $signed(calc_output[i][31:16]);
                end
            end

    end
end

endmodule
