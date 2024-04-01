LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY subtrator IS
    PORT (
        A, B, Cin: IN std_logic;
        O, S: OUT std_logic
    );
END subtrator;

ARCHITECTURE subtracao OF subtrator IS
    SIGNAL XOR1, XOR2, AND1, AND2, AND3, OR1: std_logic;
BEGIN
    -- Implementação da lógica do subtrator
    XOR1 <= A xor B;
    XOR2 <= XOR1 xor Cin;

    AND1 <= A and (not B) and (not Cin);
    AND2 <= (not A) and B and (not Cin);
    AND3 <= (not A) and (not B) and Cin;

    OR1 <= AND1 or AND2 or AND3;

    -- Atribuição dos resultados para as saídas
    O <= XOR2;
    S <= OR1;
END subtracao;
