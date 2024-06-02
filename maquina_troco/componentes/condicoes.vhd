library ieee;
use ieee.std_logic_1164.all;

entity condicoes_moeda is 
	port( soma, Moedas: in std_logic_vector(5 downto 0);
	        condicao: out std_logic_vector(6 downto 0));
end condicoes_moeda;

architecture log of condicoes_moeda is

signal cond100aux,cond50aux, cond25aux, cond10aux, cond5aux: std_logic ;
begin
cond100aux <= soma (5) and Moedas(5);
cond50aux <= not cond100aux and soma (4) and Moedas(4);
cond25aux <= not cond100aux and not cond50aux and soma (3) and Moedas(3);
cond10aux <= not cond100aux and not cond50aux and not cond25aux and soma (2) and Moedas(2); 
cond5aux <= not cond100aux and not cond50aux and not cond25aux and not cond10aux and soma (1) and Moedas(1);

condicao(6) <= cond100aux;
condicao(5) <= cond50aux;
condicao(4) <= cond25aux ;
condicao(3) <= cond10aux;
condicao(2) <= cond5aux;
condicao(1) <=not cond100aux and not cond50aux and not cond25aux and not cond10aux and not cond5aux and soma (0) and Moedas(0);
condicao(0) <=( not Moedas(5) and not Moedas(4) and not Moedas(3) and not Moedas(2) and not Moedas(1) and not Moedas(0)) or
              ( not(Moedas(5) and soma(5)) and not(Moedas(4) and soma(4)) and not(Moedas(3) and soma(3)) and not(Moedas(2) and 
			  soma(2)) and not(Moedas(1) and soma(1)) and not(Moedas(0) and soma(0))) ;
end log;	

