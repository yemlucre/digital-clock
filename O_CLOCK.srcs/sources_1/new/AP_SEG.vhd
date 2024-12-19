----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/12/08 13:01:53
-- Design Name: 
-- Module Name: AP_SEG - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AP_SEG is
  Port (	
  		clk: IN	STD_LOGIC;
  		APIN: IN	STD_LOGIC;
  		APOUT:out	STD_LOGIC_VECTOR(7 DOWNTO 0)
  		);
end AP_SEG;

architecture Behavioral of AP_SEG is

begin
	process(APIN,clk)	begin
		case	APIN	is
			when	'0'=>APOUT<="00010001";
			when	'1'=>APOUT<="00110001";
			when	others=>APOUT<="00000000";
		end	case;
	end	process;
end Behavioral;
