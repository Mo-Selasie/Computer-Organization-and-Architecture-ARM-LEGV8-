library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity OR2 is
    port(
        in0: in std_logic;
        in1: in std_logic;
        output: out std_logic
    );
end OR2;

architecture dataflow of OR2 is
begin
    output <= in0 or in1;
end dataflow;
