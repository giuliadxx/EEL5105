library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_round is port ( 
  CLK, R, E: in std_logic;
  tc: out std_logic;
  X: out std_logic_vector(3 downto 0) );
end counter_round;

architecture behv of counter_round is
  signal cnt: std_logic_vector(3 downto 0) := "1111";
  signal minimo: std_logic := '0';
  
begin
  process(CLK, R, E)
  begin
    
    if (CLK'event and CLK = '1') then
      if (cnt > "00000" and E = '1') then
            cnt <= cnt - "0001";
      end if;   
    end if;
    
    
    if(R = '1') then
        cnt <= "1111";
    end if;
  end process;
  
  minimo <= '1' when cnt = "0000" else '0';
  
  tc <= minimo;
  X <= cnt;
end behv;