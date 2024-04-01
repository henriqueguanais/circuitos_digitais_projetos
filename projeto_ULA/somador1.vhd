LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador IS
    PORT (
        A, B, Cin: IN std_logic;
        O, S: OUT std_logic
    );
END somador;

ARCHITECTURE soma OF somador IS
    SIGNAL XOR1, XOR2, AND1, AND2, AND3, OR1: std_logic;
BEGIN
    -- Implementação da lógica do somador
    XOR1 <= A xor B;
    XOR2 <= XOR1 xor Cin;

    AND1 <= A and B;
    AND2 <= A and Cin;
    AND3 <= B and Cin;

    OR1 <= AND1 or AND2 or AND3;

    -- Atribuição dos resultados para as saídas
    O <= XOR2;
    S <= OR1;
END soma;

