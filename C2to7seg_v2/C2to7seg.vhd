library IEEE;
use IEEE.Std_Logic_1164.all;

entity C2to7seg is
port (C2: in std_logic_vector(3 downto 0);
      A0, A1: out std_logic_vector(6 downto 0));
end C2to7seg;

architecture circuito of C2to7seg is
 signal bi: std_logic;
 signal SC2, SMUX: std_logic_vector(3 downto 0);

 component Compl2 is
  port (X: in std_logic_vector;
        Y: out std_logic_vector);
 end component;
 
 component Mux21 is
  port (E0, E1: in std_logic_vector;
        C: in std_logic;
        S: out std_logic_vector);
 end component;
 
 component decod7 is
  port (C7: in std_logic_vector;
        F: out std_logic_vector);
 end component;

begin
 bi <= C2(3);
 A1 <= "0111111"  when bi = '1' else
       "1111111";
 
 MUX: Mux21 port map (C2, SC2, bi, SMUX);
 COMPL: Compl2 port map (C2, SC2);
 DECOD: decod7 port map (SMUX, A0);

end circuito;