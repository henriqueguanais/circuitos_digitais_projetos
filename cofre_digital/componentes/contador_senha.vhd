library ieee;
use ieee.std_logic_1164.all;

entity cont_senha is
    port (s_cont: in  std_logic_vector(2 downto 0);
	      add_cont, clk_cont: in std_logic;
          cont_end: out std_logic;
          cont_result: out std_logic_vector(1 downto 0));
end cont_senha;

architecture log of cont_senha is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal and_1, and_2, clr_FFJK: std_logic := '0';
signal Q_FFJK: std_logic_vector(1 downto 0);

begin

    and_1 <= not s_cont(2) and s_cont(1) and not s_cont(0);
    and_2 <= not s_cont(2) and s_cont(1) and s_cont(0);
    clr_FFJK <= and_1 or and_2;

    Q0: ffjk port map(add_cont, clr_FFJK, '1', '1', '1', Q_FFJK(0));
    Q1: ffjk port map(add_cont, clr_FFJK, '1', Q_FFJK(0), Q_FFJK(0), Q_FFJK(1));

    cont_end <= Q_FFJK(0) and Q_FFJK(1);
    cont_result <= Q_FFJK;

end log;
