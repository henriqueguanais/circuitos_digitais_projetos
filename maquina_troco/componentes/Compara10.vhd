library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator10 is
    Port (
        A : in  STD_LOGIC_VECTOR(9 downto 0);
        B : in  STD_LOGIC_VECTOR(9 downto 0);
        A_gt_B : out STD_LOGIC
    );
end Comparator10;

architecture Behavioral of Comparator10 is
    signal gt: STD_LOGIC_VECTOR(9 downto 0);
    signal eq: STD_LOGIC_VECTOR(9 downto 0);
    signal cmp_result: STD_LOGIC;
begin
    -- Compare each bit
    gt(9) <= A(9) and not B(9);
    eq(9) <= not (A(9) xor B(9));

    gt(8) <= eq(9) and A(8) and not B(8);
    eq(8) <= eq(9) and not (A(8) xor B(8));

    gt(7) <= eq(8) and A(7) and not B(7);
    eq(7) <= eq(8) and not (A(7) xor B(7));

    gt(6) <= eq(7) and A(6) and not B(6);
    eq(6) <= eq(7) and not (A(6) xor B(6));

    gt(5) <= eq(6) and A(5) and not B(5);
    eq(5) <= eq(6) and not (A(5) xor B(5));

    gt(4) <= eq(5) and A(4) and not B(4);
    eq(4) <= eq(5) and not (A(4) xor B(4));

    gt(3) <= eq(4) and A(3) and not B(3);
    eq(3) <= eq(4) and not (A(3) xor B(3));

    gt(2) <= eq(3) and A(2) and not B(2);
    eq(2) <= eq(3) and not (A(2) xor B(2));

    gt(1) <= eq(2) and A(1) and not B(1);
    eq(1) <= eq(2) and not (A(1) xor B(1));

    gt(0) <= eq(1) and A(0) and not B(0);
    eq(0) <= eq(1) and not (A(0) xor B(0));

    -- Determine if A is greater than B
    cmp_result <= gt(9) or gt(8) or gt(7) or gt(6) or gt(5) or gt(4) or gt(3) or gt(2) or gt(1) or gt(0);
    
    -- Assign the result to the output
    A_gt_B <= cmp_result;
end Behavioral;

