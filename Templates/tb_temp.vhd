-- a simple VHDL template file of Test Bench
-- www.aztech.co.il - Amos Zaslavsky
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
-- use ieee.numeric_std.all ;
entity tb_TEMP is
   -- test bench has no ports
end tb_TEMP ;
-- component declaraion not needed with direct istantiation
architecture arc_tb_TEMP of tb_TEMP is
   component TEMP
      port ( resetN,clk,din : in  std_logic ;
             dout           : out std_logic ) ;
   end component ;
   signal resetN, clk, din : std_logic ;
   signal dout             : std_logic ;
begin

   -- component istantiation
   eut: TEMP port map ( resetN , clk , din , dout ) ;

   -- direct entity istantiation
   -- eut: entity work.TEMP port map ( resetN , clk , din , dout ) ;

   -- active low reset pulse
   resetN <= '0' , '1' after 100 ns ;

   -- clock generator
   process
   begin
      clk <= '0' ;  wait for 50 ns ;
      clk <= '1' ;  wait for 50 ns ;
   end process ;

   -- sync inputs generator (for simple cases)
   -- din <= '0' , '1' after 200 ns , '0' after 600 ns ;

   -- same sync inputs generator as above but
   -- much better for more complex situations
   process
   begin
      ------------------------------ async reset
      din <= '0' ;  -- more signal assignments here ...
      wait for 100 ns ;
                    -- <= copy & past of above test vector
      ------------------------------
      din <= '0' ;  -- more signal assignments here ...
      wait for 100 ns ;
      ------------------------------ set din to 1
      din <= '1' ;  -- more signal assignments here ...
      wait for 600 ns ;
      ------------------------------
      din <= '0' ;  -- more signal assignments here ...
      wait for 200 ns ;
      ------------------------------ terminate loop
      report "End of test vectors" ;
      wait ;
   end process ;

end arc_tb_TEMP ;
