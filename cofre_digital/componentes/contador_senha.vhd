library ieee;
use ieee.std_logic_1164.all;

entity cont_senha is
    port (s_cont: in  std_logic_vector(2 downto 0);
	      add_cont, clk_cont: in std_logic;
          cont_end: out std_logic);
end cont_senha;

architecture log of cont_senha is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal and_1, clr_FFJK: std_logic;
signal Q_FFJK: std_logic_vector(1 downto 0);

begin

    and_1 <= not s_cont(0) and s_cont(1) and not s_cont(2);
    clr_FFJK <= and_1 and add_cont;

    Q0: ffjk port map(clk_cont, clr_FFJK, '1', '1', '1', Q_FFJK(0));
    Q1: ffjk port map(clk_cont, clr_FFJK, '1', Q_FFJK(0), Q_FFJK(0), Q_FFJK(1));

    cont_end <= Q_FFJK(0) and Q_FFJK(1);

end log;
