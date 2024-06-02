library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           Sum  : out STD_LOGIC;
           Cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
begin
    Sum <= (A xor B) xor Cin;
    Cout <= (A and B) or (Cin and (A xor B));
end Behavioral;


### Entidade Principal

vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_adder is
    Port ( A  : in  STD_LOGIC_VECTOR(9 downto 0);
           Cin : in  STD_LOGIC_VECTOR(6 downto 0);
           Sum : out STD_LOGIC_VECTOR(9 downto 0));
end main_adder;

architecture Structural of main_adder is
    signal B : STD_LOGIC_VECTOR(9 downto 0);
    signal C : STD_LOGIC_VECTOR(9 downto 0); -- para armazenar os carries intermediários

    component full_adder
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               Cin  : in  STD_LOGIC;
               Sum  : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

begin
    -- Inicializando a entrada B
    B(0) <= '0';
    B(1) <= Sum(0);
    B(2) <= Sum(1);
    B(3) <= Sum(2);
    B(4) <= Sum(3);
    B(5) <= Sum(4);
    B(6) <= Sum(5);
    B(7) <= Sum(6);
    B(8) <= Sum(7);
    B(9) <= Sum(8);

    -- Instanciando os 10 Full Adders
    FA0: full_adder port map (A(0), '0', Cin(0), Sum(0), C(0));
    FA1: full_adder port map (A(1), Sum(0), Cin(1), Sum(1), C(1));
    FA2: full_adder port map (A(2), Sum(1), Cin(2), Sum(2), C(2));
    FA3: full_adder port map (A(3), Sum(2), Cin(3), Sum(3), C(3));
    FA4: full_adder port map (A(4), Sum(3), Cin(4), Sum(4), C(4));
    FA5: full_adder port map (A(5), Sum(4), Cin(5), Sum(5), C(5));
    FA6: full_adder port map (A(6), Sum(5), Cin(6), Sum(6), C(6));
    FA7: full_adder port map (A(7), Sum(6), '0', Sum(7), C(7));
    FA8: full_adder port map (A(8), Sum(7), '0', Sum(8), C(8));
    FA9: full_adder port map (A(9), Sum(8), '0', Sum(9), C(9));
end Structural;