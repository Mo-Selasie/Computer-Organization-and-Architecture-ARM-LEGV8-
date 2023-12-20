library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hdunit is
    port(
        ID_EX_memRead        : in std_logic;
        ID_EXregRd     : in std_logic_vector(4 downto 0); -- this is ID_EX_40_out  
        IF_IDregRn1    : in std_logic_vector(4 downto 0);
        IF_IDregRm2    : in std_logic_vector(4 downto 0);
        -------------------------------------------------------
        PC_EN     : out std_logic;
        IF_ID_write : out std_logic;
        ctrl_mux  : out std_logic
    );
end hdunit;

architecture behavioral of hdunit is

begin
    process (all) 
    begin
        if ( ID_EX_memRead = '1' and ( (ID_EXregRd = IF_IDregRn1) or 
           (ID_EXregRd = IF_IDregRm2) ) ) then
            
            PC_EN <= '0';
            
            IF_ID_write  <= '0';
            
            ctrl_mux <= '0';
        else
            PC_EN <= '1';
            IF_ID_Write <= '1';
            ctrl_mux <= '1';
        end if;
    end process;
end behavioral;