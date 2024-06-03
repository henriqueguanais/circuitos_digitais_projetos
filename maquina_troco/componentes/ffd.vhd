library ieee ;
use ieee.std_logic_1164 .all;

---------------------------------
entity FFD is
port(
		ck, D, Preset, Clear	: in std_logic ;
		q 							: out std_logic := '0'
);
end FFD ;
----------------------------------

architecture logica of FFD is

begin
process(ck, Clear, Preset)
begin
	if (Preset = '1') then q <= '1';
	elsif ( Clear = '1') then q <= '0';
	elsif ( ck'event and ck = '1') then
			q <= D;
	end if;
	
end process ;
end logica;