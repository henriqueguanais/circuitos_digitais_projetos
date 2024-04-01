library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logica is
    Port (
        A, B : in STD_LOGIC_VECTOR(7 downto 0);
        O1, O2, O3, O4 : out STD_LOGIC_VECTOR(7 downto 0)
    );
end logica;

architecture Behavioral of logica is
begin
    
    O1 <= A and B;
    O2 <= A or B;
    O3 <= A xor B;
    O4 <= not(A);

end Behavioral;

