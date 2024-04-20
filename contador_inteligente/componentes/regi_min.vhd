library ieee;
use ieee.std_logic_1164.all;

entity regi_mi is
    port (D_reg_mi: in  std_logic_vector(11 downto 0);
	  load, mx_mi, clr_reg_mi, clk_reg_mi: in std_logic;
            Q_reg_mi: out std_logic_vector(11 downto 0));
end regi_mi;

architecture log of regi_mi is

component ffd is
	port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

signal en_mi: std_logic_vector(11 downto 0):= (OTHERS => '1');
signal D_en_mi, Q_en_mi: std_logic_vector(11 downto 0);

begin
    en_mi <= (OTHERS => load and not mx_mi);
    D_en_mi <= (not en_mi and Q_en_mi) or (en_mi and D_reg_mi);

    Q11: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(11), Q_en_mi(11));
    Q10: ffd port map(clk_reg_mi, clr_reg_mi, '1',  D_en_mi(10), Q_en_mi(10));
    Q9: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(9), Q_en_mi(9));
    Q8: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(8), Q_en_mi(8));
    
Q7: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(7), Q_en_mi(7));
    Q6: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(6), Q_en_mi(6));
    Q5: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(5), Q_en_mi(5));
    Q4: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(4), Q_en_mi(4));
   
 Q3: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(3), Q_en_mi(3));
    Q2: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(2), Q_en_mi(2));
    Q1: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(1), Q_en_mi(1));
    Q0: ffd port map(clk_reg_mi, clr_reg_mi, '1', D_en_mi(0), Q_en_mi(0));
    
    Q_reg_mi <= Q_en_mi;

end log;
