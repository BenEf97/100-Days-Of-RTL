 // An edge detector

module day3 (
	input     wire    clk,
	input     wire    reset,

	input     wire    a_i,

	output    wire    rising_edge_o,
	output    wire    falling_edge_o
);
	
	// Internal signals
	reg sampled1 ;

	// Write your logic here...
	always @ ( posedge clk, posedge reset) begin
		if ( reset == 1'b1 )
			sampled1 <= 1'b0 ;
		else
			sampled1 <= a_i ;
	end

	assign rising_edge_o = a_i &&  !sampled1 ;
	assign falling_edge_o = !a_i && sampled1 ;




endmodule
/*

-- more useful info in my VHDL book
-- a simple riselate file in VHDL
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
entity rise is
   port ( resetN,clk,din : in  std_logic ;
          dout           : out std_logic ) ;
end rise ;
architecture arc_rise of rise is
   signal sampled1 , sampled2 : std_logic ;
begin
    process ( clk , resetN )
    begin
       if resetN = '0' then
          sampled1 <= '0' ;
          sampled2 <= '0' ;
       elsif clk'event and clk = '1' then
          sampled1 <= din      ;
          sampled2 <= sampled1 ;
       end if ;
    end process ;
    dout <= sampled1 and not sampled2 ;
end arc_rise ;
*/