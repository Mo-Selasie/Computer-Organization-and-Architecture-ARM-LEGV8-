library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEMWB is
port(
    clk          : in  STD_LOGIC; 
    write_enable : in  STD_LOGIC; 
    rst          : in  STD_LOGIC;
    
    readIn  : in STD_LOGIC_VECTOR(63 downto 0);
    resIn : in STD_LOGIC_VECTOR(63 downto 0);
    reg_in : in STD_LOGIC_VECTOR(4 downto 0);
    
    reg_out : out STD_LOGIC_VECTOR(4 downto 0);
    resOut : out STD_LOGIC_VECTOR(63 downto 0);
    readOut : out STD_LOGIC_VECTOR(63 downto 0)
);
end MEMWB;



architecture Behavioral of MEMWB is
    signal Read_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal Res_Register : STD_LOGIC_VECTOR(63 downto 0); 
    signal REGWRITE_Register : STD_LOGIC_VECTOR(4 downto 0); 

    
begin
    process (clk, rst)
    begin
        if rst = '1' then
            Read_Register <= (others => '0'); 
            Res_Register <= (others => '0'); 
            REGWRITE_Register <= (others => '0'); 
            
        elsif rising_edge(clk) then
            if write_enable = '1' then
                Read_Register <= readIn; 
                Res_Register <= resIn; 
                REGWRITE_Register <= reg_in;
            end if;
        end if;
    end process;

    readOut <= Read_Register; 
    resOut <= Res_Register; 
    reg_out <= REGWRITE_Register;

end Behavioral;
