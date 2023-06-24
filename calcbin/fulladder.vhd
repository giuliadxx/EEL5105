library IEEE;
use IEEE.Std_Logic_1164.all;

entity fulladder is
port (A: in std_logic;
      B: in std_logic;
      C: in std_logic;
      S1: out std_logic;
      S2: out std_logic
      );
end fulladder;

architecture circuito_logico of fulladder is
    signal X1,X2,X3: std_logic;
begin 
  X1 <= A xor B;
  X2 <= X1 and C;
  X3 <= B and A;
  S1 <= X1 xor C;
  S2 <= X2 or X3;
end circuito_logico;