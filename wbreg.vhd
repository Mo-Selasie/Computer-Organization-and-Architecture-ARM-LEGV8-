library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WB is --Register file for memory write back signals
port(
     clk          : in  STD_LOGIC; 
     write_enable : in  STD_LOGIC; -- Only write if '1'
     rst          : in  STD_LOGIC; -- Asynchronous reset! Sets AddressOut to 0x0
     wb_in    : in  STD_LOGIC_VECTOR(1 downto 0); -- Next WB signals
     wb_out   : out STD_LOGIC_VECTOR(1 downto 0) -- Current WB signal
);
end WB;



architecture Behavioral of WB is
    signal WB_Register : STD_LOGIC_VECTOR(1 downto 0); -- WB register

begin
    process (clk, rst)
    begin
        if rst = '1' then
            WB_Register <= (others => '0'); -- Reset the signals to 0x0 asynchronously
        elsif rising_edge(clk) then
            if write_enable = '1' then
                WB_Register <= wb_in; 
            end if;
        end if;
    end process;

    -- Output the current signal values
    wb_out <= WB_Register;

end Behavioral;
