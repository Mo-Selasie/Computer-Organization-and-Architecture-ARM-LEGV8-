library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUX10 is -- Two by one mux with 10 bit inputs/outputs for cpu control
    --Used to insert NOP instruction signals
port(
    in0    : in STD_LOGIC_VECTOR(9 downto 0); -- sel == 0
    in1    : in STD_LOGIC_VECTOR(9 downto 0); -- sel == 1
    sel    : in STD_LOGIC; -- selects in0 or in1
    output : out STD_LOGIC_VECTOR(9 downto 0)
);
end MUX10;

architecture dataflow of MUX10 is
begin
    
    output <= in1 when sel='1' else in0;

end dataflow;
