library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ADD is
-- Adds two signed 64-bit inputs
-- output = in1 + in2
port(
     in0    : in  STD_LOGIC_VECTOR(63 downto 0);
     in1    : in  STD_LOGIC_VECTOR(63 downto 0);
     output : out STD_LOGIC_VECTOR(63 downto 0)
);
end ADD;

architecture structural of ADD is
     component partial_full_adder is
          port(
              a : in STD_LOGIC;
              b : in STD_LOGIC;
              Cin : in STD_LOGIC;
              s : out STD_LOGIC;
              Cout : out STD_LOGIC
          );
      end component;

     signal C : std_logic_vector(63 downto 0);
begin

     FA0: partial_full_adder port map (a => in0(0), b => in1(0), Cin => '0', s => output(0), Cout => C(0));
     FA1: partial_full_adder port map (a => in0(1), b => in1(1), Cin => C(0), s => output(1), Cout => C(1));
     FA2: partial_full_adder port map (a => in0(2), b => in1(2), Cin => C(1), s => output(2), Cout => C(2));
     FA3: partial_full_adder port map (a => in0(3), b => in1(3), Cin => C(2), s => output(3), Cout => C(3));
     FA4: partial_full_adder port map (a => in0(4), b => in1(4), Cin => C(3), s => output(4), Cout => C(4));
     FA5: partial_full_adder port map (a => in0(5), b => in1(5), Cin => C(4), s => output(5), Cout => C(5));
     FA6: partial_full_adder port map (a => in0(6), b => in1(6), Cin => C(5), s => output(6), Cout => C(6));
     FA7: partial_full_adder port map (a => in0(7), b => in1(7), Cin => C(6), s => output(7), Cout => C(7));

     FA8: partial_full_adder port map (a => in0(8), b => in1(8), Cin => C(7), s => output(8), Cout => C(8));
     FA9: partial_full_adder port map (a => in0(9), b => in1(9), Cin => C(8), s => output(9), Cout => C(9));
     FA10: partial_full_adder port map (a => in0(10), b => in1(10), Cin => C(9), s => output(10), Cout => C(10));
     FA11: partial_full_adder port map (a => in0(11), b => in1(11), Cin => C(10), s => output(11), Cout => C(11));
     FA12: partial_full_adder port map (a => in0(12), b => in1(12), Cin => C(11), s => output(12), Cout => C(12));
     FA13: partial_full_adder port map (a => in0(13), b => in1(13), Cin => C(12), s => output(13), Cout => C(13));
     FA14: partial_full_adder port map (a => in0(14), b => in1(14), Cin => C(13), s => output(14), Cout => C(14));
     FA15: partial_full_adder port map (a => in0(15), b => in1(15), Cin => C(14), s => output(15), Cout => C(15));

     FA16: partial_full_adder port map (a => in0(16), b => in1(16), Cin => C(15), s => output(16), Cout => C(16));
     FA17: partial_full_adder port map (a => in0(17), b => in1(17), Cin => C(16), s => output(17), Cout => C(17));
     FA18: partial_full_adder port map (a => in0(18), b => in1(18), Cin => C(17), s => output(18), Cout => C(18));
     FA19: partial_full_adder port map (a => in0(19), b => in1(19), Cin => C(18), s => output(19), Cout => C(19));
     FA20: partial_full_adder port map (a => in0(20), b => in1(20), Cin => C(19), s => output(20), Cout => C(20));
     FA21: partial_full_adder port map (a => in0(21), b => in1(21), Cin => C(20), s => output(21), Cout => C(21));
     FA22: partial_full_adder port map (a => in0(22), b => in1(22), Cin => C(21), s => output(22), Cout => C(22));
     FA23: partial_full_adder port map (a => in0(23), b => in1(23), Cin => C(22), s => output(23), Cout => C(23));

     FA24: partial_full_adder port map (a => in0(24), b => in1(24), Cin => C(23), s => output(24), Cout => C(24));
     FA25: partial_full_adder port map (a => in0(25), b => in1(25), Cin => C(24), s => output(25), Cout => C(25));
     FA26: partial_full_adder port map (a => in0(26), b => in1(26), Cin => C(25), s => output(26), Cout => C(26));
     FA27: partial_full_adder port map (a => in0(27), b => in1(27), Cin => C(26), s => output(27), Cout => C(27));
     FA28: partial_full_adder port map (a => in0(28), b => in1(28), Cin => C(27), s => output(28), Cout => C(28));
     FA29: partial_full_adder port map (a => in0(29), b => in1(29), Cin => C(28), s => output(29), Cout => C(29));
     FA30: partial_full_adder port map (a => in0(30), b => in1(30), Cin => C(29), s => output(30), Cout => C(30));
     FA31: partial_full_adder port map (a => in0(31), b => in1(31), Cin => C(30), s => output(31), Cout => C(31));

     FA32: partial_full_adder port map (a => in0(32), b => in1(32), Cin => C(31), s => output(32), Cout => C(32));
     FA33: partial_full_adder port map (a => in0(33), b => in1(33), Cin => C(32), s => output(33), Cout => C(33));
     FA34: partial_full_adder port map (a => in0(34), b => in1(34), Cin => C(33), s => output(34), Cout => C(34));
     FA35: partial_full_adder port map (a => in0(35), b => in1(35), Cin => C(34), s => output(35), Cout => C(35));
     FA36: partial_full_adder port map (a => in0(36), b => in1(36), Cin => C(35), s => output(36), Cout => C(36));
     FA37: partial_full_adder port map (a => in0(37), b => in1(37), Cin => C(36), s => output(37), Cout => C(37));
     FA38: partial_full_adder port map (a => in0(38), b => in1(38), Cin => C(37), s => output(38), Cout => C(38));
     FA39: partial_full_adder port map (a => in0(39), b => in1(39), Cin => C(38), s => output(39), Cout => C(39));

     FA40: partial_full_adder port map (a => in0(40), b => in1(40), Cin => C(39), s => output(40), Cout => C(40));
     FA41: partial_full_adder port map (a => in0(41), b => in1(41), Cin => C(40), s => output(41), Cout => C(41));
     FA42: partial_full_adder port map (a => in0(42), b => in1(42), Cin => C(41), s => output(42), Cout => C(42));
     FA43: partial_full_adder port map (a => in0(43), b => in1(43), Cin => C(42), s => output(43), Cout => C(43));
     FA44: partial_full_adder port map (a => in0(44), b => in1(44), Cin => C(43), s => output(44), Cout => C(44));
     FA45: partial_full_adder port map (a => in0(45), b => in1(45), Cin => C(44), s => output(45), Cout => C(45));
     FA46: partial_full_adder port map (a => in0(46), b => in1(46), Cin => C(45), s => output(46), Cout => C(46));
     FA47: partial_full_adder port map (a => in0(47), b => in1(47), Cin => C(46), s => output(47), Cout => C(47));

     FA48: partial_full_adder port map (a => in0(48), b => in1(48), Cin => C(47), s => output(48), Cout => C(48));
     FA49: partial_full_adder port map (a => in0(49), b => in1(49), Cin => C(48), s => output(49), Cout => C(49));
     FA50: partial_full_adder port map (a => in0(50), b => in1(50), Cin => C(49), s => output(50), Cout => C(50));
     FA51: partial_full_adder port map (a => in0(51), b => in1(51), Cin => C(50), s => output(51), Cout => C(51));
     FA52: partial_full_adder port map (a => in0(52), b => in1(52), Cin => C(51), s => output(52), Cout => C(52));
     FA53: partial_full_adder port map (a => in0(53), b => in1(53), Cin => C(52), s => output(53), Cout => C(53));
     FA54: partial_full_adder port map (a => in0(54), b => in1(54), Cin => C(53), s => output(54), Cout => C(54));
     FA55: partial_full_adder port map (a => in0(55), b => in1(55), Cin => C(54), s => output(55), Cout => C(55));

     FA56: partial_full_adder port map (a => in0(56), b => in1(56), Cin => C(55), s => output(56), Cout => C(56));
     FA57: partial_full_adder port map (a => in0(57), b => in1(57), Cin => C(56), s => output(57), Cout => C(57));
     FA58: partial_full_adder port map (a => in0(58), b => in1(58), Cin => C(57), s => output(58), Cout => C(58));
     FA59: partial_full_adder port map (a => in0(59), b => in1(59), Cin => C(58), s => output(59), Cout => C(59));
     FA60: partial_full_adder port map (a => in0(60), b => in1(60), Cin => C(59), s => output(60), Cout => C(60));
     FA61: partial_full_adder port map (a => in0(61), b => in1(61), Cin => C(60), s => output(61), Cout => C(61));
     FA62: partial_full_adder port map (a => in0(62), b => in1(62), Cin => C(61), s => output(62), Cout => C(62));
     FA63: partial_full_adder port map (a => in0(63), b => in1(63), Cin => C(62), s => output(63), Cout => C(63));

     --overflow = Cin xor Cout for msb

     
end structural;
