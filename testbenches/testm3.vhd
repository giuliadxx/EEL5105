library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testm3 is
end testm3;

architecture tb of testm3 is
    signal SX: std_logic_vector (3 downto 0);
    signal SY: std_logic_vector(4 downto 0);
    signal cnt : std_logic_vector(3 downto 0) := "0000";
    component mult3 is port ( 
      X: in std_logic_vector;
      Y: out std_logic_vector);
    end component;
    
begin
    DUT : mult3 port map (X => SX, Y => SY);
    SX <= cnt(3 downto 0);
    process
     constant period: time := 10 ns;
     begin
         for k in 1 to 16 loop
            wait for period;
            cnt <= cnt + '1';
         end loop;
         wait;
    end process;    
end tb;