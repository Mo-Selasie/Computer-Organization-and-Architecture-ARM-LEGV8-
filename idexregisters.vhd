library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IDEX is
port(
    clk          : in  STD_LOGIC; 
    write_enable : in  STD_LOGIC; 
    rst          : in  STD_LOGIC;

    rd1_in    : in  STD_LOGIC_VECTOR(63 downto 0); 
    rd2_in  : in STD_LOGIC_VECTOR(63 downto 0);
    signextend_in : in STD_LOGIC_VECTOR(63 downto 0);
    pc_in   : in STD_LOGIC_VECTOR(63 downto 0);
    opcode_in : in STD_LOGIC_VECTOR(10 downto 0);
    reg_in : in STD_LOGIC_VECTOR(4 downto 0);
    reg_rn1_in : in STD_LOGIC_VECTOR(4 downto 0);
    reg_rm2_in : in STD_LOGIC_VECTOR(4 downto 0);
    
    reg_rm2_out : out std_logic_vector(4 downto 0);
    reg_rn1_out : out STD_LOGIC_VECTOR(4 downto 0);
    reg_out : out STD_LOGIC_VECTOR(4 downto 0);
    opcode_out : out STD_LOGIC_VECTOR(10 downto 0);
    pc_out  : out STD_LOGIC_VECTOR(63 downto 0);
    signextend_out : out STD_LOGIC_VECTOR(63 downto 0);
    rd2_out : out STD_LOGIC_VECTOR(63 downto 0);
    rd1_out   : out STD_LOGIC_VECTOR(63 downto 0) 
);
end IDEX;



architecture Behavioral of IDEX is
    signal RD1_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal RD2_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal SIGNEXTEND_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal PC_Register : STD_LOGIC_VECTOR(63 downto 0);
    signal OPCODE_Register : STD_LOGIC_VECTOR(10 downto 0); 
    signal REGWRITE_Register : STD_LOGIC_VECTOR(4 downto 0); 
    signal Rn1_register  : STD_LOGIC_VECTOR(4 downto 0);
    signal Rm2_register  : STD_LOGIC_VECTOR(4 downto 0);

    
begin
    process (clk, rst)
    begin
        if rst = '1' then
            RD1_Register <= (others => '0'); 
            RD2_Register <= (others => '0'); 
            SIGNEXTEND_Register <= (others => '0'); 
            PC_Register <= (others => '0'); 
            OPCODE_Register <= (others => '0'); 
            REGWRITE_Register <= (others => '0'); 
            Rn1_register  <= (others => '0');
            Rm2_register  <= (others => '0');
            
        elsif rising_edge(clk) then
            if write_enable = '1' then
                RD1_Register <= rd1_in; 
                RD2_Register <= rd2_in; 
                SIGNEXTEND_Register <= signextend_in; 
                PC_Register <= pc_in; 
                OPCODE_Register <= opcode_in; 
                REGWRITE_Register <= reg_in;
                Rn1_register  <= reg_rn1_in;
                Rm2_register  <= reg_rm2_in;
            end if;
        end if;
    end process;

    rd1_out <= RD1_Register; 
    rd2_out <= RD2_Register; 
    signextend_out <= SIGNEXTEND_Register; 
    pc_out <= PC_Register; 
    opcode_out <= OPCODE_Register; 
    reg_out <= REGWRITE_Register;
    reg_rn1_out <= Rn1_register;
    reg_rm2_out <= Rm2_register;

end Behavioral;
