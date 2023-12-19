library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity partial_full_adder is
    port(
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        Cin : in STD_LOGIC;
        s : out STD_LOGIC; 
        Cout : out std_logic
    );
end partial_full_adder;

architecture dataflow of partial_full_adder is
begin 
    s <= a xor b xor Cin;
    Cout <= (a and b) or ((a xor b) and Cin);
    
end dataflow;