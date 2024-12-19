library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use	IEEE.STD_LOGIC_ARITH.ALL;
entity count12 is
  Port (
  		clk    	: 	in STD_LOGIC;
  		reset  	: 	in STD_LOGIC;
        pause  	: 	in STD_LOGIC;
        co    	: 	out STD_LOGIC:='0';
        unit    : 	out	STD_LOGIC_VECTOR(3 DOWNTO 0);
        tens	:	out	STD_LOGIC_VECTOR(3 DOWNTO 0)
  		);
end count12;

architecture Behavioral of count12 is
signal	u:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
signal	t:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";

begin
	process(clk, reset,pause)
		begin
			if reset = '1' then
				u <= "0000"; t <= "0000";
			elsif rising_edge(clk) and pause = '0' then
				if t = "0001" and u = "0001" then
					u <= "0000"; t <= "0000"; co <= '1';
				elsif  u = "1001" then
					u <= "0000";
					t <= t + 1;
				else
					u <= u + 1;   co <= '0'; 
				end if;
			end if; 
			unit<=u;	tens<=t; 
			 
    end process;

end Behavioral;
