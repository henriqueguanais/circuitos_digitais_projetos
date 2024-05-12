library ieee;
use ieee.std_logic_1164.all;

entity comparador_6_bits is
		port(A, B     : in  std_logic_vector (5 downto 0);
			  AigualB : out  std_logic);
end comparador_6_bits;


architecture ckt of comparador_6_bits is
	
------ SINAIS AUXILIARES ------------------------------------------------------			
	signal X: std_logic_vector (5 downto 0);

--------- EXECUÇÃO DO CODIGO---------------------------------------------------		

begin
		X(0) <= (A(0) and B(0)) or (not(A(0)) and not(B(0)));
		X(1) <= (A(1) and B(1)) or (not(A(1)) and not(B(1)));
		X(2) <= (A(2) and B(2)) or (not(A(2)) and not(B(2)));
		X(3) <= (A(3) and B(3)) or (not(A(3)) and not(B(3)));
		X(4) <= (A(4) and B(4)) or (not(A(4)) and not(B(4)));
		X(5) <= (A(5) and B(5)) or (not(A(5)) and not(B(5)));
		
		
		AigualB <= X(0) and X(1) and X(2) and X(3) and X(4) and X(5);
		
			
end ckt;

library ieee;
use ieee.std_logic_1164.all;

entity comparador_18_bits is
		port(A, B     : in  std_logic_vector (17 downto 0);
			  pwd_cmp : out  std_logic);
end comparador_18_bits;


architecture ckt of comparador_18_bits is

-------- COMPONENTES ----------------------------------------------------------

component comparador_6_bits is
		port(A, B     : in  std_logic_vector (5 downto 0);
			  AigualB : out  std_logic);
end component;
	
------ SINAIS AUXILIARES ------------------------------------------------------			
	signal AigualB_Aux: std_logic_vector (2 downto 0);

--------- EXECUÇÃO DO CODIGO---------------------------------------------------		

begin
		COMP1: comparador_6_bits port map(A(5 downto 0), B(5 downto 0), AigualB_Aux(0));
		COMP2: comparador_6_bits port map(A(11 downto 6), B(11 downto 6), AigualB_Aux(1));
		COMP3: comparador_6_bits port map(A(17 downto 12), B(17 downto 12), AigualB_Aux(2));
		
		pwd_cmp <= AigualB_Aux(0) and AigualB_Aux(1) and AigualB_Aux(2);
		
			
end ckt;

--===============================================================================



--=================================== FIM =======================================