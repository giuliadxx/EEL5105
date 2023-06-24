library ieee;
use ieee.std_logic_1164.all;

entity testfsmled is
end testfsmled;

architecture tb of testfsmled is
    signal reset: std_logic := '0';
    signal meuclock: std_logic := '0';
    signal x, y, z: std_logic;
    
    component FSMled is port ( 
         clock: in std_logic;
         reset: in std_logic;
         x,y,z: out std_logic );
    end component;
    
begin
    
    DUT : FSMled port map   (clock => meuclock,
                                reset => reset,
                                x => x,
                                y => y,
                                z => z);
                              
    meuclock <= not meuclock after 5 ns;
    
   process
        constant period: time := 10 ns;
        begin
            
            reset <= '1';
            wait for period;
            reset <= '0';

            wait;
    end process;

end tb;