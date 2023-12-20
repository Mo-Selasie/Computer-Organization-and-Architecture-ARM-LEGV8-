library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EXMEM is --register file for ex/mem pipeline
port(
    clk          : in  STD_LOGIC; 
    write_enable : in  STD_LOGIC; 
    rst          : in  STD_LOGIC;

    alu_in    : in  STD_LOGIC_VECTOR(63 downto 0); 
    rd2_in  : in STD_LOGIC_VECTOR(63 downto 0);
    shift_in : in STD_LOGIC_VECTOR(63 downto 0);
    reg_in : in STD_LOGIC_VECTOR(4 downto 0);
    ALU_Zero_in : in std_logic;
    
    ALU_Zero_out : out std_logic;
    reg_out : out STD_LOGIC_VECTOR(4 downto 0);
    shift_out : out STD_LOGIC_VECTOR(63 downto 0);
    rd2_out : out STD_LOGIC_VECTOR(63 downto 0);
    alu_out   : out STD_LOGIC_VECTOR(63 downto 0) 
);
end EXMEM;



architecture Behavioral of EXMEM is
    --Registers
    signal ALU_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal RD2_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal SHIFT_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal REGWRITE_Register : STD_LOGIC_VECTOR(4 downto 0); 
    signal ALU_ZERO_Register : std_logic;

    
begin
    process (clk, rst)
    begin
        if rst = '1' then
            ALU_Register <= (others => '0'); 
            RD2_Register <= (others => '0'); 
            SHIFT_Register <= (others => '0'); 
            REGWRITE_Register <= (others => '0'); 
            ALU_ZERO_Register <= '0';
            
        elsif rising_edge(clk) then
            if write_enable = '1' then
                ALU_Register <= alu_in; 
                RD2_Register <= rd2_in; 
                SHIFT_Register <= shift_in; 
                REGWRITE_Register <= reg_in;
                ALU_ZERO_Register <= ALU_Zero_in;
            end if;
        end if;
    end process;

    alu_out <= ALU_Register; 
    rd2_out <= RD2_Register; 
    shift_out <= SHIFT_Register; 
    reg_out <= REGWRITE_Register;
    ALU_Zero_out <= ALU_ZERO_Register;

end Behavioral;
