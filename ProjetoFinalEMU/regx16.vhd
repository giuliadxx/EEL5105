library ieee;
use ieee.std_logic_1164.all;

entity regx16 is port (
    CLK, reset, enable: in std_logic;    
    D: in std_logic_vector(15 downto 0);
    Q: out std_logic_vector(15 downto 0));
end regx16;

architecture behv of regx16 is
begin
    process(CLK, reset)
    begin
    if reset = '1' then
    Q <= "0000000000000000";
    end if;
    
    if (CLK'event and CLK = '1') then
        if (enable = '1') then
             Q <= D;
        end if;
    end if;
    end process;
end behv;
