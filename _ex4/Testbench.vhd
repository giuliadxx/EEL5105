library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end Testbench;

architecture tb of Testbench is

 signal clk, Rtest, Btest : std_logic := '0';
 signal Stest: std_logic_vector(1 downto 0);

 component FSM is port (
 clock: in std_logic;
 reset: in std_logic;
 B: in std_logic;
 S: out std_logic_vector(1 downto 0) );
 end component;

begin

 myfsm: FSM port map (clock => clk, reset => Rtest, B => Btest, S => Stest);

 clk <= not clk after 5 ns;
 Rtest <= '0', '1' after 15 ns;
 Btest <= '0', '1' after 25 ns, '0' after 100 ns, '1' after 115 ns, '0' after 126 ns, '1' after 150 ns;

end tb;