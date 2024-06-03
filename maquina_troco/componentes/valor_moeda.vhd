library ieee;
use ieee.std_logic_1164.all;

entity mux81_7Bit is
Port(
    A, B, C, D, E, F, G, H : in std_logic_vector(6 downto 0);
    Key : in std_logic_vector (2 downto 0);
    S : out std_logic_vector(6 downto 0)
);
end mux81_7Bit;

architecture logica of mux81_7Bit is
begin
    S(0) <= (A(0) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(0) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(0) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(0) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(0) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(0) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(0) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(0) and (Key(2) and Key(1) and Key(0)));

    S(1) <= (A(1) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(1) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(1) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(1) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(1) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(1) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(1) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(1) and (Key(2) and Key(1) and Key(0)));

    S(2) <= (A(2) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(2) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(2) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(2) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(2) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(2) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(2) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(2) and (Key(2) and Key(1) and Key(0)));

    S(3) <= (A(3) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(3) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(3) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(3) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(3) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(3) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(3) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(3) and (Key(2) and Key(1) and Key(0)));

    S(4) <= (A(4) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(4) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(4) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(4) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(4) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(4) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(4) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(4) and (Key(2) and Key(1) and Key(0)));

    S(5) <= (A(5) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(5) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(5) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(5) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(5) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(5) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(5) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(5) and (Key(2) and Key(1) and Key(0)));

    S(6) <= (A(6) and (not(Key(2)) and not(Key(1)) and not(Key(0)))) or
            (B(6) and (not(Key(2)) and not(Key(1)) and Key(0))) or
            (C(6) and (not(Key(2)) and Key(1)) and not(Key(0))) or
            (D(6) and (not(Key(2)) and Key(1) and Key(0))) or
            (E(6) and (Key(2) and not(Key(1)) and not(Key(0)))) or
            (F(6) and (Key(2) and not(Key(1)) and Key(0))) or
            (G(6) and (Key(2) and Key(1) and not(Key(0)))) or
            (H(6) and (Key(2) and Key(1) and Key(0)));

end logica;