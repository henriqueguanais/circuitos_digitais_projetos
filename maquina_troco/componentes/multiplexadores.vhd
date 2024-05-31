--##############################
--# Mux 2x1 # 2 entradas 10 bits#
--##############################
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Mux_2x1_10 is
		port( B,A         : in  std_logic_vector (9 downto 0);
		      S0   	      : in  std_logic;
				M           : out std_logic_vector (9 downto 0));				    
end Mux_2x1_10;

architecture ckt of Mux_2x1_10 is

--------- COMPONENTES ---------------------------------------------------------
  component mux_2x1 is
		port( B,A      : in  std_logic;
		      S0	      : in  std_logic;				    
				 W     	: out std_logic);
	end component;
	
--------- SINAIS AUXILIARES ---------------------------------------------------

	signal W : std_logic_vector (9 downto 0);
	
--------- EXECUÇÃO DO CODIGO---------------------------------------------------
	begin
	 Mux0 : mux_2x1 port map (B(0), A(0),S0, W(0)); 
	 Mux1 : mux_2x1 port map (B(1), A(1),S0, W(1)); 
	 Mux2 : mux_2x1 port map (B(2), A(2),S0, W(2));
	 Mux3 : mux_2x1 port map (B(3), A(3),S0, W(3));
	 Mux4 : mux_2x1 port map (B(4), A(4),S0, W(4));
	 Mux5 : mux_2x1 port map (B(5), A(5),S0, W(5));
	 Mux6 : mux_2x1 port map (B(6), A(6),S0, W(6));
	 Mux7 : mux_2x1 port map (B(7), A(7),S0, W(7));
	 Mux8 : mux_2x1 port map (B(8), A(8),S0, W(8));
	 Mux9 : mux_2x1 port map (B(9), A(9),S0, W(9));   
	  
	 M <= w; 
	 
	 end ckt;
  
  
--================================= FIM ========================================  

--##############################
--# Mux 2x1 # 2 entradas 1 bits#
--##############################
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
		port( B,A      : in  std_logic;
		      S0	      : in  std_logic;				    
				W        : out std_logic);
end mux_2x1;

architecture ckt of mux_2x1 is

--------- SINAIS AUXILIARES ---------------------------------------------------

signal S : std_logic_vector (1 downto 0);

--------- EXECUÇÃO DO CODIGO---------------------------------------------------

begin
    S(0) <= (A and (not S0));
    S(1) <= (B and (S0));
  	
		
		W <= S(1) or S(0);
end ckt;
--================================= FIM ======================================== 
