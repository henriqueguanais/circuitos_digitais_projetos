library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparador_10bits is
    Port (
        A : in STD_LOGIC_VECTOR(9 downto 0); -- Incrementador
        B : in STD_LOGIC_VECTOR(9 downto 0); -- ValorDoTroco
        TemTroco    : out STD_LOGIC;
        NaoTemTroco : out STD_LOGIC
    );
end Comparador_10bits;

architecture Behavioral of Comparador_10bits is
    signal eq_bits : STD_LOGIC_VECTOR(9 downto 0);
    signal gt : STD_LOGIC;
    signal lt : STD_LOGIC;
    signal eq_all : STD_LOGIC;

    signal A_gt_B :  STD_LOGIC;
    signal A_eq_B :  STD_LOGIC;
    signal A_lt_B :  STD_LOGIC;    
    
begin

    -- Comparação de igualdade bit a bit
    eq_bits(0) <= (A(0) xnor B(0));
    eq_bits(1) <= (A(1) xnor B(1));
    eq_bits(2) <= (A(2) xnor B(2));
    eq_bits(3) <= (A(3) xnor B(3));
    eq_bits(4) <= (A(4) xnor B(4));
    eq_bits(5) <= (A(5) xnor B(5));
    eq_bits(6) <= (A(6) xnor B(6));
    eq_bits(7) <= (A(7) xnor B(7));
    eq_bits(8) <= (A(8) xnor B(8));
    eq_bits(9) <= (A(9) xnor B(9));

    -- Agregando os resultados de igualdade
    eq_all <= eq_bits(0) and eq_bits(1) and eq_bits(2) and eq_bits(3) and eq_bits(4) and eq_bits(5) and eq_bits(6) and eq_bits(7) and eq_bits(8) and eq_bits(9);

    -- Comparação de A maior que B bit a bit
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

    -- Comparação de A menor que B bit a bit
    lt <= (not A(9) and B(9)) or
          ((A(9) xnor B(9)) and (not A(8) and B(8))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (not A(7) and B(7))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (not A(6) and B(6))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (not A(5) and B(5))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (not A(4) and B(4))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (not A(3) and B(3))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) xnor B(3)) and (not A(2) and B(2))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) xnor B(3)) and (A(2) xnor B(2)) and (not A(1) and B(1))) or
          ((A(9) xnor B(9)) and (A(8) xnor B(8)) and (A(7) xnor B(7)) and (A(6) xnor B(6)) and (A(5) xnor B(5)) and (A(4) xnor B(4)) and (A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) xnor B(1)) and (not A(0) and B(0)));

    -- Saídas
    A_eq_B <= eq_all;
    A_gt_B <= gt and not eq_all;
    A_lt_B <= lt and not eq_all;
    
    
    TemTroco <= A_gt_B or A_eq_B;
    NaoTemTroco <= A_lt_B;
    

end Behavioral;
