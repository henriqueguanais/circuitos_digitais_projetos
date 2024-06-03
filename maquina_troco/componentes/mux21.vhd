library ieee;
use ieee.std_logic_1164.all;

entity MUX21 is
  port(
       A, B, S		: in std_logic;
       O				: out std_logic);
end MUX21;

architecture logica of MUX21 is

begin

    O <= (B and S) or (A and (not S));

end logica;