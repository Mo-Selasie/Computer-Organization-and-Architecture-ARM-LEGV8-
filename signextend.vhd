-- library IEEE;
-- use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

-- entity SignExtend is
--     port(
--          x : in  STD_LOGIC_VECTOR(31 downto 0);
--          y : out STD_LOGIC_VECTOR(63 downto 0) -- sign-extend(x)
--     );
-- end SignExtend;

-- architecture dataflow of SignExtend is
-- begin
--      y <= X"11111111" & x(31 downto 0) when x(31) = '1' else X"00000000" & x(31 downto 0);
-- end dataflow;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SignExtend is
    port(
         x : in  STD_LOGIC_VECTOR(31 downto 0);
         opcode : in STD_LOGIC_VECTOR(10 downto 0);
         y : out STD_LOGIC_VECTOR(63 downto 0) -- sign-extend(x)
    );
end SignExtend;

architecture dataflow of SignExtend is
begin
    process(opcode, x)
    begin
        if opcode(10 downto 1) = "1001000100" then --ADDI
            y <= "1111111111111111111111111111111111111111111111111111" & x(21 downto 10) when x(21) = '1' 
            else "0000000000000000000000000000000000000000000000000000" & x(21 downto 10);
        elsif opcode(10 downto 1) = "1101000100" then --SUBI
            y <= "111111111111111111111111111111111111111111111111111" & x(21 downto 10) when x(21) = '1' 
            else "0000000000000000000000000000000000000000000000000000" & x(21 downto 10);
        elsif opcode = "11111000010" then --LDUR
            y <= "1111111111111111111111111111111111111111111111111111111" & x(20 downto 12) when x(20) = '1' 
            else "0000000000000000000000000000000000000000000000000000000" & x(20 downto 12);
        elsif opcode = "11111000000" then --STUR
            y <= "1111111111111111111111111111111111111111111111111111111" & x(20 downto 12) when x(20) = '1' 
            else "0000000000000000000000000000000000000000000000000000000" & x(20 downto 12);
        elsif opcode(10 downto 3) = "10110100" or opcode(10 downto 3) = "10110101"then --CBZ and CBNZ
            y <= "111111111111111111111111111111111111111111111" & x(23 downto 5) when x(23) = '1' 
            else "000000000000000000000000000000000000000000000" & x(23 downto 5);
        elsif opcode(10 downto 5) = "000101" then --B
            y <= "11111111111111111111111111111111111111" & x(25 downto 0) when x(25) = '1' 
            else "00000000000000000000000000000000000000" & x(25 downto 0);
        elsif opcode(10 downto 1) = "1001001000" then --ANDI
            y <= "1111111111111111111111111111111111111111111111111111" & x(21 downto 10) when x(21) = '1' 
            else "0000000000000000000000000000000000000000000000000000" & x(21 downto 10);
        elsif opcode(10 downto 1) = "1011001000" then --ORRI
            y <= "111111111111111111111111111111111111111111111111111" & x(21 downto 10) when x(21) = '1' 
            else "0000000000000000000000000000000000000000000000000000" & x(21 downto 10);
        elsif opcode = "11010011011" then --LSL
            y <= "1111111111111111111111111111111111111111111111111111111111" & x(15 downto 10) when x(15) = '1' 
            else "0000000000000000000000000000000000000000000000000000000000" & x(15 downto 10);
        elsif opcode = "11010011010" then --LSR
            y <= "1111111111111111111111111111111111111111111111111111111111" & x(15 downto 10) when x(15) = '1' 
            else "0000000000000000000000000000000000000000000000000000000000" & x(15 downto 10);
        end if;

    end process;
end dataflow;
