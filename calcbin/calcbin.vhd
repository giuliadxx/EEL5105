library IEEE;
use IEEE.Std_Logic_1164.all;

entity calcbin is
port(A0: in std_logic;
    A1: in std_logic;
    B0: in std_logic;
    B1: in std_logic;
    S0: out std_logic;
    S1: out std_logic;
    S2: out std_logic
    );
end calcbin;

architecture circuito_logico of calcbin is
    signal X1,X2,X3,X4: std_logic;
begin 
  X1 <= A0 and B0;
  X2 <= A1 xor B1;
  X3 <= X2 and X1;
  X4 <= B1 and A1;
  S0 <= A0 xor B0;
  S1 <= X2 xor X1;
  S2 <= X3 or X4;
end circuito_logico;