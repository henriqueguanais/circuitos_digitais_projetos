library ieee;
use ieee.std_logic_1164.all;

entity ckt is
    port (SW: in  std_logic_vector(7 downto 0);
	  HEX0,HEX1,HEX2: out std_logic_vector(6 downto 0));
	 
end ckt;

architecture log of ckt is

component C1 is
    port (a3,a2,a1,a0: in  std_logic;
            s1_3,s1_2,s1_1,s1_0: out std_logic);
end component;

component BCD_7SEG is
    port (w,x,y,z: in  std_logic;
            a,b,c,d,e,f,g: out std_logic);
end component;

signal s1,s2,s3,s4,s6: std_logic_vector(3 downto 0); 
signal bcd: std_logic_vector(11 downto 0);
begin
    
    bcd(11) <= '0';
    bcd(10) <= '0';
    bcd(0) <= SW(0);

    U1: C1 port map('0',SW(7),SW(6),SW(5),s1(3),s1(2),s1(1),s1(0));
    U2: C1 port map(s1(2), s1(1), s1(0), SW(4), s2(3),s2(2),s2(1),s2(0));
    U3: C1 port map(s2(2), s2(1), s2(0), SW(3), s3(3),s3(2),s3(1),s3(0));
    U4: C1 port map(s3(2), s3(1), s3(0), SW(2), s4(3),s4(2),s4(1),s4(0));
    U5: C1 port map(s4(2), s4(1), s4(0), SW(1), bcd(4),bcd(3),bcd(2),bcd(1));
    U6: C1 port map('0', s1(3), s2(3), s3(3), bcd(9),s6(2),s6(1),s6(0));
    U7: C1 port map(s6(2), s6(1), s6(0), s4(3), bcd(8),bcd(7),bcd(6),bcd(5));

    U8: BCD_7SEG port map(bcd(3),bcd(2),bcd(1),bcd(0),HEX0(0),HEX0(1),HEX0(2),HEX0(3),HEX0(4),HEX0(5),HEX0(6));
    U9: BCD_7SEG port map(bcd(7),bcd(6),bcd(5),bcd(4),HEX1(0),HEX1(1),HEX1(2),HEX1(3),HEX1(4),HEX1(5),HEX1(6));
    U10: BCD_7SEG port map(bcd(11),bcd(10),bcd(9),bcd(8),HEX2(0),HEX2(1),HEX2(2),HEX2(3),HEX2(4),HEX2(5),HEX2(6));
 
end log;
