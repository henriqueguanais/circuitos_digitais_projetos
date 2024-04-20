library ieee;
use ieee.std_logic_1164.all;

entity regi_passo is
    port (D_reg_p: in  std_logic_vector(3 downto 0);
	  load, step, clr_reg_p, clk_reg_p: in std_logic;
            Q_reg_p: out std_logic_vector(3 downto 0));
end regi_passo;

architecture log of regi_passo is

component ffd is
	port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

signal en_p: std_logic_vector(3 downto 0):= (OTHERS => '1');
signal D_en_p, Q_en_p: std_logic_vector(3 downto 0);

begin
    en_p <= (OTHERS => load and step);
    D_en_p <= (not en_p and Q_en_p) or (en_p and D_reg_p);
	
 Q3: ffd port map(clk_reg_p, clr_reg_p, '1', D_en_p(3), Q_en_p(3));
    Q2: ffd port map(clk_reg_p, clr_reg_p, '1', D_en_p(2), Q_en_p(2));
    Q1: ffd port map(clk_reg_p, clr_reg_p, '1', D_en_p(1), Q_en_p(1));
    Q0: ffd port map(clk_reg_p, '1', clr_reg_p, D_en_p(0), Q_en_p(0));

    Q_reg_p <= Q_en_p;

end log;
