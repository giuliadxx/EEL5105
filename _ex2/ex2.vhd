library IEEE;
use IEEE.Std_Logic_1164.all;

entity ex2 is
port (X: in std_logic_vector(7 downto 0);
      A0, A1, A2: out std_logic_vector(6 downto 0));
end ex2;

architecture circuito of ex2 is
 signal S0, S1, D0: std_logic_vector(7 downto 0);
 signal B0, B1, B2: std_logic_vector(3 downto 0);
 signal BX: std_logic_vector(11 downto 0);

 component soma8 is
  port (A:  in std_logic_vector;
        B:  in std_logic_vector;
        S:  out std_logic_vector);
 end component;
 
 component div4 is
  port (A:  in std_logic_vector;
        S:  out std_logic_vector);
 end component;
 
 component bcd7seg is
  port (bcd_in:  in std_logic_vector;
        out_7seg:  out std_logic_vector);
 end component;
 
 component binbcd is
  port (bin_in: in std_logic_vector;
        bcd_out: out std_logic_vector);
 end component;

begin
 B0 <= BX (3 downto 0);
 B1 <= BX (7 downto 4);
 B2 <= BX (11 downto 8);
 
 SOMA0: soma8 port map (X, X, S0);
 DIV0: div4 port map (X, D0);
 SOMA1: soma8 port map (S0, D0, S1);
 BINCD: binbcd port map (S1, BX);
 BCD0: bcd7seg port map (B0, A0);
 BCD1: bcd7seg port map (B1, A1);
 BCD2: bcd7seg port map (B2, A2);

end circuito;