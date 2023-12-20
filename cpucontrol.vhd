library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CPUControl is
port(Opcode   : in  STD_LOGIC_VECTOR(10 downto 0);
     Reg2Loc   : out STD_LOGIC;
     CBranch  : out STD_LOGIC;  --conditional
     MemRead  : out STD_LOGIC;
     MemtoReg : out STD_LOGIC;
     MemWrite : out STD_LOGIC;
     ALUSrc   : out STD_LOGIC;
     RegWrite : out STD_LOGIC;
     UBranch  : out STD_LOGIC; -- This is unconditional
     ALUOp    : out STD_LOGIC_VECTOR(1 downto 0)
);
end CPUControl;

architecture behavioral of CPUControl is
begin
     process(Opcode)
     begin
          if Opcode = "11111000010" then --LDUR 
               Reg2loc <= 'X';
               CBranch  <=  '0'; 
               MemRead   <=  '1';
               MemtoReg  <=  '1';
               MemWrite  <=  '0';
               ALUSrc    <=  '1';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "00";
          elsif Opcode = "11111000000" then --STUR
               Reg2Loc    <=  '1';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg <= 'X';
               MemWrite  <=  '1';
               ALUSrc    <=   '1';
               RegWrite  <=  '0';
               UBranch <= '0';
               ALUOp     <=  "00"; 
          elsif Opcode(10 downto 3) = "10110100" then --CBZ
               Reg2Loc    <=  '1';
               CBranch   <=  '1';  
               MemRead   <=  '0';
               MemtoReg <= 'X';
               MemWrite  <=  '0';
               ALUSrc    <=   '0';
               RegWrite  <=  '0';
               UBranch <= '0';
               ALUOp     <=  "01"; 
          elsif Opcode(10 downto 3) = "10110101" then --CBNZ
               Reg2Loc    <=  '1';
               CBranch   <=  '1';  
               MemRead   <=  '0';
               MemtoReg <= 'X';
               MemWrite  <=  '0';
               ALUSrc    <=   '0';
               RegWrite  <=  '0';
               UBranch <= '0';
               ALUOp     <=  "01"; 
          elsif Opcode(10) = '1' and Opcode(7 downto 4) = "0101" and Opcode(2 downto 0) = "000" then --R-type (1XX0101X000)
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '0';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "10";
          elsif Opcode(10 downto 5) = "000101" then --B
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '0';
               RegWrite  <=  '0';
               UBranch <= '1';
               ALUOp     <=  "01";
          elsif Opcode(10 downto 1) = "1001000100" then --ADDI
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '1';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "10";
          elsif Opcode(10 downto 1) = "1101000100" then --SUBI
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '1';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "10";
          elsif Opcode(10 downto 1) = "1001001000" then --ANDI
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '1';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "10";
          elsif Opcode(10 downto 1) = "1011001000" then --ORRI
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '1';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "10";
          
          elsif Opcode = "11010011011" or Opcode = "11010011010" then --LSL and LSR
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '1';
               RegWrite  <=  '1';
               UBranch <= '0';
               ALUOp     <=  "10";
          
          elsif Opcode = "00000000000" then --NOP
               Reg2Loc    <=  '0';
               CBranch   <=  '0';  
               MemRead   <=  '0';
               MemtoReg  <=  '0';
               MemWrite  <=  '0';
               ALUSrc    <=   '0';
               RegWrite  <=  '0';
               UBranch <= '0';
               ALUOp     <=  "00";

          end if;
          
     end process;
end behavioral;
