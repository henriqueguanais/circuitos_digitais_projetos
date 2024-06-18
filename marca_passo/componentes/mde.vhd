library ieee;
use ieee.std_logic_1164.all;

entity mde is
   port (ck, rst, sa, za, sv, zv: in  std_logic;
         pa, ta, pv, tv: out  std_logic;
                  q: out std_logic_vector(2 downto 0));
end mde;

architecture logica of mde is
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
          ta <= '0'; 
          tv <= '1';
          pa <= '0';
          pv <= '0';                   
          estado <= ESA;
        when ESA =>  
          ta <= '1';
          tv <= '1';
          pa <= '0';
          pv <= '0';                        
          if sa = '0' and za = '0' then estado <= ESA; 
          elsif sa = '1' then estado <= RSTV;
          elsif sa = '0' and za = '1' then estado <= CA;
          end if;
        when CA =>   
          pa <= '1';                      
          ta <= '1';
          tv <= '1';
          pv <= '0';
          estado <= RSTV;
        when RSTV =>                         
          tv <= '0'; 
          ta <= '1';
          pa <= '0';
          pv <= '0';                   
          estado <= ESV;
        when ESV =>                         
          ta <= '1';
          tv <= '1';
          pa <= '0';
          pv <= '0';                        
          if sv = '0' and zv = '0' then estado <= ESV; 
          elsif sv = '1' then estado <= RSTA;
          elsif sv = '0' and zv = '1' then estado <= CV;
          end if;
        when CV =>                         
          pv <= '1';                      
          ta <= '1';
          tv <= '1';
          pa <= '0';
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
