library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_signed.all;

entity counter_time is port ( 
  CLK, R, E: in std_logic;
  L: in std_logic_vector(7 downto 0);
  tc: out std_logic;
  X: out std_logic_vector(7 downto 0) );
end counter_time;

architecture behv of counter_time is
  signal cnt: std_logic_vector(7 downto 0) := "01100110";
begin

  process(CLK)
  begin
    
    if (CLK'event and CLK = '1') then
      if (cnt > "00000000" and E = '1') then
            cnt <= cnt + L;
      end if;
    end if;
    
    if(R = '1') then
        cnt <= "01100110";
    end if;
  end process;
  
  tc <= '1' when cnt < "00000001" else '0';
  X <= cnt;
end behv;