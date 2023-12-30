library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
-- Implement: AND, OR, ADD (signed), SUBTRACT, and all other alu operations for Legv8
port(
     in0       : in     STD_LOGIC_VECTOR(63 downto 0);
     in1       : in     STD_LOGIC_VECTOR(63 downto 0);
     operation : in     STD_LOGIC_VECTOR(3 downto 0);
     result    : buffer STD_LOGIC_VECTOR(63 downto 0);
     zero      : buffer STD_LOGIC;
     overflow  : buffer STD_LOGIC
    );
end ALU;

architecture behavioral of ALU is
    component ADD is
        port(
            in0    : in  STD_LOGIC_VECTOR(63 downto 0);
            in1    : in  STD_LOGIC_VECTOR(63 downto 0);
            output : out STD_LOGIC_VECTOR(63 downto 0)
       );
    end component;

    signal sum : std_logic_vector(63 downto 0);
    signal diff : std_logic_vector(63 downto 0);
    signal const : std_logic_vector(63 downto 0) := X"0000000000000001";
    signal in1_twos : std_logic_vector(63 downto 0);

    begin
        addition : ADD port map (in0, in1, sum);
        twos : ADD port map (not in1, const, in1_twos);
        subtraction : ADD port map (in0, in1_twos, diff);

        process(in1, in0, operation, sum, diff, result)
        begin
            case operation is 
                when "0000" =>
                    result <= in0 and in1;
                    overflow <= '0';
                    if result = X"0000000000000000" then
                        zero <= '1';
                    else
                        zero <= '0';
                    end if;

                --OR     
                when "0001" =>
                    result <= in0 or in1;
                    overflow <= '0';
                    if result = X"0000000000000000" then
                        zero <= '1';
                    else
                        zero <= '0';
                    end if;

                --ADD
                when "0010" =>
                    result <= sum;

                    if (in1(63) = in0(63)) then
                        if in1(63) /= result (63) then 
                            overflow <= '1';
                        end if;

                    else 
                        overflow <= '0';
                    end if;

                    if result = X"0000000000000000" then
                        zero <= '1';
                    else
                        zero <= '0';
                    end if;

                --SUB
                when "0110" =>
                    result <= diff;
                    if (in1(63) /= in0(63)) then
                        if (result (63) = in1(63)) then
                            overflow <= '1';
                        end if;
                    else
                        overflow <= '0';
                    end if;
                
                when "0111" =>
                    result <= in1;
                    if result = X"0000000000000000" then
                        zero <= '1';
                    else
                        zero <= '0';
                    end if;
                
                when "0101" =>
                    result <= in1;
                    if result = X"0000000000000000" then
                        zero <= '0';
                    else
                        zero <= '1';
                    end if;
                    
                when "0011" => 
                    result <= in0 sll to_integer(unsigned(in1));
                    if result = X"0000000000000000" then
                        zero <= '1';
                    else
                        zero <= '0';
                    end if;

                when "0100" => 
                    result <= in0 srl to_integer(unsigned(in1));
                    if result = X"0000000000000000" then
                        zero <= '1';
                    else
                        zero <= '0';
                    end if;
                when others => 
                    overflow <= '0';
            end case;
        end process;
end behavioral;
