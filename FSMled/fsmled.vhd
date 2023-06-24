library ieee;
use ieee.std_logic_1164.all;

entity FSMled is port (
   clock: in std_logic;
   reset: in std_logic;
   x,y,z: out std_logic );
end FSMled;

architecture fsm1arq of FSMled is
   type STATES is (ON1, L1, L2, OFF);
   signal atual, proximo: STATES;
   
begin

    process(clock,reset)
    begin
        if (reset = '1') then
            atual <= ON1;
        elsif (clock'event AND clock = '1') then 
             atual <= proximo;
        end if;
    end process;
    
    process(atual)
    begin
        case atual is
            when ON1 =>     proximo <= L1;
                             x <= '1';
                             y <= '1'; 
                             z <= '1';
            when L1 =>     proximo <= L2;
                             x <= '0';
                             y <= '1'; 
                             z <= '1';
            when L2 =>     proximo <= OFF;
                             x <= '0';
                             y <= '0'; 
                             z <= '1';
            when OFF =>     proximo <= ON1;
                             x <= '0';
                             y <= '0'; 
                             z <= '0';
        end case;
    end process;
end fsm1arq;