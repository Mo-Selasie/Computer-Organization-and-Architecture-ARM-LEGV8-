library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IFID is --Register file for IF/ID pipeline
port(
     clk          : in  STD_LOGIC; 
     write_enable : in  STD_LOGIC; 
     rst          : in  STD_LOGIC;

     pc_in    : in  STD_LOGIC_VECTOR(63 downto 0); 
     imem_in  : in STD_LOGIC_VECTOR(31 downto 0); 

     imem_out : out STD_LOGIC_VECTOR(31 downto 0); 
     pc_out   : out STD_LOGIC_VECTOR(63 downto 0) 
);
end IFID;



architecture Behavioral of IFID is
    signal PC_Register : STD_LOGIC_VECTOR(63 downto 0);
    signal IMEM_Register : STD_LOGIC_VECTOR(31 downto 0); 

begin
    process (clk, rst)
    begin
        if rst = '1' then
            PC_Register <= (others => '0'); 
            IMEM_Register <= (others => '0'); 
        elsif rising_edge(clk) then
            if write_enable = '1' then
                PC_Register <= pc_in;
                IMEM_Register <= imem_in; 
            end if;
        end if;
    end process;

    pc_out <= PC_Register;
    imem_out <= IMEM_Register;

end Behavioral;
