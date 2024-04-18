library ieee;
use ieee.std_logic_1164.all;

-- registrador de valor maximo, se clr = 1, entao A_max = 999
entity reg_max is
    port (
	  A_reg: in  std_logic_vector(11 downto 0);
	  mx_mi, load, clr: in std_logic;
	  A_max: out std_logic_vector(11 downto 0)
	  );
	  
end reg_max;

architecture log of reg_max is

signal clr_max: std_logic_vector(11 downto 0) := "100110011001";
signal mux1: std_logic_vector(11 downto 0) := "000000000000";
signal mux2: std_logic_vector(11 downto 0) := "000000000000";
signal mux3: std_logic_vector(11 downto 0) := "000000000000";
signal zero: std_logic_vector(11 downto 0) := "000000000000";
signal key0_clr: std_logic_vector(11 downto 0) := "000000000000";
signal key1_clr: std_logic_vector(11 downto 0) := "000000000000";
signal key0_mx3: std_logic_vector(11 downto 0) := "000000000000";
signal key1_mx3: std_logic_vector(11 downto 0) := "000000000000";
signal and1: std_logic;

begin
    key0_clr <= (clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr);
    key1_clr <= (clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr);
    mux1 <= (not key0_clr and zero) or (key1_clr and clr_max);
    
    mux2 <= (not key0_clr and A_reg) or (key1_clr and mux1);
    
    and1 <= mx_mi and load;
    key0_mx3 <= (and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1);
    key1_mx3 <= (and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1);
    mux3 <= (not key0_mx3 and zero) or (key1_mx3 and mux2);
    
    A_max <= mux3;

end log;
