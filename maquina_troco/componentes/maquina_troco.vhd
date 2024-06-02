library ieee;
use ieee.std_logic_1164.all;

entity maquina_troco is
    port(T, clk: in std_logic;
         V: in std_logic_vector(9 downto 0);
         moedas: in std_logic_vector(5 downto 0);
         ix: out std_logic_vector(5 downto 0);
		 L: out std_logic);
end maquina_troco;

architecture log of maquina_troco is

    component mde is
        port(ck, rst, T, TemTroco, troco_liberado: in  std_logic;
             condicao: in std_logic_vector(6 downto 0);
             q: out std_logic_vector(1 downto 0));
     end component;

    component saida_L is
		port(   estado: in  std_logic_vector (1 downto 0);
                clk_L: in  std_logic;
			    L: out  std_logic);
    component saida_L;

    component acumulador is
        port (clear, clk, cond_x: in std_logic; 
              num_moedas: out std_logic_vector(9 downto 0));
    end component;

    component cont_decrescente is
        port (clear, clk, cont: in std_logic; 
              num_moedas: in std_logic_vector(9 downto 0);      
              i_x : out std_logic);
    end component;
    -- verificador de troco
    component Comparador_10bits is
        Port (
            A : in STD_LOGIC_VECTOR(9 downto 0); 
            B : in STD_LOGIC_VECTOR(9 downto 0); 
            TemTroco    : out STD_LOGIC;
            NaoTemTroco : out STD_LOGIC
        );
    end component;

    component condicoes_moeda is 
        port( soma, Moedas: in std_logic_vector(5 downto 0);
                condicao: out std_logic_vector(6 downto 0));
    end component;

    component selecao_moedas is 
        port(condicao: in std_logic_vector(6 downto 0);
                selecao: out std_logic_vector(2 downto 0));
    end component;
    -- compara moeda
    component somar_moeda_x is 
        port( Troco, V_troco : in std_logic_vector(9 downto 0);
                soma: out std_logic_vector(5 downto 0));
    end component;
    -- registrador de troco
    component fixed_register is
        Port (
            clk     : in STD_LOGIC;
            rst     : in STD_LOGIC;
            load    : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR(9 downto 0);
            data_out: out STD_LOGIC_VECTOR(9 downto 0)
        );
    end component;
    -- incrementador
    component main_adder is
        Port ( A  : in  STD_LOGIC_VECTOR(9 downto 0);
               Cin : in  STD_LOGIC_VECTOR(6 downto 0);
               Sum : out STD_LOGIC_VECTOR(9 downto 0));
    end component;

    signal troco_liberado, TemTroco, NaoTemTroco: std_logic;
    signal condicao, valor_moeda: std_logic_vector(6 downto 0);
    signal estado: std_logic_vector(1 downto 0);
    signal Valor_Troco: std_logic_vector(9 downto 0);
    signal Troco: std_logic_vector(9 downto 0);
    signal soma: std_logic_vector(5 downto 0);
    signal selecao_das_moedas: std_logic_vector(2 downto 0);
    signal n_moedas_1, n_moedas_2, n_moedas_3, n_moedas_4, n_moedas_5, n_moedas_6: std_logic_vector(9 downto 0);

begin

    -- instanciando os componentes
    mde1: mde port map(clk, '0', T, TemTroco, troco_liberado, condicao, estado);
    saida_L1: saida_L port map(estado, clk, L);
    registrador_troco: fixed_register port map(clk, '0', '1', V, Valor_Troco);
    incrementador: main_adder port map(Troco, valor_moeda, Troco);   
    verificador_troco: Comparador_10bits port map(Valor_Troco, Troco, TemTroco, NaoTemTroco);
    condicoes_moeda1: condicoes_moeda port map(soma, moedas, condicao);
    selecao_moedas1: selecao_moedas port map(condicao, selecao_das_moedas);
    compara_moeda: somar_moeda_x port map(Troco, Valor_Troco, soma);
    
    -- acumuladores
    acumulador6: acumulador port map('1', clk, condicao(6), n_moedas_6);
    acumulador5: acumulador port map('1', clk, condicao(5), n_moedas_5);
    acumulador4: acumulador port map('1', clk, condicao(4), n_moedas_4);
    acumulador3: acumulador port map('1', clk, condicao(3), n_moedas_3);
    acumulador2: acumulador port map('1', clk, condicao(2), n_moedas_2);
    acumulador1: acumulador port map('1', clk, condicao(1), n_moedas_1);
    
    -- liberadores de moedas
    cont_decrescente1: cont_decrescente port map('1', clk, '1', n_moedas_6, ix(5));
    cont_decrescente1: cont_decrescente port map('1', clk, '1', n_moedas_5, ix(4));
    cont_decrescente1: cont_decrescente port map('1', clk, '1', n_moedas_4, ix(3));
    cont_decrescente1: cont_decrescente port map('1', clk, '1', n_moedas_3, ix(2));
    cont_decrescente1: cont_decrescente port map('1', clk, '1', n_moedas_2, ix(1));
    cont_decrescente1: cont_decrescente port map('1', clk, '1', n_moedas_1, ix(0));

    -- flag para mudar o estado, voltar para inicio
    troco_liberado <= not ix(5) and not ix(4) and not ix(3) and not ix(2) and not ix(1) and not ix(0);

end log;