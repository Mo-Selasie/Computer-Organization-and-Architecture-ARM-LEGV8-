library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FUMUX64 is -- Two by one mux with 64 bit inputs/outputs
port(
    in00    : in STD_LOGIC_VECTOR(63 downto 0); -- sel == 00
    in01    : in STD_LOGIC_VECTOR(63 downto 0); -- sel == 01
    in10    : in STD_LOGIC_VECTOR(63 downto 0); -- sel == 10
    sel    : in STD_LOGIC_VECTOR(1 downto 0); -- selects in00 or in01 or in10
    output : out STD_LOGIC_VECTOR(63 downto 0)
);
end FUMUX64;

architecture dataflow of FUMUX64 is
begin
    process(in00, in01, in10, sel)
    begin
        case sel is
            when "00" =>
                output <= in00;
            when "01" =>
                output <= in01;
            when "10" =>
                output <= in10;
            when others =>
                output <= X"0000000000000000";
        end case;
    end process;
end dataflow;