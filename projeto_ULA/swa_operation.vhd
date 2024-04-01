library ieee;
use ieee.std_logic_1164.all;

entity swa_operation is
    port (A: in  std_logic_vector(7 downto 0);
	  O: out std_logic_vector(7 downto 0));
	 
end swa_operation;

architecture log of swa_operation is

begin
    
    O(7) <= A(0);
    O(6) <= A(1);
    O(5) <= A(2);
    O(4) <= A(3);
    O(3) <= A(4);
    O(2) <= A(5);
    O(1) <= A(6);
    O(0) <= A(7);

end log;
