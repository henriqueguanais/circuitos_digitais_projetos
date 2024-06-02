library ieee;
use ieee.std_logic_1164.all;

entity soma_10 is 
	port( A, B: in std_logic_vector(9 downto 0);
	         O: out std_logic_vector(9 downto 0);
	      Cout: out std_logic);
end soma_10;

architecture log of soma_10 is

component soma is
  port (A, B, Cin: in std_logic;
	  O, Cout: out std_logic);
end component;

  signal aux0 : std_logic;
  signal aux1 : std_logic;
  signal aux2 : std_logic;
  signal aux3 : std_logic;
  signal aux4 : std_logic;
  signal aux5 : std_logic;
  signal aux6 : std_logic;
  signal aux7 : std_logic;
  signal aux8 : std_logic;
 

begin
	
    X1: soma port map(A(0), B(0), '0', O(0), aux0);
    X2: soma port map(A(1), B(1), aux0, O(1), aux1);
    X3: soma port map(A(2), B(2), aux1, O(2), aux2);
    X4: soma port map(A(3), B(3), aux2, O(3), aux3);
    X5: soma port map(A(4), B(4), aux3, O(4), aux4);
    X6: soma port map(A(5), B(5), aux4, O(5), aux5);
    X7: soma port map(A(6), B(6), aux5, O(6), aux6);
    X8: soma port map(A(7), B(7), aux6, O(7), aux7);
    X9: soma port map(A(8), B(8), aux7, O(8), aux8);
   X10: soma port map(A(9), B(9), aux8, O(9), Cout);
 
end log;