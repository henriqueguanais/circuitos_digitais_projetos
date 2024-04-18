library ieee;
use ieee.std_logic_1164.all;

-- registrador de valor minimo, se clr = 1, entao A_min = 0
entity reg_min is
    port (
	  A_reg: in  std_logic_vector(11 downto 0);
	  mx_mi, load, clr: in std_logic;
	  A_min: out std_logic_vector(11 downto 0)
	  );
	  
end reg_min;

architecture log of reg_min is

signal mux1: std_logic_vector(11 downto 0) := "000000000000";
signal mux2: std_logic_vector(11 downto 0) := "000000000000";
signal zero: std_logic_vector(11 downto 0) := "000000000000";
signal key0_clr: std_logic_vector(11 downto 0) := "000000000000";
signal key1_clr: std_logic_vector(11 downto 0) := "000000000000";
signal key0_mx3: std_logic_vector(11 downto 0) := "000000000000";
signal key1_mx3: std_logic_vector(11 downto 0) := "000000000000";
signal and1: std_logic;

begin
    key0_clr <= (clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr);
    key1_clr <= (clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr, clr);
    mux1 <= (not key0_clr and A_reg) or (key1_clr and zero);
    
    and1 <= not mx_mi and load;
    key0_mx3 <= (and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1);
    key1_mx3 <= (and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1, and1);
    mux2 <= (not key0_mx3 and zero) or (key1_mx3 and mux1);
    
    A_min <= mux2;

end log;
