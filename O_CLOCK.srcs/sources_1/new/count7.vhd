library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use	IEEE.STD_LOGIC_ARITH.ALL;
entity count7 is
  Port (
  		reset:in	std_logic;
  		pause:in	std_logic;
  		clk:in	std_logic;
  		day:out	STD_LOGIC_VECTOR(3	downto	0)
  		);
end count7;

architecture Behavioral of count7 is

signal	days:STD_LOGIC_VECTOR(3 DOWNTO 0):= "0001";

begin
	process(clk,reset,pause)	begin
		if reset = '1' then
			days<= "0001"; 
		elsif rising_edge(clk) and pause = '0' then	
			if	days="0111"	then
				days<="0001";
			else	days	<=	days+1;
			end	if;
		end	if;
		day<=days;
		end	process;
end Behavioral;
