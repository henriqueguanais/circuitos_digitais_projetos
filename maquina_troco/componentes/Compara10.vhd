library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator10 is
    Port (
        A : in  STD_LOGIC_VECTOR(9 downto 0);
        B : in  STD_LOGIC_VECTOR(9 downto 0);
        A_gt_B : out STD_LOGIC
    );
end Comparator10;

architecture Behavioral of Comparator10 is
    signal gt: STD_LOGIC;

begin
    gt <= (A(9) and not B(9)) or
    ((A(9) xnor B(9)) and (A(8) and not B(8))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) and not B(7))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) and not B(6))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) and not B(5))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) and not B(4))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) and not B(3))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) xnor B(3)) and (A(2) and not B(2))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) and not B(1))) or
    ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) xnor B(1)) and (A(0) and not B(0)));

    A_gt_B <= gt;
end Behavioral;

