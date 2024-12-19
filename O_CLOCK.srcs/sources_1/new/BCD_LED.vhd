library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_LED is
	Port (
		BCDOUT : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		BCDIN: IN STD_LOGIC_VECTOR(3 DOWNTO 0)	
			);
end BCD_LED;

architecture Behavioral of BCD_LED is

begin
process(BCDIN)	begin
	CASE BCDIN IS
				WHEN "0000" => BCDOUT <= "00000011"; 
				WHEN "0001" => BCDOUT <= "10011111";
				WHEN "0010" => BCDOUT <= "00100101";
				WHEN "0011" => BCDOUT <= "00001101";
				WHEN "0100" => BCDOUT <= "10011001";
				WHEN "0101" => BCDOUT <= "01001001";
				WHEN "0110" => BCDOUT <= "01000001";
				WHEN "0111" => BCDOUT <= "00011111";
				WHEN "1000" => BCDOUT <= "00000001";
				WHEN "1001" => BCDOUT <= "00011001";
				WHEN others => BCDOUT <= "00000000";
			END CASE;

	
end	process;
end Behavioral;
