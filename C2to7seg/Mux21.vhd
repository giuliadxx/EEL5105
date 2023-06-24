library IEEE;
use IEEE.Std_Logic_1164.all;

entity Mux21 is
port (E0: in std_logic_vector(7 downto 0);
      E1: in std_logic_vector(7 downto 0);
      C: in std_logic;
      S: out std_logic_vector(7 downto 0));
end Mux21;

architecture MUX of Mux21 is
begin 
  S <=  E0 when C = '0' else
        E1 when C = '1' else
        "00000000";
end MUX;