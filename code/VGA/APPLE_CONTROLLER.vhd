library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity APPLE_CONTROLLER IS
	port (
		clk 	  : in std_logic;
		player1AteApple 	  : in std_logic;
		player2AteApple 	  : in std_logic;
		player1 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		player2 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		apple_position : out coordinate
	);
end entity;

architecture main of APPLE_CONTROLLER is
	signal random_number_x : integer := 0;
	signal random_number_y : integer := 0;
	
	signal appleExists : std_logic := '0';
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			random_number_x <= random_number_x + 11;
			random_number_y <= random_number_y + 17;
		end if;	
	end process;
	
	process(clk)
		variable singleAct : std_logic := '0';
	begin
		if(singleAct = '0' and (player1AteApple = '1' or player2AteApple = '1' or appleExists = '0')) then
			apple_position(0) <= 10;
			apple_position(1) <= 12;
			appleExists <= '1';
			singleAct := '1';
		elsif(singleAct = '1' and not(player1AteApple = '1' or player2AteApple = '1' or appleExists = '0')) then
			singleAct := '0';
		end if;
	end process;
end architecture;