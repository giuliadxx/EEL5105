library ieee;
use ieee.std_logic_1164.all;
entity FSMcofre is port (
  clock,reset: in std_logic;
  botoes: in std_logic_vector(2 downto 0);
  led: out std_logic );
end FSMcofre;

architecture FSMcofrearq of FSMcofre is
  type STATES is (Inicio, EsperaSoltar1, Correto1, FimFechado, FimAberto, Correto2, EsperaSoltar2, EsperaSoltar0, Correto0);
  signal EAtual, PEstado: STATES;
begin
  process(clock,reset)
  begin
    if (reset = '0') then
      EAtual <= Inicio;
    elsif (clock'event AND clock = '1') then 
        EAtual <= PEstado;
    end if;
  end process;
  
  process(EAtual,botoes)
  begin
    case EAtual is
      when Inicio =>
         led <= '0';
         if (botoes="011") then
          PEstado <= EsperaSoltar0;
         elsif (botoes /= "111" AND botoes/= "011") then
          PEstado <= FimFechado;
         else
          PEstado <= Inicio;
        end if;
        
      when EsperaSoltar0 => 
          led <= '0';
          if (botoes(2) = '1') then
            PEstado <= Correto0;
          else
            PEstado <= EsperaSoltar0;
        end if;
    
      when Correto0 =>
         led <= '0';
         if (botoes="011") then
          PEstado <= EsperaSoltar1;
         elsif (botoes /= "111" AND botoes /= "011") then
          PEstado <= FimFechado;
         else
          PEstado <= Correto0;
        end if;        

      when EsperaSoltar1 => 
          led <= '0';
          if (botoes(2) = '1') then
            PEstado <= Correto1;
          else
            PEstado <= EsperaSoltar1;
        end if;
    
      when Correto1 =>
         led <= '0';
         if (botoes="110") then
          PEstado <= EsperaSoltar2;
         elsif (botoes /= "111" AND botoes /= "110") then
          PEstado <= FimFechado;
         else
          PEstado <= Correto1;
        end if;        
        
      when EsperaSoltar2 => 
          led <= '0';
          if (botoes(0) = '1') then
            PEstado <= Correto2;
          else
            PEstado <= EsperaSoltar2;
        end if;
        
      when Correto2 =>
         led <= '0';
         if (botoes="101") then
          PEstado <= FimAberto;
         elsif (botoes /= "111" AND botoes /= "101") then
          PEstado <= FimFechado;
         else
          PEstado <= Correto2;
        end if;        

      when FimFechado => 
          led <= '0';
          
      when FimAberto => 
          led <= '1';
        
    end case;
  end process;
end FSMcofrearq;
