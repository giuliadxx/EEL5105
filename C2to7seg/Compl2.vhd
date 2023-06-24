library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
entity Compl2 is
port (X:  in std_logic_vector(7 downto 0);
      Y:  out std_logic_vector(7 downto 0));
end Compl2;
architecture c22 of Compl2 is
begin 
  Y <= (not X) + "00000001";
end c22;
