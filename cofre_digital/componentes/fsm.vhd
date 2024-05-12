library ieee;
use ieee.std_logic_1164.all;

entity mde is
   port (ck, rst, pwr, add, pwd_len, pwd_cmp, tm5, tm20  : in  std_logic;
                  q : out std_logic_vector(2 downto 0));
end mde;

architecture logica of mde is
  type st is (F, I, V, S, C, A);  
  signal estado : st;  
                          
begin
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= F;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when F =>                         
          if pwr = '1' then estado <= I; 
          else            estado <= F; 
          end if;
        when I =>                         
          if tm5 = '1' then estado <= V; 
          else            estado <= I;
          end if;
        when V =>                         
          if add = '1' and pwr = '0' then estado <= S;
          elsif pwr = '1' then estado <= C;
          else            estado <= V; 
          end if;
        when S =>                         
          if tm5 = '1' and pwd_len = '0' then estado <= V;
          elsif tm5 = '1' and pwd_len = '1' and pwd_cmp = '0' then estado <= F;
          elsif tm5 = '1' and pwd_len = '1' and pwd_cmp = '1' then estado <= A;
          else            estado <= S;
          end if;
        when C =>                         
          if tm5 = '1' then estado <= F;
          else            estado <= C; 
          end if;
        when A =>                         
          if tm20 = '1' then estado <= F;
          else            estado <= A; 
          end if;
       end case;
    end if;
  end process;
  with estado select  
    q <= "000" when F,
         "001" when I, 
         "010" when V, 
         "011" when S,
         "100" when C,
         "101" when A; 
end logica; 
