library IEEE;
use IEEE.Std_Logic_1164.all;

entity somadisplay is
port (A,B: in std_logic_vector(3 downto 0);
      A1,A0,B1,B0,S1,S0: out std_logic_vector(6 downto 0));
end somadisplay;

architecture circuito of somadisplay is
 signal X0,X1,X2: std_logic_vector(6 downto 0);
 signal R: std_logic_vector(4 downto 0);

 component soma4 is
  port (A,B: in std_logic_vector;
        S: out std_logic_vector);
 end component;
 
 component bin7seg99 is
  port (binaryin: in std_logic_vector ;
        hex1, hex0: out std_logic_vector);
 end component;

begin
 X0 <= "000" & A;
 X1 <= "000" & B;
 X2 <= "00" & R;
 
 SOMADOR: soma4 port map (A, B, R);
 BINSEG0: bin7seg99 port map (X0, A1, A0);
 BINSEG1: bin7seg99 port map (X1, B1, B0);
 BINSEG2: bin7seg99 port map (X2, S1, S0);
 
end circuito;