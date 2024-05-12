library ieee;
use ieee.std_logic_1164.all;

entity ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end ffd;

architecture logica of ffd is

begin
   process(ck, clr, set)
   begin
      if    (set = '0')            then q <= '1';
      elsif (clr = '0')            then q <= '0';
      elsif (ck'event and ck ='1') then q <= d;   
      end if;   
   end process;   
end logica;

---============================================================================
library ieee;
use ieee.std_logic_1164.all;

entity reg_1_bit is
		port(A            : in  std_logic;
			  ld, clr, clk : in  std_logic;
			  Q		      : out std_logic);
end reg_1_bit;


architecture ckt of reg_1_bit is

------ COMPONENTES ------------------------------------------------------------ 
component ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;
	
------ SINAIS AUXILIARES ------------------------------------------------------			
	signal D_Aux, Q_Aux: std_logic;

--------- EXECUCA?O DO CODIGO---------------------------------------------------		

begin
		D_Aux <= (not(ld) and Q_Aux) or (ld and A);
		FF : ffd port map (clk, clr, '1', D_Aux, Q_Aux);
		
		Q <= Q_Aux;		
			
			
end ckt;

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg_18_bits is
		port(A            : in  std_logic_vector (17 downto 0);
			  ld, clr, clk : in  std_logic;
			  R		      : out std_logic_vector (17 downto 0));
end reg_18_bits;


architecture ckt of reg_18_bits is

------ COMPONENTES ------------------------------------------------------------ 
	component reg_1_bit is
		port(A            : in  std_logic;
			  ld, clr, clk : in  std_logic;
			  Q		      : out std_logic);
end component;

--------- EXECUCA?O DO CODIGO---------------------------------------------------		

begin
		
		R0: reg_1_bit port map(A(0),ld,clr,clk,R(0));
		R1: reg_1_bit port map(A(1),ld,clr,clk,R(1));
		R2: reg_1_bit port map(A(2),ld,clr,clk,R(2));
		R3: reg_1_bit port map(A(3),ld,clr,clk,R(3));
		R4: reg_1_bit port map(A(4),ld,clr,clk,R(4));
		R5: reg_1_bit port map(A(5),ld,clr,clk,R(5));
		R6: reg_1_bit port map(A(6),ld,clr,clk,R(6));
		R7: reg_1_bit port map(A(7),ld,clr,clk,R(7));
		R8: reg_1_bit port map(A(8),ld,clr,clk,R(8));
		R9: reg_1_bit port map(A(9),ld,clr,clk,R(9));
		R10: reg_1_bit port map(A(10),ld,clr,clk,R(10));
		R11: reg_1_bit port map(A(11),ld,clr,clk,R(11));
		R12: reg_1_bit port map(A(12),ld,clr,clk,R(12));
		R13: reg_1_bit port map(A(13),ld,clr,clk,R(13));
		R14: reg_1_bit port map(A(14),ld,clr,clk,R(14));
		R15: reg_1_bit port map(A(15),ld,clr,clk,R(15));
		R16: reg_1_bit port map(A(16),ld,clr,clk,R(16));
		R17: reg_1_bit port map(A(17),ld,clr,clk,R(17));
			
end ckt;

-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg_senha is
		port(pwd            : in  std_logic_vector (5 downto 0);
			 s  : in std_logic_vector (2 downto 0);
			  pwr, clk, add : in  std_logic;
			  R		      : out std_logic_vector (17 downto 0));
end reg_senha;


architecture ckt of reg_senha is

------ COMPONENTES ------------------------------------------------------------ 
component reg_18_bits is
		port(A            : in  std_logic_vector (17 downto 0);
			  ld, clr, clk : in  std_logic;
			  R		      : out std_logic_vector (17 downto 0));
end component;


--------------- SINAIS --------------------------------------------------------

signal reg_ld, reg_clr : std_logic;
signal A_Aux, R_Aux : std_logic_vector (17 downto 0);

--------- EXECUCA?O DO CODIGO---------------------------------------------------		

begin
		
		-- estado valor == 011 ???
		-- load do registrador
		reg_ld <= add and not(pwr) and not(s(2)) and s(1) and s(0);
		
		--estado iniciando == 010 ??
		--dar clear no registrador
		reg_clr <= not(not(s(2)) and s(1) and not(s(0)));	
		
		A_Aux(17 downto 12) <= pwd;
		A_Aux(11 downto 6) <= R_Aux(17 downto 12);
		A_Aux(5 downto 0) <= R_Aux(11 downto 6);
		
		REG : reg_18_bits port map (A_Aux, reg_ld, reg_clr, clk, R_Aux);
		
		
		R <= R_Aux;
		
			
end ckt;

--=================================== FIM =======================================