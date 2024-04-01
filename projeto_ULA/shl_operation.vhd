library ieee;
use ieee.std_logic_1164.all;

entity shl_operation is
    port (A: in  std_logic_vector(7 downto 0);
	  B: in  std_logic_vector(7 downto 0);
	  O: out std_logic_vector(7 downto 0);
	  C: out std_logic);
	 
end shl_operation;

architecture log of shl_operation is
signal temp: std_logic;

begin
    
    temp <= (not(B(0)) and not(B(1)) and not(B(2)) and A(7)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(3))) or (not(B(0)) and B(1) and not(B(2)) and A(5)) 
	    or (not(B(0)) and B(1) and B(2) and A(1)) or (B(0) and not(B(1)) 
	    and not(B(2)) and A(6)) or (B(0) and not(B(1)) and B(2) and A(2)) 
	    or (B(0) and B(1) and not(B(2)) and A(4)) or (B(0) and B(1) and B(2) and A(0));

    O(7) <= temp;

    O(6) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(6)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(2))) or (not(B(0)) and B(1) and not(B(2)) and A(4)) 
	    or (not(B(0)) and B(1) and B(2) and A(0)) or (B(0) and not(B(1)) 
	    and not(B(2)) and A(5)) or (B(0) and not(B(1)) and B(2) and A(1)) 
	    or (B(0) and B(1) and not(B(2)) and A(3)) or (B(0) and B(1) and B(2) and '0');

    O(5) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(5)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(1))) or (not(B(0)) and B(1) and not(B(2)) and A(3)) 
	    or (B(1) and B(2) and '0') or (B(0) and not(B(1)) and not(B(2)) and A(4))
	    or (B(0) and not(B(1)) and B(2) and A(0)) or (B(0) and B(1) 
	    and not(B(2)) and A(2));

    O(4) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(4)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(0))) or (not(B(0)) and B(1) and not(B(2)) and A(2)) 
	    or (B(1) and B(2) and '0') or (B(0) and not(B(1)) and not(B(2)) and A(3))
	    or (B(0) and B(2) and '0') or (B(0) and B(1) and not(B(2)) and A(1));

    O(3) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(3)) or (B(2) and '0') 
             or (not(B(0)) and B(1) and not(B(2)) and A(1)) or (B(0) and not(B(1))
	     and not(B(2)) and A(2)) or (B(0) and B(1) and not(B(2)) and A(0));

    O(2) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(2)) or (B(2) and '0') 
             or (not(B(0)) and B(1) and not(B(2)) and A(0)) or (B(0) and not(B(1))
	     and not(B(2)) and A(1)) or (B(0) and B(1) and '0');

    O(1) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(1)) or (B(2) and '0') 
             or (B(1) and '0') or (B(0) and not(B(1)) and not(B(2)) and A(0));

    O(0) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(0)) or (B(2) and '0') 
             or (B(1) and '0') or (B(0) and '0');
    
    C <= temp;
    
end log;
