library IEEE;
use IEEE.Std_Logic_1164.all;

entity v0 is
port(A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: in std_logic;
    W: out std_logic;
    X: out std_logic;
    Y: out std_logic;
    Z: out std_logic
    );
end v0;

architecture circuito_logico of v0 is
    signal S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12: std_logic;
begin 
  S1 <= A and not B and not C;
  S2 <= A and not B and not D;
  S3 <= not A and C;
  S4 <= C and not D;
  S5 <= not A and B;
  S6 <= B and C;
  W <= S1 or S2 or S3 or S4 or S5 or S6;
  
  S7 <= A and not B;
  S8 <= A and C;
  X <= S7 or S8;
  
  S9 <= C and D;
  S10 <= B and D;
  S11 <= A and D;
  Y <= S9 or S10 or S11;
  
  S12 <= not B and not C and not D;
  Z <= S12 or S6 or not A;
  
end circuito_logico;