library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mem is 
port(
     clk          : in  STD_LOGIC; -- Propogate m_in to m_out on rising edge of clock
     write_enable : in  STD_LOGIC; -- Only write if '1'
     rst          : in  STD_LOGIC; -- Asynchronous reset! Sets m_out to 0x0
     m_in    : in  STD_LOGIC_VECTOR(3 downto 0); 
     m_out   : out STD_LOGIC_VECTOR(3 downto 0) 
);
end Mem;



architecture Behavioral of Mem is
    signal M_Register : STD_LOGIC_VECTOR(3 downto 0); 

begin
    process (clk, rst)
    begin
        if rst = '1' then
            M_Register <= (others => '0');
        elsif rising_edge(clk) then
            if write_enable = '1' then
                M_Register <= m_in; 
            end if;
        end if;
    end process;

    m_out <= M_Register;

end Behavioral;
