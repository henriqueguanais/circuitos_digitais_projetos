library ieee;
use ieee.std_logic_1164.all;

entity marcapasso is
   port (clk, SW_clock, KEY: in std_logic;
         SW_coracao: in std_logic_vector(1 downto 0);
         LEDG, LEDR: out std_logic_vector(1 downto 0);
         LED_clock: out std_logic);
end marcapasso;

architecture logica of marcapasso is

component temporizador is
      port (clk_timer, clr_timer: in std_logic;
                  tmr_10, tmr_40: out std_logic;
                  cont_result: out std_logic_vector(5 downto 0));
end component;

component temporizador_marca is
    port (clk_timer, clr_timer: in std_logic;
          tmr_11, tmr_41: out std_logic;
          cont_result: out std_logic_vector(5 downto 0));
end component;

component coracao is
      port (clk: in std_logic;
            SW_coracao: in std_logic_vector(1 downto 0);
            sa, sv: out std_logic);
end component;

component mde is
      port (ck, rst, sa, za, sv, zv: in  std_logic;
            pa, ta, pv, tv: out  std_logic;
                     q: out std_logic_vector(2 downto 0));
end component;

component ck_div is
      port (ck_in : in  std_logic;
            ck_out: out std_logic);
end component;

component ck_100 is
      port (ck_in : in  std_logic;
            ck_out: out std_logic);
end component;

      signal clk_normal, clk_aux1, clk_aux2, clk_100, clk_marca, sa, sv, pa, clr_timerA, pv, clr_timerV: std_logic;
      signal tmr_10_A, tmr_40_A, tmr_10_V, tmr_40_V: std_logic;
      signal estado: std_logic_vector(2 downto 0);
      signal cont_resultA: std_logic_vector(5 downto 0);
      signal cont_resultV: std_logic_vector(5 downto 0);
      
begin 

      clock_normal: ck_div port map(clk, clk_aux1);
      clock_100: ck_100 port map(clk, clk_aux2);

      clk_marca <= (clk_aux1 and not SW_clock) or (clk_aux2 and SW_clock);

      LED_clock <= clk_marca;

      mde_marca: mde port map(clk_marca, not(KEY), sa, tmr_10_A, sv, tmr_40_V, pa, clr_timerA, pv, clr_timerV, estado);
      temporizadorA: temporizador_marca port map(clk_marca, clr_timerA, tmr_10_A, tmr_40_A, cont_resultA);
      temporizadorV: temporizador_marca port map(clk_marca, clr_timerV, tmr_10_V, tmr_40_v, cont_resultV);
      coracao_marca: coracao port map(clk_marca, SW_coracao, sa, sv);

      LEDG(1) <= pv;
      LEDG(0) <= pa;
      LEDR(1) <= sv;
      LEDR(0) <= sa;
   
end logica;