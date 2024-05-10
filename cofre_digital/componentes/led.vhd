library ieee;
use ieee.std_logic_1164.all;

entity led is
    port (s_led: in  std_logic_vector(2 downto 0);
          LEDR_cp, LEDB_cp, LEDG_cp: out std_logic);
end led;

architecture log of led is

begin
    LEDR_cp <= ('1' and not s_led(2) and not s_led(1) and not s_led(0)) or ('1' and not s_led(2) and s_led(1) and not s_led(0))
            or ('1' and s_led(2) and not s_led(1) and not s_led(0));
    
    LEDB_cp <= ('1' and not s_led(2) and not s_led(1) and s_led(0)) or ('1' and not s_led(2) and s_led(1) and s_led(0));
        
    LEDG_cp <= ('1' and s_led(2) and not s_led(1) and s_led(0));

end log;
