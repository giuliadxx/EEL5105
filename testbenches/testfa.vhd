library ieee;
use ieee.std_logic_1164.all;
entity testfa is
end testfa;
architecture tb of testfa is
    signal A, B, C, Sum, Cout : std_logic;
    component fulladder is port ( 
      A,B,C: in std_logic;
      Sum,Cout: out std_logic );
    end component;
begin
    DUT : fulladder port map (A => A, 
                              B => B,
                              C => C,
                              Sum => Sum,
                              Cout => Cout);
   process
        constant period: time := 8 ns;
        begin
            A <= '0'; B <= '0'; C <= '0'; 
            wait for period;
            A <= '0'; B <= '0'; C <= '1';
            wait for period;
            A <= '0'; B <= '1'; C <= '0';
            wait for period;
            A <= '0'; B <= '1'; C <= '1';
            wait for period;
            A <= '1'; B <= '0'; C <= '0';
            wait for period;
            A <= '1'; B <= '0'; C <= '1';
            wait for period;
            A <= '1'; B <= '1'; C <= '0';
            wait for period;
            A <= '1'; B <= '1'; C <= '1';
            wait for period;
            wait;
    end process;

end tb;