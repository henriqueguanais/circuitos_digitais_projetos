library ieee;
use ieee.std_logic_1164.all;

entity marcapasso is
   port (clk, SW_clock, KEY: in std_logic;
         SW_coracao: in std_logic_vector(1 downto 0);
         LEDG, LEDR: out std_logic_vector(1 downto 0);
         LED_clock: out std_logic_vector(1 downto 0));
end marcapasso;

architecture logica of marcapasso is

begin 
   
end logica;