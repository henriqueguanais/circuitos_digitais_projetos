LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY incrementador IS
    PORT (
        A: IN std_logic_vector(7 DOWNTO 0);
        Cin: IN std_logic;
        O: OUT std_logic_vector(7 DOWNTO 0);
        Cout: OUT std_logic
    );
END incrementador;

ARCHITECTURE inc OF incrementador IS
    SIGNAL XOR0, XOR1, XOR2, XOR3, XOR4, XOR5, XOR6, XOR7,  AND0, AND1, AND2, AND3, AND4 , AND5, AND6, AND7: std_logic;
    SIGNAL S: std_logic_vector(7 DOWNTO 0);
BEGIN
    -- Implementação da lógica do somador
    XOR0 <= A(0) xor '1';
    AND0 <= A(0) and '1';
        -- Atribuição dos resultados para as saídas
    S(0) <= XOR0; -- Resultado A(x)
    
    
    XOR1 <= A(1) xor AND0;
    AND1 <= A(1) and AND0;
        -- Atribuição dos resultados para as saídas
    S(1) <= XOR1; -- Resultado A(x)
    
    
    XOR2 <= A(2) xor AND1;
    AND2 <= A(2) and AND1;
        -- Atribuição dos resultados para as saídas
    S(2) <= XOR2; -- Resultado A(x)
    
    
    XOR3 <= A(3) xor AND2;
    AND3 <= A(3) and AND2;
        -- Atribuição dos resultados para as saídas
    S(3) <= XOR3; -- Resultado A(x)
    
    
    
    XOR4 <= A(4) xor AND3;
    AND4 <= A(4) and AND3;
        -- Atribuição dos resultados para as saídas
    S(4) <= XOR4; -- Resultado A(x)
  
    
    XOR5 <= A(5) xor AND4;
    AND5 <= A(5) and AND4;
        -- Atribuição dos resultados para as saídas
    S(5) <= XOR5; -- Resultado A(x)
    
    
    XOR6 <= A(6) xor AND5;
    AND6 <= A(6) and AND5;
        -- Atribuição dos resultados para as saídas
    S(6) <= XOR6; -- Resultado A(x)
    
    
    XOR7 <= A(7) xor AND6;
    AND7 <= A(7) and AND6;
        -- Atribuição dos resultados para as saídas
    S(7) <= XOR7; -- Resultado A(x)
    
    O <= S;
    cout <= A(7);
    
    
END inc;
