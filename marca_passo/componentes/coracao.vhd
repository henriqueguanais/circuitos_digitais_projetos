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

    signal clr_timer1, clk_timer2: std_logic := '0';
    signal tmr_10_1, tmr_40_1, tmr_10_2, tmr_40_2: std_logic;
    signal cont_result1: std_logic_vector(5 downto 0);
    signal cont_result2: std_logic_vector(5 downto 0);

begin 

    temporizador1: temporizador port map(clk, clr_timer1, tmr_10_1, tmr_40_1, cont_result1);
    temporizador2: temporizador port map(clk, clr_timer2, tmr_10_2, tmr_40_2, cont_result2);

   
end logica;