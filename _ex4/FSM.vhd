library ieee;
use ieee.std_logic_1164.all;
entity FSM is port (
  clock,reset, B: in std_logic;
  S: out std_logic_vector(1 downto 0));
end FSM;

architecture ex4 of FSM is
  type STATES is (Init, On1, Off1, On2, Off2);
  signal EAtual, PEstado: STATES;
begin
  process(clock,reset)
  begin
    if (reset = '0') then
      EAtual <= Init;
    elsif (clock'event AND clock = '1') then 
        EAtual <= PEstado;
    end if;
  end process;
  
  process(EAtual,B)
  begin
    case EAtual is
      when Init =>
         S <= "11";
         if (B = '1') then
          PEstado <= On1;
         elsif (B = '0') then
          PEstado <= Init;
        end if;
        
      when On1 =>
         S <= "01";
          PEstado <= Off1;
    
      when Off1 =>
         S <= "00";
         if (B = '1') then
          PEstado <= Off1;
         elsif (B = '0') then
          PEstado <= On2;
        end if;

      when On2 =>
         S <= "10";
          PEstado <= Off2;
    
      when Off2 =>
         S <= "00";
          PEstado <= Init;
        
    end case;
  end process;
end ex4;