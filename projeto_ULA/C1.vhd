library ieee;
use ieee.std_logic_1164.all;

entity C1 is
    port (a3,a2,a1,a0: in  std_logic;
            s1_3,s1_2,s1_1,s1_0: out std_logic);
end C1;

architecture log of C1 is

begin
    s1_3 <= a3 or (a2 and a0) or (a2 and a1);
    s1_2 <= (a2 and not(a1) and not(a0)) or (a3 and a0);
    s1_1 <= (a1 and a0) or (a3 and not(a0)) or (not(a2) and a1); 
    s1_0 <= (a3 and not(a0)) or (not(a3) and not(a2) and a0) or (a2 and a1 and not(a0));

end log;
