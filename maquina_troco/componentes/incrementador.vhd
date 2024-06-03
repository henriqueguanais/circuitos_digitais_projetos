library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
  port(
    A: in std_logic;
    B: in std_logic;
    Cin: in std_logic;
    Sum: out std_logic;
    Cout: out std_logic
  );
end full_adder;

architecture Behavioral of full_adder is
begin
  Sum <= (A xor B) xor Cin;
  Cout <= (A and B) or (Cin and (A xor B));
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_adder is
  port(
    A: in std_logic_vector(9 downto 0);
    B: in std_logic_vector(6 downto 0);
    Cout: out std_logic_vector(9 downto 0)
  );
end main_adder;

architecture Structural of main_adder is
  signal S: std_logic_vector(9 downto 0); -- sinal intermediário para armazenar os valores de soma
  signal Cout_Vector: std_logic_vector(9 downto 0); -- vetor para armazenar os valores de Cout

  component full_adder
    port(
      A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      Sum: out std_logic;
      Cout: out std_logic
    );
  end component;

begin
  -- Instanciando os 10 Full Adders
  FA0: full_adder port map(A => A(0), B => B(0), Cin => '0', Sum => S(0), Cout => Cout_Vector(0));
  FA1: full_adder port map(A => A(1), B => B(1), Cin => Cout_Vector(0), Sum => S(1), Cout => Cout_Vector(1));
  FA2: full_adder port map(A => A(2), B => B(2), Cin => Cout_Vector(1), Sum => S(2), Cout => Cout_Vector(2));
  FA3: full_adder port map(A => A(3), B => B(3), Cin => Cout_Vector(2), Sum => S(3), Cout => Cout_Vector(3));
  FA4: full_adder port map(A => A(4), B => B(4), Cin => Cout_Vector(3), Sum => S(4), Cout => Cout_Vector(4));
  FA5: full_adder port map(A => A(5), B => B(5), Cin => Cout_Vector(4), Sum => S(5), Cout => Cout_Vector(5));
  FA6: full_adder port map(A => A(6), B => B(6), Cin => Cout_Vector(5), Sum => S(6), Cout => Cout_Vector(6));
  FA7: full_adder port map(A => A(7), B => '0', Cin => Cout_Vector(6), Sum => S(7), Cout => Cout_Vector(7));
  FA8: full_adder port map(A => A(8), B => '0', Cin => Cout_Vector(7), Sum => S(8), Cout => Cout_Vector(8));
  FA9: full_adder port map(A => A(9), B => '0', Cin => Cout_Vector(8), Sum => S(9), Cout => Cout_Vector(9));

  -- Atribuindo o valor de S à saída Sum
  Cout <= S;
end Structural;