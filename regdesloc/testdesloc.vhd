library ieee;
use ieee.std_logic_1164.all;

entity testdesloc is
end testdesloc;

architecture tb of testdesloc is
    signal D: std_logic := '0';
    signal R: std_logic := '0';
    signal meuclock: std_logic := '0';
    signal Q3, Q2, Q1, Q0: std_logic;
    
    component regdesloc is port ( 
      D, R, CLK: in std_logic;
      Q3,Q2,Q1,Q0: out std_logic);
    end component;
    
begin
    
    DUT : regdesloc port map   (D => D, 
                                CLK => meuclock,
                                R => R,
                                Q3 => Q3,
                                Q2 => Q2,
                                Q1 => Q1,
                                Q0 => Q0);
                              
    meuclock <= not meuclock after 5 ns;
    
   process
        constant period: time := 10 ns;
        begin
            
            wait for period;
            R <= '1';
            wait for period;
            R <= '0';
            
            for k in 1 to 20 loop
                D <= '1';  
                wait for period;  
                D <= '0';
                wait for period;
            end loop;
            
            wait;
    end process;

end tb;