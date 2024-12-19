library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use	IEEE.STD_LOGIC_ARITH.ALL;

entity O_CLOCK is
    Port (  day		:	out	STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    		AP		:	out STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    		hour10 	: 	out STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
            hour   	: 	out STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
            min10  	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            min    	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            sec10  	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            sec    	: 	out STD_LOGIC_VECTOR(3 DOWNTO 0);
            reset  	: 	in STD_LOGIC:='0';
            pause  	: 	in STD_LOGIC:='0';
            clk    	: 	in STD_LOGIC:='0'
        );
end O_CLOCK;

architecture Behavioral of O_CLOCK is

signal 	cos 	: STD_LOGIC:='0';
signal 	com 	: STD_LOGIC:='0';
signal	coh 	: STD_LOGIC:='0';
signal	cod		: STD_LOGIC:='0';
signal	APO 	: STD_LOGIC:='0';
signal	dayO	:STD_LOGIC_VECTOR(3 DOWNTO 0):= "0001";
signal	h10 	:STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";
signal  h   	:STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000";

component	count60	is	port(
		clk    	: 	in STD_LOGIC;
  		reset  	: 	in STD_LOGIC;
        pause  	: 	in STD_LOGIC;
        co    	: 	out STD_LOGIC;
        unit    : 	out	STD_LOGIC_VECTOR(3 DOWNTO 0);
        tens	:	out	STD_LOGIC_VECTOR(3 DOWNTO 0)
						);
end	component;

component	count12	is	port(
		clk    	: 	in STD_LOGIC;
  		reset  	: 	in STD_LOGIC;
        pause  	: 	in STD_LOGIC;
        co    	: 	out STD_LOGIC;
        unit    : 	out	STD_LOGIC_VECTOR(3 DOWNTO 0);
        tens	:	out	STD_LOGIC_VECTOR(3 DOWNTO 0)
						);
end	component;

component	count7	is	port(
		reset:in	std_logic;
  		pause:in	std_logic;
  		clk:in	std_logic;
  		day:out	STD_LOGIC_VECTOR(3	downto	0)
						);
end	component;

component	BCD_LED	is	port(
		BCDOUT : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		BCDIN: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
						);
end	component;

component	M_A	is	port(
		reset	:in	std_logic;
  		pause	:in	std_logic;
  		clk	:	in		std_logic;
  		co	:	out	std_logic;
  		AP	:	out	STD_LOGIC
						);
end	component;

component	AP_SEG	is	port(
		clk: IN	STD_LOGIC;
  		APIN: IN	STD_LOGIC;
  		APOUT:out	STD_LOGIC_VECTOR(7 DOWNTO 0)
						);
end	component;

begin 
sec_inst:	count60	port	map(
							clk=>clk,reset=>reset,pause=>pause,
							co=>cos,unit=>sec,tens=>sec10
							 );
min_inst:	count60	port	map(
							clk=>cos,reset=>reset,pause=>pause,
							co=>com,unit=>min,tens=>min10
							 );
							 
hour_inst:	count12	port	map(
							clk=>com,reset=>reset,pause=>pause,
							co=>coh,unit=>h,tens=>h10
							 );
							 
BCDH_inst:		BCD_LED	port	map(	BCDOUT=>hour,BCDIN=>h	);
BCDH10_inst:	BCD_LED	port	map(	BCDOUT=>hour10,BCDIN=>h10	);

AP_inst:	M_A	port	map(
							clk=>coh,reset=>reset,pause=>pause,
							co=>cod,AP=>APO
							 );	

segAP_inst:	AP_SEG	port	map(	APOUT=>AP,APIN=>APO,clk=>clk	);	

day_inst:	count7	port	map(
							clk=>cod,reset=>reset,pause=>pause,
							day=>dayO
							 );

BCDday_inst:	BCD_LED	port	map(	BCDOUT=>day,BCDIN=>dayO	);	
	
end Behavioral;
