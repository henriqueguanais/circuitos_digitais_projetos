library ieee;
use ieee.std_logic_1164.all;

entity decrementor is
    pORt (
        A : in std_logic_vectOR(7 downto 0);    -- Entrada de 4 bits para o número a ser incrementado              
        S : out std_logic_vectOR(7 downto 0);   -- Saída de 4 bits com o número incrementado
        carrybORrow: out std_logic              -- Saída de carry ou bORrow 
    );
end entity decrementor;

architecture BehaviORal of decrementor is
    signal carry: std_logic := '0';  -- Sinal para o '0', inicializado como '0'
begin
  
    S(0) <= (not (A(0)) and '0' and '0') OR ( not (A(0)) and '1' and '1') OR (A(0) and '1' and '0') ;       
    
    S(1) <= ('0' and A(1) and '1') OR (not (A(0))and A(1) and '0') OR ('0' and A(0)and  not (A(1))and  '0') OR ('1' and not(A(0)) and not(A(1)) and '1') OR 
    ('1' and A(0)and  A(1));
	 
	  S(2) <= ('0' and not (A(0)) and A(2) )OR ('0' and  A(2) and  '1' )OR (not (A(1)) and A(2) and '0' )OR (A(0) and A(2) and '1' )OR 
	  ('0' and A(0) and A(1) and not(A(2)) and '0') OR ('1' and not(A(0)) and not(A(1)) and  not(A(2)) and  '1') OR ('1' and  A(1) and A(2));
    

	  S(3) <= ('0' and A(3) and '1') OR (not (A(2)) and A(3) and '0' )OR (not(A(0)) and A(2) and A(3) )OR( A(1)and  A(3) and '1' )OR 
	  (A(0) and not (A(1)) and A(3) )OR (A(0) and A(3) and '1' )OR ('0' and A(0) and A(1)and  A(2) and not (A(3)) and '0' )OR 
	  ('1' and not (A(0))and  not(A(1))and  not (A(2)) and not (A(3)) and '1' )OR ('1'and  A(0) and A(3));
	 
	  S(4) <= ('0' and (not A(1)) and A(4)) OR ('0' and (not A(2)) and A(4)) OR ((not A(0)) and A(4) and '0') OR (A(3) and A(4) and '1') OR 
	  (A(2) and (not A(3)) and A(4)) OR (A(1) and (not A(3)) and A(4)) OR (A(0) and (not A(3)) and A(4)) OR 
	  ('0' and A(0) and A(1) and A(2) and A(3) and (not A(4)) and '0') OR 
	  ('1' and (not A(0)) and (not A(1)) and (not A(2)) and (not A(3)) and (not A(4)) and '1') OR ('1' and A(0) and A(4));


	  S(5) <= ('0'and  not (A(2)) and A(5)) OR ( '0'and  not(A(3))and  A(5) )OR (not (A(1))and  A(5) and '0' )OR
	  ( not(A(0)) and  A(4)and  A(5) )OR( A(3) and not(A(4)) and A(5) )OR 
	  (A(2)and  not (A(3))and  A(5) )OR( A(1)and  not (A(3))and  A(5) )OR 
	  (A(0) and not (A(3))and  A(5) )OR(A(0) and A(5) and '1' )OR( '0' and A(0) and A(1) and A(2) and A(3)and  A(4) and not (A(5)) and '0' )OR 
	  ('1'and  not (A(0)) and not (A(1))and  not (A(2)) and not (A(3)) and not (A(4)) and not (A(5)) and '1') OR ('1' and A(1) and A(5));
	 
	  S(6) <= ('0' and not (A(2)) and A(6)) OR ( '0' and not(A(5))and  A(6) )OR (not (A(1))and  A(6)and  '0' )OR (not (A(2))and  A(6)and  '0') OR
	  ( A(5)and  A(6) and '1' )OR (not (A(0)) and A(3) and A(6) )OR (A(2) and not (A(3)) and A(6)) OR 
	  (A(2) and not (A(4)) and A(6) )OR (A(1) and not (A(2))and  A(6)) OR (A(0) and not (A(2)) and A(6) )OR
	   ('0'and  A(0) and A(1)and  A(2) and A(3) and A(4)and  A(5) and not (A(6)) and '0' )OR 
	   ('1' and not (A(0)) and not (A(1)) and not (A(2)) and not (A(3)) and not (A(4)) and not (A(5)) and not (A(6)) and '1' )OR( '1' and A(4) and A(6));
	 
	  S(7) <= ('0' and not (A(3)) and A(7)) OR ( '0' and not(A(4))and  A(7) )OR ('0' and  not (A(5))  and  A(7) )OR
	  ( '0' and not(A(6))and  A(7) )OR( not (A(2)) and A(7) and '0' )OR( A(6) and A(7) and '1' )OR 
	  (not (A(1)) and A(5)and  A(7) )OR (not (A(0))and  A(4) and A(7) )OR( not (A(2)) and A(3) and A(7) )OR
	   (A(1) and not (A(2)) and A(7) )OR (A(0) and  not (A(2))and  A(7) )OR 
	   ('0' and A(0) and A(1) and A(2) and A(3)and  A(4)and  A(5) and A(6) and not (A(7))and  '0') OR
	    ('1'and  not (A(0))and  not (A(1))and  not (A(2))and not (A(3)) and not (A(4)) and not (A(5)) and not (A(6)) and not (A(7))and  '1' )OR
	     ('1' and A(2) and A(7));  
	 
    carry <= ('0' and not (A(3)) and A(7)) OR ( '0' and not(A(4))and  A(7) )OR ('0' and  not (A(5))  and  A(7) )OR( '0' and not(A(6))and  A(7) )OR( not (A(2)) and A(7) and '0' )OR( A(6) and A(7) and '1' )OR (not (A(1)) and A(5)and  A(7) )OR (not (A(0))and  A(4) and A(7) )OR( not (A(2)) and A(3) and A(7) )OR (A(1) and not (A(2)) and A(7) )OR (A(0) and  not (A(2))and  A(7) )OR ('0' and A(0) and A(1) and A(2) and A(3)and  A(4)and  A(5) and A(6) and not (A(7))and  '0') OR ('1'and  not (A(0))and  not (A(1))and  not (A(2))and not (A(3)) and not (A(4)) and not (A(5)) and not (A(6)) and not (A(7))and  '1' )OR ('1' and A(2) and A(7));  
	 
	  carrybORrow <= carry;  -- Saída o '0'/bORrow
    
end architecture BehaviORal;






