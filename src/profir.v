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
    output signed [15:0]    dataout7,
);

reg [15:0] input_buffer [0:127]; // 128x1 array of 16 bit registers
reg [5:0] controladdress; // Address to control main multiplexer and RAM

wire [31:0] sample_pairs [0:64];

always @(posedge clock)
begin
    if(reset) // Synchronous reset
    begin
        for (i = 0; i < 128; i = i + 1) // Load the zero
            input_buffer[i] <= 16'd0;

    end
    else
    begin
        if(din_enable) // load the buffer
        begin
            for (i=127; i > 0; i = i + 1) // shift the buffer positions
                input_buffer[i] <= input_buffer[i-1];

            input_buffer[0] <= datain; // load the current sample

            // pair the inputs for multiplexer
            for (i = 0; i < 64; i=i+1)
                sample_pairs[i] = {input_buffer[2*i], input_buffer[2*i+1]};

            coeffaddress <= 5'd0; // Set the initial address to load the first two coefficients from memory
        end
        
    end
end
endmodule