library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WB is -- 32-bit rising-edge triggered register with write-enable and synchronous reset
-- For more information on what the WB does, see page 251 in the textbook
port(
     clk          : in  STD_LOGIC; -- Propogate AddressIn to AddressOut on rising edge of clock
     write_enable : in  STD_LOGIC; -- Only write if '1'
     rst          : in  STD_LOGIC; -- Asynchronous reset! Sets AddressOut to 0x0
     wb_in    : in  STD_LOGIC_VECTOR(1 downto 0); -- Next WB address
     wb_out   : out STD_LOGIC_VECTOR(1 downto 0) -- Current WB address
);
end WB;



architecture Behavioral of WB is
    signal WB_Register : STD_LOGIC_VECTOR(1 downto 0); -- WB register

begin
    process (clk, rst)
    begin
        if rst = '1' then
            WB_Register <= (others => '0'); -- Reset the PC to 0x0 asynchronously
        elsif rising_edge(clk) then
            if write_enable = '1' then
                WB_Register <= wb_in; -- Write new address when write enable is active
            end if;
        end if;
    end process;

    -- Output the current PC value
    wb_out <= WB_Register;

end Behavioral;
