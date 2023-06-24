library IEEE;
use IEEE.Std_Logic_1164.all;

entity halfadder is
port (A: in std_logic;
      B: in std_logic;
      C: out std_logic;
      S: out std_logic
      );
end halfadder;

architecture circuito_logico of halfadder is
begin 
  S <= A xor B;
  C <= A and B;
end circuito_logico;