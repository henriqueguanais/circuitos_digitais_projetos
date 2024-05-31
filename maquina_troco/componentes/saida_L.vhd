library ieee;
use ieee.std_logic_1164.all;

entity saida_L is
		port(   estado: in  std_logic_vector (1 downto 0);
                clk_L: in  std_logic;
			    L: out  std_logic);
end saida_L;

architecture ckt of saida_L is

    component ffjk is
        port (ck, clr, set, j, k : in  std_logic;
                               q : out std_logic);
    end component;

    signal clr_L, Q_FFJK: std_logic;

begin
    clr_L <= estado(1) and estado(0);

    FFJK1: ffjk port map(clk_L, clr_L, '1', '1', '1', Q_FFJK);

    L <= '0' or (not estado(1) and estado(0)) or (estado(1) and not estado(0)) or Q_FFJK;
		
end ckt;