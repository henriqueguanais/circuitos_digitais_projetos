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
    end component;

    component acumulador is
        port (clear, clk, cond_x: in std_logic; 
              num_moedas: out std_logic_vector(9 downto 0));
    end component;

    component cont_decrescente is
        port (clear, clk, cont: in std_logic; --clear=0 para zerar      cont=1 para habilitar a contagem
              num_moedas: in std_logic_vector(9 downto 0);      --num_moedas automaticamente carregado para o contador, exceto quando clear==0
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
    component Registrador_10 is
        PORT( 
                I: in std_logic_vector(9 downto 0);
                CLK, CLR, EN: in std_logic;
                O: out std_logic_vector(9 downto 0));
    end component;
    -- incrementador, A e o valor do troco, B e o valor da moeda
    component main_adder is
        port(
          A: in std_logic_vector(9 downto 0);
          B: in std_logic_vector(6 downto 0);
          Cout: out std_logic_vector(9 downto 0)
        );
    end component;
    -- valor moeda x, onde A, B e 0 centavos, C e 1 centavo, D e 5... e H e 100 centavos
    component mux81_7Bit is
        Port(
            A, B, C, D, E, F, G, H : in std_logic_vector(6 downto 0);
            Key : in std_logic_vector (2 downto 0);
            S : out std_logic_vector(6 downto 0)
        );
    end component;

    component ffd_p is
        port (ck, clr, set, d : in  std_logic;
                            q : out std_logic);
    end component;

    signal troco_liberado, TemTroco, NaoTemTroco: std_logic := '0';
    signal condicao, valor_moeda: std_logic_vector(6 downto 0) := "0000000";
    signal estado: std_logic_vector(1 downto 0) := "00";
    signal Valor_Troco: std_logic_vector(9 downto 0) := "0000000000";
    signal Troco: std_logic_vector(9 downto 0) := "0000000000";
    signal troco_aux: std_logic_vector(9 downto 0);
    signal soma, soma_aux: std_logic_vector(5 downto 0) := "000000";
    signal selecao_das_moedas: std_logic_vector(2 downto 0) := "000";
    signal n_moedas_1, n_moedas_2, n_moedas_3, n_moedas_4, n_moedas_5, n_moedas_6: std_logic_vector(9 downto 0) := "0000000000";
    signal ix_aux: std_logic_vector(5 downto 0) := "000000";
    signal clear, clear_acumulador, clear_cont, clear_soma: std_logic := '0';
    signal load_cont: std_logic := '0';

begin

    -- instanciando os componentes
    mde1: mde port map(clk, '0', T, TemTroco, troco_liberado, condicao, estado);
    saida_L1: saida_L port map(estado, clk, L);
    registrador_troco: Registrador_10 port map(V, clk, '0', '1', Valor_Troco);

    clear <= estado(1) and estado(0);

    registrador_troco_9: ffd_p port map(clk, clear, '1', troco_aux(9), Troco(9));
    registrador_troco_8: ffd_p port map(clk, clear, '1', troco_aux(8), Troco(8));
    registrador_troco_7: ffd_p port map(clk, clear, '1', troco_aux(7), Troco(7));
    registrador_troco_6: ffd_p port map(clk, clear, '1', troco_aux(6), Troco(6));
    registrador_troco_5: ffd_p port map(clk, clear, '1', troco_aux(5), Troco(5));
    registrador_troco_4: ffd_p port map(clk, clear, '1', troco_aux(4), Troco(4));
    registrador_troco_3: ffd_p port map(clk, clear, '1', troco_aux(3), Troco(3));
    registrador_troco_2: ffd_p port map(clk, clear, '1', troco_aux(2), Troco(2));
    registrador_troco_1: ffd_p port map(clk, clear, '1', troco_aux(1), Troco(1));
    registrador_troco_0: ffd_p port map(clk, clear, '1', troco_aux(0), Troco(0));
    incrementador: main_adder port map(Troco, valor_moeda, troco_aux);

    selecao_moedas1: selecao_moedas port map(condicao, selecao_das_moedas);
    valor_moeda_x: mux81_7Bit port map("0000000", "0000000", "0000001", "0000101", "0001010", "0011001", "0110010", "1100100", selecao_das_moedas, valor_moeda);   
    verificador_troco: Comparador_10bits port map(Troco, Valor_Troco, TemTroco, NaoTemTroco);

    clear_soma <= estado(1) and estado(0);

    compara_moeda: somar_moeda_x port map(Troco, Valor_Troco, soma_aux);
    registrador_compara_5: ffd_p port map(clk, clear_soma, '1', soma_aux(5), soma(5));
    registrador_compara_4: ffd_p port map(clk, clear_soma, '1', soma_aux(4), soma(4));
    registrador_compara_3: ffd_p port map(clk, clear_soma, '1', soma_aux(3), soma(3));
    registrador_compara_2: ffd_p port map(clk, clear_soma, '1', soma_aux(2), soma(2));
    registrador_compara_1: ffd_p port map(clk, clear_soma, '1', soma_aux(1), soma(1));
    registrador_compara_0: ffd_p port map(clk, clear_soma, '1', soma_aux(0), soma(0));
    condicoes_moeda1: condicoes_moeda port map(soma_aux, moedas, condicao);

    clear_acumulador <= estado(0);
    
    -- acumuladores
    acumulador6: acumulador port map(clear_acumulador, clk, condicao(6), n_moedas_6);
    acumulador5: acumulador port map(clear_acumulador, clk, condicao(5), n_moedas_5);
    acumulador4: acumulador port map(clear_acumulador, clk, condicao(4), n_moedas_4);
    acumulador3: acumulador port map(clear_acumulador, clk, condicao(3), n_moedas_3);
    acumulador2: acumulador port map(clear_acumulador, clk, condicao(2), n_moedas_2);
    acumulador1: acumulador port map(clear_acumulador, clk, condicao(1), n_moedas_1);

    clear_cont <= not estado(1) and estado(0);
    load_cont <= not estado(1) and estado(0);
    
    -- liberadores de moedas
    cont_decrescente6: cont_decrescente port map(clear_cont, clk, load_cont, n_moedas_6, ix_aux(5));
    cont_decrescente5: cont_decrescente port map(clear_cont, clk, load_cont, n_moedas_5, ix_aux(4));
    cont_decrescente4: cont_decrescente port map(clear_cont, clk, load_cont, n_moedas_4, ix_aux(3));
    cont_decrescente3: cont_decrescente port map(clear_cont, clk, load_cont, n_moedas_3, ix_aux(2));
    cont_decrescente2: cont_decrescente port map(clear_cont, clk, load_cont, n_moedas_2, ix_aux(1));
    cont_decrescente1: cont_decrescente port map(clear_cont, clk, load_cont, n_moedas_1, ix_aux(0));

    -- flag para mudar o estado, voltar para inicio
    troco_liberado <= (not ix_aux(5) and not ix_aux(4) and not ix_aux(3) and not ix_aux(2) and not ix_aux(1) and not ix_aux(0)) 
                        and (not estado(1) and estado(0));

    -- saida ix
    ix <= ix_aux;

end log;