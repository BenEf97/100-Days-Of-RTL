`timescale 1ns/1ns

// A simple mux
// MUX 2 to 1

module day1 (
  input   wire [7:0]    a_i,		// Input 1
  input   wire [7:0]    b_i,		// Input 2
  input   wire          sel_i,	// Sel
  output  wire [7:0]    y_o			// Output
);

  // Write your logic here...
  assign y_o = sel_i ? a_i : b_i;

endmodule
