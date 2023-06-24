library ieee;
use ieee.std_logic_1164.all;

entity regx4 is port (
    CLK, reset, enable: in std_logic;    
    D: in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0));
end regx4;

architecture behv of regx4 is
begin
    process(CLK, reset)
    begin
    if reset = '1' then
    Q <= "0000";
    end if;
    
    if (CLK'event and CLK = '1') then
        if (enable = '1') then
             Q <= D;
        end if;
    end if;
    end process;
end behv;
