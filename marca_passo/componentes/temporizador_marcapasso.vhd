library ieee;
use ieee.std_logic_1164.all;

entity temporizador_marca is
    port (clk_timer, clr_timer: in std_logic;
          tmr_11, tmr_41: out std_logic;
          cont_result: out std_logic_vector(5 downto 0));
end temporizador_marca;

architecture log of temporizador_marca is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal Q: std_logic_vector(5 downto 0) := "000000";
signal JK: std_logic_vector(5 downto 0) := "000000";

begin

    JK(0) <= '1';
    JK(1) <= Q(0);
    JK(2) <= Q(0) and Q(1);
    JK(3) <= Q(0) and Q(1) and Q(2);
    JK(4) <= Q(0) and Q(1) and Q(2) and Q(3);
    JK(5) <= Q(0) and Q(1) and Q(2) and Q(3) and Q(4);

    Q0: ffjk port map(clk_timer, clr_timer, '1', JK(0), JK(0), Q(0));
    Q1: ffjk port map(clk_timer, clr_timer, '1', JK(1), JK(1), Q(1));
    Q2: ffjk port map(clk_timer, clr_timer, '1', JK(2), JK(2), Q(2));
    Q3: ffjk port map(clk_timer, clr_timer, '1', JK(3), JK(3), Q(3));
    Q4: ffjk port map(clk_timer, clr_timer, '1', JK(4), JK(4), Q(4));
    Q5: ffjk port map(clk_timer, clr_timer, '1', JK(5), JK(5), Q(5));

    tmr_41 <= Q(5) and not Q(4) and Q(3) and not Q(2) and not Q(1) and Q(0);
    tmr_11 <= not Q(5) and not Q(4) and Q(3) and not Q(2) and Q(1) and Q(0);

    cont_result <= Q;

end log;
