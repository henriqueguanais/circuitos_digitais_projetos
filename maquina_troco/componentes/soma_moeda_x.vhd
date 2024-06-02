library ieee;
use ieee.std_logic_1164.all;

entity somar_moeda_x is 
	port( Troco, V_troco : in std_logic_vector(9 downto 0);
	        soma: out std_logic_vector(5 downto 0));
end somar_moeda_x;

architecture log of somar_moeda_x is

component soma_10 is 
	port( A, B: in std_logic_vector(9 downto 0);
	         O: out std_logic_vector(9 downto 0);
	      Cout: out std_logic);
end component;

component Comparator10 is
    Port (
        A : in  STD_LOGIC_VECTOR(9 downto 0);
        B : in  STD_LOGIC_VECTOR(9 downto 0);
        A_gt_B : out STD_LOGIC
    );
end component;

signal Trocoaux100, Trocoaux50, Trocoaux25, Trocoaux10, Trocoaux5, Trocoaux1: std_logic_vector(9 downto 0);
signal somaaux: std_logic_vector(5 downto 0);
begin

troco_M100: soma_10 port map( Troco,"0001100100", Trocoaux100);
compara100: Comparator10 port map (Trocoaux100, V_troco,  somaaux(5));


troco_M50: soma_10 port map( Troco, "0000110010", Trocoaux50);
compara50: Comparator10 port map (Trocoaux50, V_troco,  somaaux(4));

troco_M25: soma_10 port map( Troco, "0000011001", Trocoaux25);
compara25: Comparator10 port map (Trocoaux25, V_troco, somaaux(3));

troco_M10: soma_10 port map( Troco, "0000001010", Trocoaux10);
compara10: Comparator10 port map (Trocoaux10, V_troco,  somaaux(2));

troco_M5: soma_10 port map( Troco, "0000000101", Trocoaux5);
compara5: Comparator10 port map (Trocoaux5, V_troco, somaaux(1));

troco_M1: soma_10 port map( Troco, "0000000001", Trocoaux1);
compara1: Comparator10 port map (Trocoaux1, V_troco, somaaux(0));

soma <= not somaaux;

end log;	

