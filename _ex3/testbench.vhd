library ieee;
use ieee.std_logic_1164.all;
entity testbench is
end testbench;

architecture tb of testbench is
    signal clear, clock, enable: std_logic;
    signal max: std_logic;
    signal count:std_logic_vector(4 downto 0);
    
    component count21 is port ( 
        CLK, E, CLR: in std_logic;
        S: out std_logic_vector;
        MAX: out std_logic);
    end component;
    
begin
    DUT : count21 port map (CLR => clear, E => enable, CLK => clock, MAX => max, S => count);
                              
                              
    clock_process: process
    begin
         clock <= '0';
         wait for 5 ns;
         clock <= '1';
         wait for 5 ns;
    end process;
    
    funcionamento: process
    begin        
        clear <= '1';
        enable <= '1';
        wait for 5 ns;    
        clear <= '0';
        
        wait for 360 ns;
        enable <= '0';
        
        wait;
    end process;

end tb;