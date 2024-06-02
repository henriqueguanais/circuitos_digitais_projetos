library ieee;
use ieee.std_logic_1164.all;

entity cont_updw_withload is
    port (up_dw, clk, en, pl: in std_logic; --0:up 1:dw     en=1:pause count    pl=0:load p
          P : in std_logic_vector(9 downto 0);
          count: out std_logic_vector(9 downto 0));
end cont_updw_withload;

architecture ckt of cont_updw_withload is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal Q: std_logic_vector(9 downto 0) := (OTHERS => '0');
signal JK: std_logic_vector(9 downto 0) := (OTHERS => '0');
signal SET, CLR: std_logic_vector(9 downto 0);

begin
    
    JK(0) <= not en;
    JK(1) <= not en and ((not up_dw and Q(0)) or (up_dw and not Q(0)));
    JK(2) <= not en and ((not up_dw and Q(0) and Q(1)) or (up_dw and not Q(0) and not Q(1)));
    JK(3) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2)) or (up_dw and not Q(0) and not Q(1) and not Q(2)));
    JK(4) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3)));
    JK(5) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4)));
    JK(6) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5)));
    JK(7) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5) and not Q(6)));
    JK(8) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6) and Q(7)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5) and not Q(6) and not Q(7)));
    JK(9) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6) and Q(7) and Q(8)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5) and not Q(6) and not Q(7) and not Q(8)));

    SET(0) <= not pl nand P(0);
    SET(1) <= not pl nand P(1);
    SET(2) <= not pl nand P(2);
    SET(3) <= not pl nand P(3);
    SET(4) <= not pl nand P(4);
    SET(5) <= not pl nand P(5);
    SET(6) <= not pl nand P(6);
    SET(7) <= not pl nand P(7);
    SET(8) <= not pl nand P(8);
    SET(9) <= not pl nand P(9);
    
    CLR(0) <= not pl nand not P(0);
    CLR(1) <= not pl nand not P(1);
    CLR(2) <= not pl nand not P(2);
    CLR(3) <= not pl nand not P(3);
    CLR(4) <= not pl nand not P(4);
    CLR(5) <= not pl nand not P(5);
    CLR(6) <= not pl nand not P(6);
    CLR(7) <= not pl nand not P(7);
    CLR(8) <= not pl nand not P(8);
    CLR(9) <= not pl nand not P(9);
    
    Q0:ffjk port map(clk, CLR(0), SET(0), JK(0), JK(0), Q(0));
    Q1:ffjk port map(clk, CLR(1), SET(1), JK(1), JK(1), Q(1));
    Q2:ffjk port map(clk, CLR(2), SET(2), JK(2), JK(2), Q(2));
    Q3:ffjk port map(clk, CLR(3), SET(3), JK(3), JK(3), Q(3));
    Q4:ffjk port map(clk, CLR(4), SET(4), JK(4), JK(4), Q(4));
    Q5:ffjk port map(clk, CLR(5), SET(5), JK(5), JK(5), Q(5));
    Q6:ffjk port map(clk, CLR(6), SET(6), JK(6), JK(6), Q(6));
    Q7:ffjk port map(clk, CLR(7), SET(7), JK(7), JK(7), Q(7));
    Q8:ffjk port map(clk, CLR(8), SET(8), JK(8), JK(8), Q(8));
    Q9:ffjk port map(clk, CLR(9), SET(9), JK(9), JK(9), Q(9));
    
    count <= Q;
    

end ckt;

-----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity cont_updw is
    port (up_dw, clk, clr, en: in std_logic; --0:up 1:dw en=1:pause count
          count: out std_logic_vector(9 downto 0));
end cont_updw;

architecture ckt of cont_updw is

component ffjk is
    port (ck, clr, set, j, k : in  std_logic;
                            q : out std_logic);
end component;

signal Q: std_logic_vector(9 downto 0) := (OTHERS => '0');
signal JK: std_logic_vector(9 downto 0) := (OTHERS => '0');

begin
    
    JK(0) <= not en;
    JK(1) <= not en and ((not up_dw and Q(0)) or (up_dw and not Q(0)));
    JK(2) <= not en and ((not up_dw and Q(0) and Q(1)) or (up_dw and not Q(0) and not Q(1)));
    JK(3) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2)) or (up_dw and not Q(0) and not Q(1) and not Q(2)));
    JK(4) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3)));
    JK(5) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4)));
    JK(6) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5)));
    JK(7) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5) and not Q(6)));
    JK(8) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6) and Q(7)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5) and not Q(6) and not Q(7)));
    JK(9) <= not en and ((not up_dw and Q(0) and Q(1) and Q(2) and Q(3) and Q(4) and Q(5) and Q(6) and Q(7) and Q(8)) or (up_dw and not Q(0) and not Q(1) and not Q(2) and not Q(3) and not Q(4) and not Q(5) and not Q(6) and not Q(7) and not Q(8)));

    Q0:ffjk port map(clk, clr, '1', JK(0), JK(0), Q(0));
    Q1:ffjk port map(clk, clr, '1', JK(1), JK(1), Q(1));
    Q2:ffjk port map(clk, clr, '1', JK(2), JK(2), Q(2));
    Q3:ffjk port map(clk, clr, '1', JK(3), JK(3), Q(3));
    Q4:ffjk port map(clk, clr, '1', JK(4), JK(4), Q(4));
    Q5:ffjk port map(clk, clr, '1', JK(5), JK(5), Q(5));
    Q6:ffjk port map(clk, clr, '1', JK(6), JK(6), Q(6));
    Q7:ffjk port map(clk, clr, '1', JK(7), JK(7), Q(7));
    Q8:ffjk port map(clk, clr, '1', JK(8), JK(8), Q(8));
    Q9:ffjk port map(clk, clr, '1', JK(9), JK(9), Q(9));
    
    count <= Q;
    

end ckt;

-----------------------------------------------------------------------------------



