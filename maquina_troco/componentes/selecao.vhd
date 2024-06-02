library ieee;
use ieee.std_logic_1164.all;

entity selecao_moedas is 
	port(condicao: in std_logic_vector(6 downto 0);
			selecao: out std_logic_vector(2 downto 0));
end selecao_moedas;

architecture log of selecao_moedas is

begin

selecao(2) <= condicao(6) or condicao(5) or condicao(4) or condicao(3);
selecao(1) <= condicao(6) or condicao(5) or condicao(2) or condicao(1);
selecao(0) <= condicao(6) or condicao(4) or condicao(2) or condicao(0);

end log;	


