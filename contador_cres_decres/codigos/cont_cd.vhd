library ieee;
use ieee.std_logic_1164.all;

entity cont_cd is
    port (up_dw_cont, clk_cont, clr_cont: in std_logic;
          cont_resut: out std_logic_vector(3 downto 0));
end cont_cd;

architecture log of cont_cd is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal and_1, and_2, and_3, and_4, and_5, and_6, or_1, or_2, or_3: std_logic := '0';
signal Q_cont: std_logic_vector(3 downto 0) := (OTHERS => '0');
signal JK_cont: std_logic_vector(3 downto 0) := (OTHERS => '0');

begin

    and_1 <= up_dw_cont and Q_cont(0);
    and_2 <= not up_dw_cont and not Q_cont(0);
    and_3 <= up_dw_cont and Q_cont(0) and Q_cont(1);
    and_4 <= not up_dw_cont and not Q_cont(0) and not Q_cont(1);
    and_5 <= up_dw_cont and Q_cont(0) and Q_cont(1) and Q_cont(2);
    and_6 <= not up_dw_cont and not Q_cont(0) and not Q_cont(1) and not Q_cont(2);

    or_1 <= and_1 or and_2;
    or_2 <= and_3 or and_4;
    or_3 <= and_5 or and_6;

    JK_cont(0) <= '1';
    JK_cont(1) <= or_1;
    JK_cont(2) <= or_2;
    JK_cont(3) <= or_3;
    
    Q0:ffjk port map(clk_cont, clr_cont, '1', JK_cont(0), JK_cont(0), Q_cont(0));
    Q1:ffjk port map(clk_cont, clr_cont, '1', JK_cont(1), JK_cont(1), Q_cont(1));
    Q2:ffjk port map(clk_cont, clr_cont, '1', JK_cont(2), JK_cont(2), Q_cont(2));
    Q3:ffjk port map(clk_cont, clr_cont, '1', JK_cont(3), JK_cont(3), Q_cont(3));

    cont_resut <= Q_cont;
    
end log;