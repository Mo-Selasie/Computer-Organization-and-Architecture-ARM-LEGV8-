library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AND2 is
    port(
        in0: in std_logic;
        in1: in std_logic;
        output: out std_logic
    );
end AND2;

architecture dataflow of AND2 is
begin
    output <= in0 and in1;
end dataflow;
