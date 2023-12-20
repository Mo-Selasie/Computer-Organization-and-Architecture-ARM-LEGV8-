library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALUControl is
port(
     ALUOp     : in  STD_LOGIC_VECTOR(1 downto 0);
     Opcode    : in  STD_LOGIC_VECTOR(10 downto 0);
     Operation : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ALUControl;

architecture behavioral of ALUControl is
begin
    process(ALUOp, Opcode)
    begin
        case ALUOp is
            when "00" => --
                Operation <= "0010";
            when "01" =>
                if Opcode(10 downto 3) = "10110101" then
                    Operation <= "0101";
                else
                    Operation <= "0111";
                end if;
            when "10" =>
                case Opcode is
                    when "10001011000" => --add opcode
                        Operation <= "0010";
                    when "10010001000" => --addi
                        Operation <= "0010";
                    when "10010001001" => --addi
                        Operation <= "0010";
                    when "11001011000" => --subtract opcode
                        Operation <= "0110";
                    when "11010001000" => --subi
                        Operation <= "0110";
                    when "11010001001" => --subi
                        Operation <= "0110";
                    when "10001010000" => --and opcode
                        Operation <= "0000";
                    when "10010010000" => --andi 
                        Operation <= "0000";
                    when "10010010001" => --andi 
                        Operation <= "0000";
                    when "10101010000" => --or opcode 
                        Operation <= "0001";
                    when "10110010000" => --orri
                        Operation <= "0001";
                    when "10110010001" => --orri
                        Operation <= "0001";
                    when "11010011011" => --lsl
                        Operation <= "0011";
                    when "11010011010" => --lsr
                        Operation <= "0100";
                    when others => 
                        Operation <= "XXXX";
                end case;
            when "11" =>
                case Opcode is
                    when "10001011000" => --add opcode
                        Operation <= "0010";
                    when "10010001000" => --addi
                        Operation <= "0010";
                    when "10010001001" => --addi
                        Operation <= "0010";
                    when "11001011000" => --subtract opcode
                        Operation <= "0110";
                    when "11010001000" => --subi
                        Operation <= "0110";
                    when "11010001001" => --subi
                        Operation <= "0110";
                    when "10001010000" => --and opcode
                        Operation <= "0000";
                    when "10010010000" => --andi 
                        Operation <= "0000";
                    when "10010010001" => --andi 
                        Operation <= "0000";
                    when "10101010000" => --or opcode 
                        Operation <= "0001";
                    when "10110010000" => --orri
                        Operation <= "0001";
                    when "10110010001" => --orri
                        Operation <= "0001";
                    when "11010011011" => --lsl
                        Operation <= "0011";
                    when "11010011010" => --lsr
                        Operation <= "0100";
                    when others => 
                        Operation <= "XXXX";
                end case;
            when others => 
                Operation <= "XXXX";
        end case;
    end process;
end behavioral;
