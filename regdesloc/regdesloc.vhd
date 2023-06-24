library IEEE;
use IEEE.Std_Logic_1164.all;

entity regdesloc is
port (D, CLK, R: in std_logic;
      Q0, Q1, Q2, Q3: out std_logic);
end regdesloc;

architecture circuito of regdesloc is
 signal S0, S1, S2: std_logic;

 component dff is
  port (CLK: in std_logic;
        D: in std_logic;
        Q: out std_logic);
 end component;

begin
 Q0 <= S0;
 Q1 <= S1;
 Q2 <= S2;
 
 FF0: dff port map (CLK, D, S0);
 FF1: dff port map (CLK, S0, S1);
 FF2: dff port map (CLK, S1, S2);
 FF3: dff port map (CLK, S2, Q3);
 
 process (R)
 begin
    if (R <= '1') then
        Q3 <= '0';
        Q2 <= '0';
        Q1 <= '0';
        Q0 <= '0';
    end if;
 end process;

end circuito;