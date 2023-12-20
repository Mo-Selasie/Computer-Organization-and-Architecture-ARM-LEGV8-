library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ForwardingUnit is --Unit determines alu operands sources
    port(
        EX_MEM_regwrite : in std_logic;
        MEM_WB_regwrite : in std_logic;
        EX_MEM_RegRd    : in STD_LOGIC_VECTOR(4 downto 0);
        MEM_WB_RegRd    : in STD_LOGIC_VECTOR(4 downto 0);
        ID_EX_RegRn1    : in STD_LOGIC_VECTOR(4 downto 0);
        ID_EX_RegRm2    : in STD_LOGIC_VECTOR(4 downto 0);

        forwardA        : out STD_LOGIC_VECTOR(1 downto 0);
        forwardB        : out STD_LOGIC_VECTOR(1 downto 0)
    );
end ForwardingUnit;


architecture behavioral of ForwardingUnit is
begin
    process(all)
    begin
        -- EX hazard 
        if ( EX_MEM_regWrite = '1' 
            and (EX_MEM_RegRd /= "11111") 
            and (EX_MEM_RegRd = ID_EX_RegRn1) ) then
            forwardA <= "10";
        -- MEM hazard
        elsif (MEM_WB_regWrite = '1' 
            and (MEM_WB_RegRd /= "11111") 
            and not (EX_MEM_regWrite = '1' and (EX_MEM_RegRd /= "1111") 
            and (EX_MEM_RegRd = ID_EX_RegRn1)) 
            and (MEM_WB_RegRd = ID_EX_RegRn1) ) then 
            forwardA <= "01";
        else
            forwardA <= "00";
        end if;

        if ( EX_MEM_regWrite = '1' 
            and (EX_MEM_RegRd /= "11111") 
            and (EX_MEM_RegRd = ID_EX_RegRm2) ) then
            forwardB <= "10";
        -- MEM hazard
        elsif (MEM_WB_regWrite = '1' 
                and (MEM_WB_RegRd /= "11111") 
                and not (EX_MEM_regWrite = '1' and (EX_MEM_RegRd /= "1111") 
                and (EX_MEM_RegRd = ID_EX_RegRm2)) 
                and (MEM_WB_RegRd = ID_EX_RegRm2) ) then 
                forwardB <= "01";
        else
            forwardB <= "00";
        end if;
    end process;
end behavioral;
