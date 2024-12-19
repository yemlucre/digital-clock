library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity M_A is
  Port (
  		reset:in	std_logic;
  		pause:in	std_logic;
  		clk:in	std_logic;
  		co:out	std_logic:='0';
  		AP:out	STD_LOGIC
  		);
end M_A;

architecture Behavioral of M_A is
signal	APS:STD_LOGIC:='0';

begin
	process(clk,reset,pause)	begin
		if reset = '1' then
				APS <= '0'; 
		elsif rising_edge(clk) and pause = '0' then	
			if	APS='1'	then
				APS<='0';	co<='0';
			else	APS<='1';	co<='1';
			end	if;	
		end	if;
		AP<=APS;
		
		end	process;
end Behavioral;
