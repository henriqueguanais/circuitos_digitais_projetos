library ieee;
use ieee.std_logic_1164.all;

entity swp_operation is
    port (A: in  std_logic_vector(7 downto 0);
	  O: out std_logic_vector(7 downto 0));
	 
end swp_operation;

architecture log of swp_operation is

begin

    O(7 downto 4) <= A(3 downto 0);
    O(3 downto 0) <= A(7 downto 4);
 
end log;
