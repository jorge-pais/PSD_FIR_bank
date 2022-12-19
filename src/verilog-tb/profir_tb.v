/*
Basic testbench for the Profir module

	jca@fe.up.pt, Nov 2022

	This Verilog code is property of University of Porto
	Its utilization beyond the scope of the course Digital Systems Design
	(Projeto de Sistemas Digitais) of the Master in Electrical 
	and Computer Engineering requires explicit authorization from the author.

*/
`timescale 1ns/1ps

module profir_tb;

parameter MAXSAMPLES          		= 1_000_000,
		CLOCK_FREQUENCY       		= 250_000_000, // 1/250MHz = 4ns
		CLOCK_PERIOD          		= 4,
		INPUT_DATAFILE        		= "../simdata/datain.hex", // input data
		OUTPUT_GOLDEN_DATAFILE_0	= "../simdata/dataout0.hex",// expected output data for filter 0
		OUTPUT_GOLDEN_DATAFILE_1	= "../simdata/dataout1.hex",// expected output data for filter 1
		OUTPUT_GOLDEN_DATAFILE_2	= "../simdata/dataout2.hex",// expected output data for filter 2
		OUTPUT_GOLDEN_DATAFILE_3	= "../simdata/dataout3.hex",// expected output data for filter 3
		OUTPUT_GOLDEN_DATAFILE_4	= "../simdata/dataout4.hex",// expected output data for filter 4
		OUTPUT_GOLDEN_DATAFILE_5	= "../simdata/dataout5.hex",// expected output data for filter 5
		OUTPUT_GOLDEN_DATAFILE_6	= "../simdata/dataout6.hex",// expected output data for filter 6
		OUTPUT_GOLDEN_DATAFILE_7	= "../simdata/dataout7.hex";// expected output data for filter 7

reg clock, reset;
reg [15:0] datain;  // Input data to the for bank
wire datain_en;     // Input data enable, sets the sampling frequency to 250MHz / 128:

// Connect the coefficients read from RAM to the filter bank module:
wire [35:0] data0, data1, data2, data3, data4, data5, data6, data7;

// The read address from the filter bank to the coefficient RAM bank
wire [5:0] read_address;

// The main outputs from the filter bank
wire [15:0] dataout0, dataout1, dataout2, dataout3, dataout4, dataout5, dataout6, dataout7;

// Load input and output data from files INPUT_DATAFILE and OUTPUT_GOLDEN_DATAFILE_<0-7>:
reg [15:0] datainbuffer[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_0[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_1[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_2[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_3[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_4[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_5[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_6[0:MAXSAMPLES-1];
reg [15:0] dataoutbuffer_7[0:MAXSAMPLES-1];
integer i, Nsamples, Nsamplesout;

initial
begin
	$readmemh( INPUT_DATAFILE, datainbuffer );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( datainbuffer[i] !== 16'dx )
		Nsamples = i;
	$display("Read %d samples from input file %s", Nsamples, INPUT_DATAFILE );

	// Load output filter 0
	$readmemh( OUTPUT_GOLDEN_DATAFILE_0, dataoutbuffer_0 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_0[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_0 );

	// Load output filter 1
	$readmemh( OUTPUT_GOLDEN_DATAFILE_1, dataoutbuffer_1 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_1[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_1 );

	// Load output filter 2
	$readmemh( OUTPUT_GOLDEN_DATAFILE_2, dataoutbuffer_2 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_2[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_2 );

	// Load output filter 3
	$readmemh( OUTPUT_GOLDEN_DATAFILE_3, dataoutbuffer_3 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_3[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_3 );

	// Load output filter 4
	$readmemh( OUTPUT_GOLDEN_DATAFILE_4, dataoutbuffer_4 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_4[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_4 );

	// Load output filter 5
	$readmemh( OUTPUT_GOLDEN_DATAFILE_5, dataoutbuffer_5 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_5[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_5 );

	// Load output filter 6
	$readmemh( OUTPUT_GOLDEN_DATAFILE_6, dataoutbuffer_6 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_6[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_6 );

	// Load output filter 7
	$readmemh( OUTPUT_GOLDEN_DATAFILE_7, dataoutbuffer_7 );
	for(i=0; i<MAXSAMPLES; i=i+1)
		if ( dataoutbuffer_7[i] !== 16'dx )
		Nsamplesout = i;
	$display("Read %d samples from output file %s", Nsamplesout, OUTPUT_GOLDEN_DATAFILE_7 );
end

// Initialize registers and variables, generate clock and reset:
initial
begin
	clock = 0;
	reset = 0;
	datain = 0;
	// Generate the master clock:
	forever #(CLOCK_PERIOD/2) clock = ~clock;
end

// generate the reset signal (note this is active low)
// Activate reset_n for 10 clock cycles (100 ns)
// raise the reset after the first 5 clock periods, keep it high
// for 2 clock periods;
// align the reset edges to the negative edge of the clock
initial
begin
	# 1
	@(negedge clock);
	repeat (5)
		@(negedge clock);
	reset = 1;
	repeat (2)
		@(negedge clock);
	reset = 0;
end		

// generate the datain enable signal:
// delay the datain_en edges from the clock only to ease
// the waveform analysis
integer counter = 0;
always @(posedge clock)
begin
	if ( reset )
	begin
		counter <= 0;
	end
	else
	begin
		if ( counter == 127 )
		counter <= 0;
		else
		counter <= counter + 1;
	end
end

assign #1 datain_en = (counter == 127);


// Apply the input data samples:
integer Csamples = 0;     // Pointer to the array with the input samples 
						// read from the input file
						
integer Coutsamples = 0; // Adjust the start value for this index 
						// to synchronize with the output data 
						// generated by your circuit
						
// register loaded with the expected output data						  
reg signed [15:0] goldendataout[7:0];

reg failed = 0;
integer mismatch = 0;
integer match = 0;

always @(posedge datain_en)
begin

	datain <= datainbuffer[Csamples];
	
	if ( Coutsamples >= 0 )
	begin
		goldendataout[0] <= dataoutbuffer_0[ Coutsamples ];
		goldendataout[1] <= dataoutbuffer_1[ Coutsamples ];
		goldendataout[2] <= dataoutbuffer_2[ Coutsamples ];
		goldendataout[3] <= dataoutbuffer_3[ Coutsamples ];
		goldendataout[4] <= dataoutbuffer_4[ Coutsamples ];
		goldendataout[5] <= dataoutbuffer_5[ Coutsamples ];
		goldendataout[6] <= dataoutbuffer_6[ Coutsamples ];
		goldendataout[7] <= dataoutbuffer_7[ Coutsamples ];
	end
		
	else
	begin
		goldendataout[0] <= 16'dx;  // set to unknown value
		goldendataout[1] <= 16'dx;  // set to unknown value
		goldendataout[2] <= 16'dx;  // set to unknown value
		goldendataout[3] <= 16'dx;  // set to unknown value
		goldendataout[4] <= 16'dx;  // set to unknown value
		goldendataout[5] <= 16'dx;  // set to unknown value
		goldendataout[6] <= 16'dx;  // set to unknown value
		goldendataout[7] <= 16'dx;  // set to unknown value		
	end

	Coutsamples = Coutsamples + 1;
	
	if ( Csamples == Nsamples ) // end of the input sample vector
	//if(Csamples == 20) 
	begin

		if(mismatch == 0)
			$display("[TEST RESULT] All %d samples match", match);
		else
			$display("[TEST RESULT] %d samples differ from expected!", mismatch);
			
		repeat(1000)			// wait more 1000 clocks and stop simulation
		@(posedge clock);
		$stop;
	end
	else
		Csamples <= Csamples + 1;
		
	// INSERT HERE YOUR VERIFICATION PROCESS TO COMPARE THE dataout<0-7> 
	// OUTPUTS WITH THE EXPECTED OUTPUT DATA
	if(^goldendataout[0] !== 1'bX) // Check if any bit if X or Z
		if(dataout0 !== goldendataout[0])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;
	
	if(^goldendataout[1] !== 1'bX) // Check if any bit if X or Z
		if(dataout1 !== goldendataout[1])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;	

	if(^goldendataout[2] !== 1'bX) // Check if any bit if X or Z
		if(dataout2 !== goldendataout[2])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;

	if(^goldendataout[3] !== 1'bX) // Check if any bit if X or Z
		if(dataout3 !== goldendataout[3])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;

	if(^goldendataout[4] !== 1'bX) // Check if any bit if X or Z
		if(dataout4 !== goldendataout[4])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;

	if(^goldendataout[5] !== 1'bX) // Check if any bit if X or Z
		if(dataout5 !== goldendataout[5])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;
	
	if(^goldendataout[6] !== 1'bX) // Check if any bit if X or Z
		if(dataout6 !== goldendataout[6])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;
	
	if(^goldendataout[7] !== 1'bX) // Check if any bit if X or Z
		if(dataout7 !== goldendataout[7])
			mismatch <= mismatch + 1;
		else
			match <= match + 1;
end

/* Output a waveform for gtkwave
this block must be commented before utilizing any
other verilog synthesis application
*/
/* initial
begin
	$dumpfile("filterWaveforms.vcd");
	$dumpvars(0, profir_tb);
end */

//--------------------------------------------------------------------------------
// Instantiate the memory bank:
memory8bank  memory8bank_1(
		.clock( clock ),		// Master clock, active in the posedge
		.reset( reset ),		// Master reset, synch active high (clears output regs)
		//-------------------------------------
		// write port, to connect to the serial interface
		// For now the write port is disabled
		.addressW( 9'd0 ),	// Write address
		.datain( 36'd0 ),		// Data to write
		.we( 1'b0 ),			// Write enable
		//-------------------------------------
		// 8 read ports, common address, 2 coefficients por data port
		// each coefficient is 18 bits, signed, 5 integer bits and 13 fraccional bits
		.addressR( read_address ),	// Read address, from the filter bank
		.data0( data0 ),	// Output data ports, to the filter bank
		.data1( data1 ),
		.data2( data2 ),
		.data3( data3 ),
		.data4( data4 ),
		.data5( data5 ),
		.data6( data6 ),
		.data7( data7 )
);

//--------------------------------------------------------------------------------
// Instantiate the filter bank:
profir filter_bank_1(
		.clock( clock ),		// Master 250 MHz clock, active in the rising edge
		.reset( reset ),		// Master reset, synchronous, active high
		.datain( datain ),		// Input signal sample
		.din_enable( datain_en ),	// When 1, a new sample is present at datain input (lasts 1 clock)
		.coeffaddress( read_address ),	// Address to read all the coefficient memories
		.coeff0( data0 ),		// Coefficient read data for filter 0
		.coeff1( data1 ),		// Coefficient read data for filter 1
		.coeff2( data2 ),		// Coefficient read data for filter 2
		.coeff3( data3 ),		// Coefficient read data for filter 3
		.coeff4( data4 ),		// Coefficient read data for filter 4
		.coeff5( data5 ),		// Coefficient read data for filter 5
		.coeff6( data6 ),		// Coefficient read data for filter 6
		.coeff7( data7 ),		// Coefficient read data for filter 7
		.dataout0( dataout0 ),	// Output data of filter 0
		.dataout1( dataout1 ),	// Output data of filter 1
		.dataout2( dataout2 ),	// Output data of filter 2
		.dataout3( dataout3 ),	// Output data of filter 3
		.dataout4( dataout4 ),	// Output data of filter 4
		.dataout5( dataout5 ),	// Output data of filter 5
		.dataout6( dataout6 ),	// Output data of filter 6
		.dataout7( dataout7 )	// Output data of filter 7
);

endmodule