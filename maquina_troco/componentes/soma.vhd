library ieee;
use ieee.std_logic_1164.all;

entity soma is 
	port( A, B, Cin: in std_logic;
	        O, Cout: out std_logic);
end soma;

architecture log of soma is


begin
	
    O    <= ((A xor B) xor Cin);
    Cout <= (A and Cin) or (A and B) or (B and Cin);

end log;
