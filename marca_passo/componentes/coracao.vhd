library ieee;
use ieee.std_logic_1164.all;

entity coracao is
   port (clk: in std_logic;
         SW_coracao: in std_logic_vector(1 downto 0);
         sa, sv: out std_logic);
end coracao;

architecture logica of coracao is

component temporizador is
    port (clk_timer, clr_timer: in std_logic;
            tmr_10, tmr_40: out std_logic;
            cont_result: out std_logic_vector(5 downto 0));
end component;

component mde_coracao is
    port (ck, rst, za, zv: in  std_logic;
          ta, tv, sa, sv: out  std_logic;
                   q: out std_logic_vector(2 downto 0));
end component;

    signal clr_timerA, clr_timerV: std_logic := '0';
    signal tmr_10_A, tmr_40_A, tmr_10_V, tmr_40_V: std_logic;
    signal cont_resultA: std_logic_vector(5 downto 0);
    signal cont_resultV: std_logic_vector(5 downto 0);
    signal estado: std_logic_vector(2 downto 0);
    signal sa_mde, sv_mde: std_logic;

begin 

    mde_cor: mde_coracao port map(clk, '0', tmr_10_A, tmr_40_V, clr_timerA, clr_timerV, sa_mde, sv_mde, estado);
    temporizadorA: temporizador port map(clk, clr_timerA, tmr_10_A, tmr_40_A, cont_resultA);
    temporizadorV: temporizador port map(clk, clr_timerV, tmr_10_V, tmr_40_V, cont_resultV);

    sa <= sa_mde and SW_coracao(0);
    sv <= sv_mde and SW_coracao(1);
   
end logica;