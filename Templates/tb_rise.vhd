-- a simple VHDL riselate file of Test Bench
-- www.aztech.co.il - Amos Zaslavsky
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
-- use ieee.numeric_std.all ;
entity tb_rise is
   -- test bench has no ports
end tb_rise ;
-- component declaraion not needed with direct istantiation
architecture arc_tb_rise of tb_rise is
   component rise
      port ( resetN,clk,din : in  std_logic ;
             dout           : out std_logic ) ;
   end component ;
   signal resetN, clk, din : std_logic ;
   signal dout             : std_logic ;
begin

   -- component istantiation
   eut: rise port map ( resetN , clk , din , dout ) ;

   -- direct entity istantiation
   -- eut: entity work.rise port map ( resetN , clk , din , dout ) ;

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
      assert dout = '0' report "vec1 " ;
                    -- <= copy & past of above test vector
      ------------------------------
      din <= '0' ;  -- more signal assignments here ...
      wait for 100 ns ;
      assert dout = '0' report "vec2 " ;
      ------------------------------ set din to 1
      din <= '1' ;  -- more signal assignments here ...
      wait for 100 ns ;
      assert dout = '1' report "vec3 " ;
      ------------------------------
      din <= '1' ;  -- more signal assignments here ...
      wait for 100 ns ;
      assert dout = '0' report "vec4 " ;
      ------------------------------
      din <= '1' ;  -- more signal assignments here ...
      wait for 100 ns ;
      assert dout = '0' report "vec5 " ;
      ------------------------------
      din <= '0' ;  -- more signal assignments here ...
      wait for 100 ns ;
      assert dout = '0' report "vec6 " ;
      ------------------------------ terminate loop
      report "End of test vectors" ;
      wait ;
   end process ;

end arc_tb_rise ;
