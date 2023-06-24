library ieee;
use ieee.std_logic_1164.all;

entity comparador is
port (A,B: in std_logic_vector(7 downto 0);
    EQ: out std_logic);
end comparador;

architecture circuito of comparador is
begin
EQ <= '1' when (A=B) else '0';
end circuito;