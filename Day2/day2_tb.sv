`timescale 1ns/1ns


module day2_tb();
	// Write your Testbench here...
	// Inputs
	logic clk ;
	logic reset ;
	logic d_i ;

	// Outputs
	logic q_norst_o ;
	logic q_syncrst_o ;
	logic q_asyncrst_o ;
		
	// Instantiate the UUT
	day2 uut (
	.clk ( clk ) ,
	.reset ( reset ) ,
	.d_i ( d_i ) ,
	.q_norst_o ( q_norst_o ),
	.q_syncrst_o ( q_syncrst_o ),
	.q_asyncrst_o (q_asyncrst_o )
	) ;

	// Clock generator
	always begin 
		clk = 1'b1 ;
		// Wait 50 ns
		#50 ;
		clk = 1'b0 ;
		// Wait 50 ns
		#50 ;
	end

	// Testbench logic
	initial begin
	// Initialize inputs
	reset = 1'b1 ;
	d_i = 1'b0 ;
	// Wait for 100ns
	#100;
	
	reset = 1'b0 ;
	d_i = 1'b1 ;
	#100
	$display("Test case 1: q_norst = %b (expected %b) ",q_norst_o,d_i);
	$display("Test case 1: q_syncrst = %b (expected %b) ",q_syncrst_o,d_i);
	$display("Test case 1: q_asyncrst = %b (expected %b) ",q_asyncrst_o,d_i);

	
	#50
	reset = 1'b1 ;
	#50
	$display("Test case 2: q_norst = %b (expected %b) ",q_norst_o,d_i);
	$display("Test case 2: q_syncrst = %b (expected %b) ",q_syncrst_o,d_i);
	$display("Test case 2: q_asyncrst = %b (expected %b) ",q_asyncrst_o,~d_i);

	#50
	$display("Test case 3: q_norst = %b (expected %b) ",q_norst_o,d_i);
	$display("Test case 3: q_syncrst = %b (expected %b) ",q_syncrst_o,~d_i);
	$display("Test case 3: q_asyncrst = %b (expected %b) ",q_asyncrst_o,~d_i);

	end
endmodule