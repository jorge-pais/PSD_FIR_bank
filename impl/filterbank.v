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

/* wire signed[15:0] outputSample;
assign dataout0 = outputSample; */

/* This is the main FIR, the one responsible for setting the address
considering that all the filters receive the exact same clock and input
the state should be same throughout all of them, and so is the address
*/
statefir fir0(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    .coeffaddress(coeffaddress),
    .coeff(coeff0),
    .dataout(dataout0)
);
/*
statefir fir1(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff1),
    .dataout(dataout1)
);
statefir fir2(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff2),
    .dataout(dataout2)
);
statefir fir3(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff3),
    .dataout(dataout3)
);
statefir fir4(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff4),
    .dataout(dataout4)
);
statefir fir5(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff5),
    .dataout(dataout5)
);
statefir fir6(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff6),
    .dataout(dataout6)
);
statefir fir7(
    .clock(clock),
    .reset(reset),
    .datain(datain),
    .din_enable(din_enable),
    //.coeffaddress(coeffaddress),
    .coeff(coeff7),
    .dataout(dataout7)
);*/

endmodule