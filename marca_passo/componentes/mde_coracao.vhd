library ieee;
use ieee.std_logic_1164.all;

entity mde_coracao is
   port (ck, rst, za, zv: in  std_logic;
         ta, tv, sa, sv: out  std_logic;
                  q: out std_logic_vector(2 downto 0));
end mde_coracao;

architecture logica of mde_coracao is
  type st is (RSTA, ESA, CA, RSTV, ESV, CV);  
  signal estado : st;  
                          
begin
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= RSTA;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when RSTA =>     
          ta <= '1'; 
          tv <= '0';
          sa <= '0';
          sv <= '0';                   
          estado <= ESA;
        when ESA =>  
          ta <= '0';
          tv <= '0';
          sa <= '0';
          sv <= '0';                        
          if za = '0' then estado <= ESA; 
          elsif za = '1' then estado <= CA;
          end if;
        when CA =>   
          sa <= '1';                      
          ta <= '0';
          tv <= '0';
          sv <= '0';
          estado <= RSTV;
        when RSTV =>                         
          tv <= '1'; 
          ta <= '0';
          sa <= '0';
          sv <= '0';                   
          estado <= ESV;
        when ESV =>                         
          ta <= '0';
          tv <= '0';
          sa <= '0';
          sv <= '0';                        
          if zv = '0' then estado <= ESV; 
          elsif zv = '1' then estado <= CV;
          end if;
        when CV =>                         
          sv <= '1';                      
          ta <= '0';
          tv <= '0';
          sa <= '0';
          estado <= RSTA;
        end case;
    end if;
  end process;

  with estado select  
    q <= "000" when RSTA,
         "001" when ESA, 
         "010" when CA, 
         "011" when RSTV,
         "100" when ESV,
         "101" when CV;
end logica; 
