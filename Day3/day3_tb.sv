`timescale 1ns/1ns

// Simple edge detector TB

module day3_tb ();
	logic    clk ;
	logic    reset ;

	logic    a_i ;

	logic    rising_edge_o ;
	logic    falling_edge_o ;

	// Instantiate the UUT
	day3 uut (
	.clk ( clk ) ,
	.reset ( reset ) ,
	.a_i ( a_i ) ,
	.rising_edge_o ( rising_edge_o ),
	.falling_edge_o ( falling_edge_o )
	) ;

	// Write your Testbench here...
	// Clock generator
		always begin 
			clk = 1'b1 ;
			// Wait 50 ns
			#50 ;
			clk = 1'b0 ;
			// Wait 50 ns
			#50 ;
		end
	// Initial logic
	initial begin
		reset = 1'b1 ;
		a_i = 1'b0 ;
		#100 ;
		
		reset = 1'b0 ;
		a_i = 1'b1 ;
		
		#100 ;

		a_i = 1'b0 ;

		#100 ;
	end
	

endmodule
