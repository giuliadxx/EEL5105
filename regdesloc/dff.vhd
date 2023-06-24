library ieee;
use ieee.std_logic_1164.all;

entity dff is port (
    CLK: in std_logic;
    D: in std_logic;
    Q: out std_logic );
end dff;

architecture behv of dff is
begin
    process(CLK)
    begin
        if (CLK'event and CLK = '1') then
            Q <= D;
        end if;
    end process;
end behv;
