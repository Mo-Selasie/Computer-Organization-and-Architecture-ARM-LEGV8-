library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EX is --Register file for EX stage signals 
port(
     clk          : in  STD_LOGIC; -- Propogate ex_in to ex_out on rising edge of clock
     write_enable : in  STD_LOGIC; -- Only write if '1'
     rst          : in  STD_LOGIC; -- Asynchronous reset! Sets ex_out to 0x0
     ex_in    : in  STD_LOGIC_VECTOR(2 downto 0); -- Next EX address
     ex_out   : out STD_LOGIC_VECTOR(2 downto 0) -- Current EX address
);
end EX;



architecture Behavioral of EX is
    signal EX_Register : STD_LOGIC_VECTOR(2 downto 0); -- EX register

begin
    process (clk, rst)
    begin
        if rst = '1' then
            EX_Register <= (others => '0'); -- Reset the signals to 0x0 asynchronously
        elsif rising_edge(clk) then
            if write_enable = '1' then
                EX_Register <= ex_in; 
            end if;
        end if;
    end process;

    -- Output the current signal values
    ex_out <= EX_Register;

end Behavioral;
