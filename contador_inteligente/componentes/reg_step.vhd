library ieee;
use ieee.std_logic_1164.all;

--registrador de passo, se clr = 0, entao passo = 1
entity reg_step is
    port (
	  A0: in  std_logic_vector(3 downto 0);
	  step, load, clr: in std_logic;
	  passo: out std_logic_vector(3 downto 0)
	  );
	  
end reg_step;

architecture log of reg_step is

signal clr_max: std_logic_vector(3 downto 0) := "0001";
signal mux1: std_logic_vector(3 downto 0) := "0000";
signal mux2: std_logic_vector(3 downto 0) := "0000";
signal mux3: std_logic_vector(3 downto 0) := "0000";
signal zero: std_logic_vector(3 downto 0) := "0000";
signal key0_clr: std_logic_vector(3 downto 0) := "0000";
signal key1_clr: std_logic_vector(3 downto 0) := "0000";
signal key0_mx3: std_logic_vector(3 downto 0) := "0000";
signal key1_mx3: std_logic_vector(3 downto 0) := "0000";
signal and1: std_logic;

begin
    key0_clr <= (clr, clr, clr, clr);
    key1_clr <= (clr, clr, clr, clr);
    mux1 <= (not key0_clr and zero) or (key1_clr and clr_max);
    
    mux2 <= (not key0_clr and A0) or (key1_clr and mux1);
    
    and1 <= step and load;
    key0_mx3 <= (and1, and1, and1, and1);
    key1_mx3 <= (and1, and1, and1, and1);
    mux3 <= (not key0_mx3 and zero) or (key1_mx3 and mux2);
    
    passo <= mux3;

end log;
