library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity count21seg7 is port ( 
  CLK, E, CLR: in std_logic;
  S1, S0: out std_logic_vector(6 downto 0);
  MAX: out std_logic);
end count21seg7;

architecture behv of count21seg7 is
  signal cnt: std_logic_vector(4 downto 0) := "00000";
  signal S: std_logic_vector(6 downto 0);
  
  component bin7seg99 is port 
    (binaryin: in std_logic_vector;         
    hex1, hex0: out std_logic_vector);  
  end component; 
  
begin

  seg7: bin7seg99 port map (S, S1, S0);

    MAX <= '1' when cnt = "10101" else 
	'0';
	 
  process(CLK)
  begin
    
        if (CLK'event and CLK = '1') then 
          if (E = '1') then
              cnt <= cnt + "00001";
          end if;
          
          if (cnt = "10101") then 
            cnt <= "00000";
          end if;
          
          if (CLR = '1') then
            cnt <= "00000";
          end if;
        end if;
  end process;
  
  S <= "00" & cnt;
  
end behv;