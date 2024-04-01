library ieee;
use ieee.std_logic_1164.all;

entity shr_operation is
    port (A: in  std_logic_vector(7 downto 0);
	  B: in  std_logic_vector(7 downto 0);
	  O: out std_logic_vector(7 downto 0));
	 
end shr_operation;

architecture log of shr_operation is

begin
    
    O(7) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(7)) or (B(2) and '0') 
             or (B(1) and '0') or (B(0) and '0');

    O(6) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(6)) or (B(2) and '0') 
             or (B(1) and '0') or (B(0) and not(B(1)) and not(B(2)) and A(7));

    O(5) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(5)) or (B(2) and '0') 
             or (not(B(0)) and B(1) and not(B(2)) and A(7)) or (B(0) and not(B(1))
	     and not(B(2)) and A(6)) or (B(0) and B(1) and '0');

    O(4) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(4)) or (B(2) and '0') 
             or (not(B(0)) and B(1) and not(B(2)) and A(6)) or (B(0) and not(B(1))
	     and not(B(2)) and A(5)) or (B(0) and B(1) and not(B(2)) and '0');

    O(3) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(3)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(7))) or (not(B(0)) and B(1) and not(B(2)) and A(5)) 
	    or (B(1) and B(2) and '0') or (B(0) and not(B(1)) and not(B(2)) and A(4))
	    or (B(0) and B(2) and '0') or (B(0) and B(1) and not(B(2)) and A(6));

    O(2) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(2)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(6))) or (not(B(0)) and B(1) and not(B(2)) and A(4)) 
	    or (B(1) and B(2) and '0') or (B(0) and not(B(1)) and not(B(2)) and A(3))
	    or (B(0) and not(B(1)) and B(2) and A(7)) or (B(0) and B(1) 
	    and not(B(2)) and A(5));

    O(1) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(1)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(5))) or (not(B(0)) and B(1) and not(B(2)) and A(3)) 
	    or (not(B(0)) and B(1) and B(2) and A(7)) or (B(0) and not(B(1)) 
	    and not(B(2)) and A(2)) or (B(0) and not(B(1)) and B(2) and A(6)) 
	    or (B(0) and B(1) and not(B(2)) and A(4)) or (B(0) and B(1) and B(2) and '0');

    O(0) <= (not(B(0)) and not(B(1)) and not(B(2)) and A(0)) or (not(B(0)) and not(B(1)) 
	    and B(2) and (A(4))) or (not(B(0)) and B(1) and not(B(2)) and A(2)) 
	    or (not(B(0)) and B(1) and B(2) and A(6)) or (B(0) and not(B(1)) 
	    and not(B(2)) and A(1)) or (B(0) and not(B(1)) and B(2) and A(5)) 
	    or (B(0) and B(1) and not(B(2)) and A(3)) or (B(0) and B(1) and B(2) and A(7));

end log;
