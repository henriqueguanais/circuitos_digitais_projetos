library ieee;
use ieee.std_logic_1164.all;

entity cont_decrescente is
    port (clear, clk, cont: in std_logic; --clear=0 para zerar      cont=1 para habilitar a contagem
          num_moedas: in std_logic_vector(9 downto 0);      --num_moedas automaticamente carregado para o contador, exceto quando clear==0
          i_x : out std_logic);
end cont_decrescente;

architecture ckt of cont_decrescente is

component cont_updw_withload is
    port (up_dw, clk, en, pl: in std_logic; --0:up 1:dw     en=1:pause count    pl=0:load p
          P : in std_logic_vector(9 downto 0);
          count: out std_logic_vector(9 downto 0));
end component;

component Mux_2x1_10 is
		port( B,A         : in  std_logic_vector (9 downto 0);
		      S0   	      : in  std_logic;
				M           : out std_logic_vector (9 downto 0));				    
end component;

signal en, pl, cont_igual_0 : std_logic;
signal p_aux, saida_cont : std_logic_vector(9 downto 0);

begin
  
  --sinal aux que fica igual a 1 quando a saida do contador chega a 0
  cont_igual_0 <= not saida_cont(0) and not saida_cont(1) and not saida_cont(2) and not saida_cont(3) and not saida_cont(4) and not saida_cont(5) and not saida_cont(6) and not saida_cont(7) and not saida_cont(8) and not saida_cont(9);
  
  --contagem habilitada (en=0) apenas quando cont==1 e a contagem ainda nao chegou em 0
  en <= (not cont and not cont_igual_0) or (not cont and cont_igual_0) or (cont and cont_igual_0);
  pl <= cont;
  
  MUX_CLR : Mux_2x1_10 port map(num_moedas, "0000000000", clear, p_aux);
  
  CONTA : cont_updw_withload port map('1', clk, en, pl, p_aux, saida_cont);
  
  --saida habilitada enquanto contagem esta habilitada (en==0) 
  i_x <= not en;
  
end ckt;
