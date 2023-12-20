library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUX8 is -- Two by one mux with 5 bit inputs/outputs
port(
    mem_in : in STD_LOGIC_VECTOR(3 downto 0);
    exec_in : in std_logic_vector(2 downto 0);
    wb_in : in std_logic_vector(1 downto 0);
    sel    : in STD_LOGIC; -- selects in0 or in1
    mem_out : out STD_LOGIC_VECTOR(3 downto 0);
    exec_out : out std_logic_vector(2 downto 0);
    wb_out : out std_logic_vector(1 downto 0)
);
end MUX8;

architecture dataflow of MUX8 is
begin
    process(all)
    begin
        if (sel = '1') then
            mem_out <= mem_in;
            exec_out <= exec_in;
            wb_out <= wb_in;
        else
            mem_out <= "0000";
            exec_out <= "000";
            wb_out <= "00";
        end if;
    end process;

end dataflow;
