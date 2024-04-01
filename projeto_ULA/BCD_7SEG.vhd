library ieee;
use ieee.std_logic_1164.all;

entity BCD_7SEG is
    port (w,x,y,z: in  std_logic;
            a,b,c,d,e,f,g: out std_logic);
end BCD_7SEG;

architecture log of BCD_7SEG is

begin
    
    a <= y or w or (x and z) or (not(x) and not(z));
    b <= not(x) or (not(y) and not(z)) or (y and z);
    c <= not(y) or z or x;
    d <= w or (y and not(z)) or (not(x) and y) or (not(x) and not(z)) or (x and not(y) and z);
    e <= (y and not(z)) or (not(x) and not(z));
    f <= x or w or (not(y) and not(z));
    g <= w or (y and not(z)) or (x and not(y)) or (not(x) and y);

end log;
