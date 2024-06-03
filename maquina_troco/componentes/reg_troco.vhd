library ieee;
use ieee.std_logic_1164.all;

ENTITY Registrador_10 is
PORT( 
        I: in std_logic_vector(9 downto 0);
        CLK, CLR, EN: in std_logic;
        O: out std_logic_vector(9 downto 0));
end Registrador_10;

ARCHITECTURE logica of Registrador_10 is
----------------------------------------------------
COMPONENT FFD is
port(
		ck, D, Preset, Clear	: in std_logic ;
		q 							: out std_logic := '0'
);
end COMPONENT;
----------------------------------------------------
COMPONENT MUX21 is
  port(
       A, B, S: in std_logic;
       O: out std_logic);
 end COMPONENT;
----------------------------------------------------
SIGNAL CLEAR:std_logic;
SIGNAL Q, D: std_logic_vector(9 downto 0);

BEGIN

CLEAR <= CLR;

MUX1:  MUX21 PORT MAP(Q(0), I(0), EN, D(0));
MUX2:  MUX21 PORT MAP(Q(1), I(1), EN, D(1));
MUX3:  MUX21 PORT MAP(Q(2), I(2), EN, D(2));
MUX4:  MUX21 PORT MAP(Q(3), I(3), EN, D(3));
MUX5:  MUX21 PORT MAP(Q(4), I(4), EN, D(4));
MUX6:  MUX21 PORT MAP(Q(5), I(5), EN, D(5));
MUX7:  MUX21 PORT MAP(Q(6), I(6), EN, D(6));
MUX8:  MUX21 PORT MAP(Q(7), I(7), EN, D(7));
MUX9:  MUX21 PORT MAP(Q(8), I(8), EN, D(8));
MUX10: MUX21 PORT MAP(Q(9), I(9), EN, D(9));

FFD1: FFD PORT MAP (CLK, D(0), '0', CLEAR, Q(0));
FFD2: FFD PORT MAP (CLK, D(1), '0', CLEAR, Q(1));
FFD3: FFD PORT MAP (CLK, D(2), '0', CLEAR, Q(2));
FFD4: FFD PORT MAP (CLK, D(3), '0', CLEAR, Q(3));
FFD5: FFD PORT MAP (CLK, D(4), '0', CLEAR, Q(4));
FFD6: FFD PORT MAP (CLK, D(5), '0', CLEAR, Q(5));
FFD7: FFD PORT MAP (CLK, D(6), '0', CLEAR, Q(6));
FFD8: FFD PORT MAP (CLK, D(7), '0', CLEAR, Q(7));
FFD9: FFD PORT MAP (CLK, D(8), '0', CLEAR, Q(8));
FFD10: FFD PORT MAP (CLK, D(9), '0', CLEAR, Q(9));

O <= Q;

end logica;