
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY subtrator_8bits IS
    PORT (
        A, B: IN std_logic_vector(7 DOWNTO 0);
        Cin: IN std_logic;
        O: OUT std_logic_vector(7 DOWNTO 0);
        S: OUT std_logic
    );
END subtrator_8bits;

ARCHITECTURE subtracao_8bits OF subtrator_8bits IS
    SIGNAL O_int: std_logic_vector(7 DOWNTO 0);
    SIGNAL S_int: std_logic_vector(7 DOWNTO 0);
BEGIN
    subtrator_instance: FOR i IN 0 TO 7 GENERATE
        subtrator_i: entity work.subtrator
            PORT MAP (
                A => A(i),
                B => B(i),
                Cin => Cin,
                O => O_int(i),
                S => S_int(i)
            );
    END GENERATE;

    O <= O_int;
    S <= S_int(7); -- Utiliza o borrow out do bit mais significativo como saída S
END subtracao_8bits;