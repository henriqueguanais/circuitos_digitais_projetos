library ieee;
use ieee.std_logic_1164.all;

entity timer is
    port (s_timer: in  std_logic_vector(2 downto 0);
	      cont_end_t, clk_timer: in std_logic;
          tmr_5, tmr_20: out std_logic);
end timer;

architecture log of timer is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal clr_timer, tmr_25, and_1, and_2: std_logic := '0';
signal Q: std_logic_vector(4 downto 0) := "00000";
signal JK: std_logic_vector(4 downto 0) := "00000";

begin

    clr_timer <= (not s_timer(2) and not s_timer(1) and s_timer(0)) or (not s_timer(2) and s_timer(1) and s_timer(0)) 
    or (s_timer(2) and not s_timer(1) and not s_timer(0)) or (s_timer(2) and not s_timer(1) and s_timer(0));

    JK(0) <= '1';
    JK(1) <= Q(0);
    JK(2) <= Q(0) and Q(1);
    JK(3) <= Q(0) and Q(1) and Q(2);
    JK(4) <= Q(0) and Q(1) and Q(2) and Q(3);

    Q0: ffjk port map(clk_timer, clr_timer, '1', JK(0), JK(0), Q(0));
    Q1: ffjk port map(clk_timer, clr_timer, '1', JK(1), JK(1), Q(1));
    Q2: ffjk port map(clk_timer, clr_timer, '1', JK(2), JK(2), Q(2));
    Q3: ffjk port map(clk_timer, clr_timer, '1', JK(3), JK(3), Q(3));
    Q4: ffjk port map(clk_timer, clr_timer, '1', JK(4), JK(4), Q(4));


    tmr_5 <= not Q(4) and not Q(3) and Q(2) and not Q(1) and Q(0);

    tmr_25 <= Q(4) and Q(3) and not Q(2) and not Q(1) and Q(0);
    and_1 <= Q(4) and not Q(3) and Q(2) and not Q(1) and not Q(0);
    and_2 <= and_1 and not cont_end_t;

    tmr_20 <= and_2 or tmr_25;

end log;
