library ieee;
use ieee.std_logic_1164.all;

entity regi_max is
    port (D_reg_mx: in  std_logic_vector(11 downto 0);
	  load, mx_mi, clr_reg_mx, clk_reg_mx: in std_logic;
            Q_reg_mx: out std_logic_vector(11 downto 0));
end regi_max;

architecture log of regi_max is

component ffd is
	port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

signal en_mx: std_logic_vector(11 downto 0):= (OTHERS => '1');
signal D_en_mx, Q_en_mx: std_logic_vector(11 downto 0);

begin
    en_mx <= (OTHERS => load and mx_mi);
    D_en_mx <= (not en_mx and Q_en_mx) or (en_mx and D_reg_mx);
	
    Q11: ffd port map(clk_reg_mx, '1', clr_reg_mx, D_en_mx(11), Q_en_mx(11));
    Q10: ffd port map(clk_reg_mx, clr_reg_mx, '1', D_en_mx(10), Q_en_mx(10));
    Q9: ffd port map(clk_reg_mx, clr_reg_mx, '1', D_en_mx(9), Q_en_mx(9));
    Q8: ffd port map(clk_reg_mx, '1', clr_reg_mx, D_en_mx(8), Q_en_mx(8));
    
Q7: ffd port map(clk_reg_mx, '1', clr_reg_mx, D_en_mx(7), Q_en_mx(7));
    Q6: ffd port map(clk_reg_mx, clr_reg_mx, '1', D_en_mx(6), Q_en_mx(6));
    Q5: ffd port map(clk_reg_mx, clr_reg_mx, '1', D_en_mx(5), Q_en_mx(5));
    Q4: ffd port map(clk_reg_mx, '1', clr_reg_mx, D_en_mx(4), Q_en_mx(4));
   
 Q3: ffd port map(clk_reg_mx, '1', clr_reg_mx, D_en_mx(3), Q_en_mx(3));
    Q2: ffd port map(clk_reg_mx, clr_reg_mx, '1', D_en_mx(2), Q_en_mx(2));
    Q1: ffd port map(clk_reg_mx, clr_reg_mx, '1', D_en_mx(1), Q_en_mx(1));
    Q0: ffd port map(clk_reg_mx, '1', clr_reg_mx, D_en_mx(0), Q_en_mx(0));

    Q_reg_mx <= Q_en_mx;

end log;
