// Different DFF


module day2 (
	input     logic      clk,
	input     logic      reset,

	input     logic      d_i,         //-> D input to the flop

	output    logic      q_norst_o,   //-> Q output from non-resettable flop
	output    logic      q_syncrst_o, //-> Q output from flop using synchronous reset
	output    logic      q_asyncrst_o //-> Q output from flop using asynchrnoous reset
);

	// Write your logic here...
	// Async reset
	always_ff @ ( posedge reset , posedge clk)
		if ( reset == 1'b1 )
			q_asyncrst_o <= 0 ;
		else
			q_asyncrst_o <= d_i ;
	
	// Sync reset
	always_ff @ ( posedge clk )
		if ( reset == 1'b1 )
			q_syncrst_o <= 0 ;
		else
			q_syncrst_o <= d_i ;
	
	// Non-reset
	always_ff @ ( posedge clk )
		q_norst_o <= d_i;


endmodule