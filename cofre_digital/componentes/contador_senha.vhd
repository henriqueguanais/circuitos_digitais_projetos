library ieee;
use ieee.std_logic_1164.all;

entity cont_senha is
    port (s_cont: in  std_logic_vector(2 downto 0);
	  add_cont, clk_cont: in std_logic;
          cont_end: out std_logic);
end cont_senha;

architecture log of cont_senha is

component ffd is
	port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

signal D_FFD, clr_cont, D_and_Q, D_en_0, D_FFD_0, set_FFD_1: std_logic:= '0';
signal Q_FFD: std_logic_vector(1 downto 0):= (OTHERS => '0');

begin
	
    D_FFD <= add_cont and not s_cont(2) and s_cont(1) and not s_cont(0);
    clr_cont <= not(add_cont and not s_cont(2) and not s_cont(1) and not s_cont(0));

    D_and_Q <= D_FFD and not Q_FFD(0);
    D_en_0 <= not Q_FFD(0) or not Q_FFD(1);
    D_FFD_0 <= (not D_en_0 and Q_FFD(0)) or (D_en_0 and D_and_Q);
    set_FFD_1 <= (Q_FFD(1));

    Q0: ffd port map(clk_cont, clr_cont, '1', D_and_Q, Q_FFD(0));
    Q1: ffd port map(clk_cont, clr_cont, set_FFD_1, Q_FFD(0), Q_FFD(1));
    
    cont_end <= '1' and Q_FFD(1) and Q_FFD(0);

end log;
