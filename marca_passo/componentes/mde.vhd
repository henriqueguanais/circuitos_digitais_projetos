library ieee;
use ieee.std_logic_1164.all;

entity mde is
   port (ck, rst, sa, za, sv, zv: in  std_logic;
         pa, ta, pv, tv: in  std_logic;
                  q: out std_logic_vector(3 downto 0));
end mde;

architecture logica of mde is
  type st is (I, M, NT, TT);  
  signal estado : st;  
                          
begin
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= I;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when I =>                         
          if T = '0' then estado <= I; 
          else estado <= M; 
          end if;
        when M =>                         
          if condicao(0) = '0' then estado <= M; 
          elsif TemTroco = '0' then estado <= NT;
          else estado <= TT;
          end if;
        when NT =>                         
          if T = '0' then estado <= NT;
          else estado <= I; 
          end if;
        when TT =>                         
          if troco_liberado = '0' then estado <= TT;
          else estado <= I;
          end if;
        end case;
    end if;
  end process;

  with estado select  
    q <= "00" when I,
         "01" when TT, 
         "10" when NT, 
         "11" when M;
end logica; 
