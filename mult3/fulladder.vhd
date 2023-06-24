library IEEE;
use IEEE.Std_Logic_1164.all;

entity fulladder is
port (A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      S: out std_logic;
      Cout: out std_logic
      );
end fulladder;

architecture circuito_logico of fulladder is
    signal X1,X2,X3: std_logic;
begin 
  X1 <= A xor B;
  X2 <= X1 and Cin;
  X3 <= B and A;
  S <= X1 xor Cin;
  Cout <= X2 or X3;
end circuito_logico;