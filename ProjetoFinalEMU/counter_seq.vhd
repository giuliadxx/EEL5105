library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Counter_seq is port (
clk, R, E: in std_logic;
tc: out std_logic;
X: out std_logic_vector(2 downto 0));
end Counter_seq;

architecture behv of Counter_seq is
signal total: std_logic_vector(2 downto 0);

begin
process(clk,R,E)
begin
if (R = '1') then
total <= "000";
  tc <= '0';
elsif (clk'event AND clk = '1') then
 if (E = '1') then
 total <= total + 1;
  if total = "011" then
  tc <= '1';
  else
  tc <= '0';
  end if;
 end if;
end if;
end process;
X <= total;
end behv;