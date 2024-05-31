library ieee;
use ieee.std_logic_1164.all;

entity maquina_troco is
    port(T, clk: in std_logic;
         V: in std_logic_vector(9 downto 0);
         moedas: in std_logic_vector(5 downto 0);
         ix: out std_logic_vector(5 downto 0);
		 L: out std_logic);
end maquina_troco;

architecture log of maquina_troco is

    component mde is
        port(ck, rst, T, TemTroco, troco_liberado: in  std_logic;
             condicao: in std_logic_vector(6 downto 0);
             q: out std_logic_vector(1 downto 0));
     end component;

    component saida_L is
		port(   estado: in  std_logic_vector (1 downto 0);
                clk_L: in  std_logic;
			    L: out  std_logic);
    component saida_L;

    component acumulador is
        port (clear, clk, cond_x: in std_logic; 
              num_moedas: out std_logic_vector(9 downto 0));
    end component;

    component cont_decrescente is
        port (clear, clk, cont: in std_logic; 
              num_moedas: in std_logic_vector(9 downto 0);      
              i_x : out std_logic);
    end component;

    

begin
    
		
end log;