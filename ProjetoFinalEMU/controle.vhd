library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity controle is port (
enter,reset,clock, end_game, end_sequence, end_round, enter_left, enter_right: in std_logic;
R1, E1, E2, E3, E4, E5, E6: out std_logic );
end controle;

architecture fsmcontrole of controle is
	 type STATES is (init, setup, sequence, play_game, check, Wait1 , result);
    signal EAtual, PEstado: STATES;
	 
begin

process(clock, reset)
begin
if (reset = '1') then
    EATual <= init;
elsif (clock'event AND clock = '1') then
    EAtual <= PEstado;
end if;

end process;

---- fazer parte dos estados

process(EAtual, enter, reset, clock, end_game, end_sequence, end_round, enter_left, enter_right)
  begin
    case EAtual is
    
      when Init =>
        R1 <= '1';
		E1 <= '0';
		E2 <= '0';
		E3 <= '0';
		E4 <= '0';
		E5 <= '0';
		E6 <= '0';	
		PEstado <= Setup;

      when Setup =>
        R1 <= '0';
		E1 <= '1';
		E2 <= '0';
		E3 <= '0';
		E4 <= '0';
		E5 <= '0';
		E6 <= '0';	

        if (enter = '1') then
		    PEstado <= Sequence;
		else
		    PEstado <= Setup;
		end if;
    
      when Sequence =>
        R1 <= '0';
		E1 <= '0';
		E2 <= '1';
		E3 <= '0';
		E4 <= '0';
		E5 <= '0';
		E6 <= '0';
		
		if (end_sequence = '1') then
		    PEstado <= Play_game;
		else
		    PEstado <= Sequence;
		end if;
		
	  when Play_game =>
        R1 <= '0';
		E1 <= '0';
		E2 <= '0';
		E3 <= '1';
		E4 <= '0';
		E5 <= '0';
		E6 <= '0';
		
		if (enter_right = '1' and enter_left = '1') then
		    PEstado <= Check;
		else
		    PEstado <= Play_game;
		end if;
		
	  when Check =>
        R1 <= '0';
		E1 <= '0';
		E2 <= '0';
		E3 <= '0';
		E4 <= '1';
		E5 <= '0';
		E6 <= '0';
		
		PEstado <= Wait1;
		
	  when Wait1 =>
        R1 <= '0';
		E1 <= '0';
		E2 <= '0';
		E3 <= '0';
		E4 <= '0';
		E5 <= '1';
		E6 <= '0';	
	 
		if ((not enter) and (not end_game) and (not end_round)) = '1' then
        	PEstado <= wait1;
        elsif (enter and (not end_game) and (not end_round)) = '1' then
	        PEstado <= sequence;
        else
	        PEstado <= result;
        end if;


	  when Result =>
        R1 <= '0';
		E1 <= '0';
		E2 <= '0';
		E3 <= '0';
		E4 <= '0';
		E5 <= '0';
		E6 <= '1';
		
	  if enter = '1' then
		PEstado <= init;
	  else
		PEstado <= result;
	  end if;


    end case;
  end process;

end fsmcontrole;