library ieee;
use ieee.std_logic_1164.all;

entity acumulador is
    port (clear, clk, cond_x: in std_logic; --clear=0 para zerar      cond_x=1 para habilitar
          num_moedas: out std_logic_vector(9 downto 0));
end acumulador;

architecture ckt of acumulador is

component cont_updw_withload is
    port (up_dw, clk, en, pl: in std_logic; --0:up 1:dw     en=1:pause count    pl=0:load p
          P : in std_logic_vector(9 downto 0);
          count: out std_logic_vector(9 downto 0));
end component;

signal en, pl : std_logic;

begin
  
  en <= not cond_x;
  pl <= clear;
  
  CONT : cont_updw_withload port map('0', clk, en, pl, "0000000000", num_moedas);
  
end ckt;
