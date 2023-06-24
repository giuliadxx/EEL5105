library IEEE;
use IEEE.Std_Logic_1164.all;

entity V8bit is
port (C2: in std_logic_vector(7 downto 0);
      A0, A1, A2: out std_logic_vector(6 downto 0));
end V8bit;

architecture circuito of V8bit is
 signal bi: std_logic;
 signal SC2, SMUX: std_logic_vector(7 downto 0);
 signal MB7: std_logic_vector(6 downto 0);

 component Compl2 is
  port (X: in std_logic_vector;
        Y: out std_logic_vector);
 end component;
 
 component Mux21 is
  port (E0, E1: in std_logic_vector;
        C: in std_logic;
        S: out std_logic_vector);
 end component;
 
 component bin7seg99 is
  port (binaryin: in std_logic_vector;
        hex1, hex0: out std_logic_vector);
 end component;

begin
 bi <= C2(7);
 MB7 <= SMUX (6 downto 0);
 A2 <= "0111111"  when bi = '1' else
       "1111111";
 
 MUX: Mux21 port map (C2, SC2, bi, SMUX);
 COMPL: Compl2 port map (C2, SC2);
 DECOD: bin7seg99 port map (MB7, A0, A1);

end circuito;