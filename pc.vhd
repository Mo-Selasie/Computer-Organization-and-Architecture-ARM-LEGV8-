library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is -- 32-bit rising-edge triggered register with write-enable and synchronous reset
-- For more information on what the PC does, see page 251 in the textbook
port(
     clk          : in  STD_LOGIC; -- Propogate AddressIn to AddressOut on rising edge of clock
     write_enable : in  STD_LOGIC; -- Only write if '1'
     rst          : in  STD_LOGIC; -- Asynchronous reset! Sets AddressOut to 0x0
     AddressIn    : in  STD_LOGIC_VECTOR(63 downto 0); -- Next PC address
     AddressOut   : out STD_LOGIC_VECTOR(63 downto 0) -- Current PC address
);
end PC;



architecture Behavioral of PC is
    signal PC_Register : STD_LOGIC_VECTOR(63 downto 0); -- PC register

begin
    process (clk, rst)
    begin
        if rst = '1' then
            PC_Register <= (others => '0'); -- Reset the PC to 0x0 asynchronously
        elsif rising_edge(clk) then
            if write_enable = '1' then
                PC_Register <= AddressIn; -- Write new address when write enable is active
            end if;
        end if;
    end process;

    -- Output the current PC value
    AddressOut <= PC_Register;

end Behavioral;
