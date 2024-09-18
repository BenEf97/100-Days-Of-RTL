// A simple TB for mux

module day1_tb ();

  // Write your Testbench here...
  // Inputs
  reg [7:0] a_i ;
  reg [7:0] b_i ;
  reg sel_i ;
	
  // Output
  wire [7:0] y_o ;
  
  // Instantiate the UUT
  day1 uut (
    .a_i ( a_i ) ,
    .b_i ( b_i ) ,
    .sel_i ( sel_i ) ,
    .y_o ( y_o )
  ) ;
  
  // Testbench logic
  initial begin
  // Initialize inputs
    a_i = 8'b00000000;
    b_i = 8'b00000000;
  	sel_i = 0;
    
    // Wait for 100ns
    #100;
    
    // Test case 1: sel_i = 0, expect y_o = a_i
    a_i = 8'b10101010 ;
    b_i = 8'b11001100 ;
    sel_i = 0;
    #10
    $display("Test case 1: y_o = %b (expected %b)",y_o, b_i);
    
    // Test case 2: sel_i = 1, expect y_o = b_i
    sel_i = 1;
    #10;
    $display("Test case 2: y_o = %b (expected %b)", y_o, a_i);
    
    // Test case 3: change inputs
    a_i = 8'b11110000;
    b_i = 8'b00001111;
    sel_i = 0;
    #10;
    $display("Test case 3: y_o = %b (expected %b)", y_o, b_i);
    
    // Test case 4
    sel_i = 1;
    #10;
    $display("Test case 4: y_o = %b (expected %b)", y_o,a_i);
  end
endmodule
