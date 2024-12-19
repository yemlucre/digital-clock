library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_O_CLOCK is
--  Port ( );
end tb_O_CLOCK;

architecture Behavioral of tb_O_CLOCK is
component	O_CLOCK	is	port(
			day		:	out	STD_LOGIC_VECTOR(7 DOWNTO 0);
    		AP		:	out STD_LOGIC_VECTOR(7 DOWNTO 0);
    		hour10 	: 	out STD_LOGIC_VECTOR(7 DOWNTO 0);
            hour   	: 	out STD_LOGIC_VECTOR(7 DOWNTO 0);
            min10  	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            min    	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            sec10  	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            sec    	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            reset  	: 	in STD_LOGIC;
            pause  	: 	in STD_LOGIC;
            clk    	: 	in STD_LOGIC	
							);
end	component;

signal	tday	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
signal  tAP		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
signal	thour10	: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
signal	thour	: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
signal	tmin10	: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
signal	tmin	: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
signal	tsec10	: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
signal	tsec	: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
signal	treset	:	STD_LOGIC:='0';
signal	tpause	:	STD_LOGIC:='0';
signal	tclk	:	STD_LOGIC:='0';

begin
O_CLOCK_inst:	O_CLOCK	port	map(
		clk=>tclk,	pause=>tpause,	reset=>treset,
		sec=>tsec,	sec10=>tsec10,
		min=>tmin,	min10=>tmin10,
		hour=>thour,hour10=>thour10,
		AP=>tAP,	day=>tday
										);

	process	begin
		loop
		wait	for	1ns;
		tclk	<=	not	tclk;		
		end	loop;
	end	process;
	
--	process	begin
--		loop
--		wait	for	100ns;
--		treset	<=	not	treset;		
--		end	loop;
--	end	process;

end Behavioral;
