
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador_8_bits IS
    PORT (
        A, B: IN std_logic_vector(7 DOWNTO 0);
        Cin: IN std_logic;
        O: OUT std_logic_vector(7 DOWNTO 0);
        Cout: OUT std_logic
    );
END somador_8_bits;

ARCHITECTURE Behavioral OF somador_8_bits IS

    COMPONENT somador
        PORT (
            A, B, Cin: IN std_logic;
            O, S: OUT std_logic
        );
    END COMPONENT;

    SIGNAL Carry: std_logic_vector(6 DOWNTO 0);

BEGIN

    G0: somador PORT MAP (A(0), B(0), Cin, O(0), Carry(0));
    G1: somador PORT MAP (A(1), B(1), Carry(0), O(1), Carry(1));
    G2: somador PORT MAP (A(2), B(2), Carry(1), O(2), Carry(2));
    G3: somador PORT MAP (A(3), B(3), Carry(2), O(3), Carry(3));
    G4: somador PORT MAP (A(4), B(4), Carry(3), O(4), Carry(4));
    G5: somador PORT MAP (A(5), B(5), Carry(4), O(5), Carry(5));
    G6: somador PORT MAP (A(6), B(6), Carry(5), O(6), Carry(6));
    G7: somador PORT MAP (A(7), B(7), Carry(6), O(7), Cout);

END Behavioral;
