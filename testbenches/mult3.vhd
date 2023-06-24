library IEEE;
use IEEE.Std_Logic_1164.all;

entity mult3 is
port (X: in std_logic_vector(3 downto 0);
     Y: out std_logic_vector(4 downto 0));
end mult3;

architecture circuito of mult3 is
 signal S: std_logic_vector(4 downto 0);

 component soma4 is
  port (A,B: in std_logic_vector;
        S: out std_logic_vector);
 end component;

begin
 SOMADOR0: soma4 port map (X,X,S);
 SOMADOR1: soma4 port map (X,S(3 downto 0),Y);
end circuito;