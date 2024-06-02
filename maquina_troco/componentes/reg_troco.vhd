library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fixed_register is
    Port (
        clk     : in STD_LOGIC;
        rst     : in STD_LOGIC;
        load    : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(9 downto 0);
        data_out: out STD_LOGIC_VECTOR(9 downto 0)
    );
end entity fixed_register;

architecture Behavioral of fixed_register is
begin
    -- Assign the value based on clock and load signals
    data_out <= (rst = '1') ? (others => '0') : (load = '1') ? data_in : data_out;
end architecture Behavioral;