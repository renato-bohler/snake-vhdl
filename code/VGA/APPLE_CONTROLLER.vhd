library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity APPLE_CONTROLLER IS
	port (
		clk 	  : in std_logic;
		gameTick : in std_logic;
		gameStarted : in std_logic;
		player1AteApple 	  : in std_logic;
		player2AteApple 	  : in std_logic;
		player1 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		player2 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		apple_position : out coordinate
	);
end entity;

architecture main of APPLE_CONTROLLER is
	signal random_number_x : integer := 17;
	signal random_number_y : integer := 31;
	
	signal appleExists : std_logic := '0';
	
component random_position is
  port (
    clock : IN std_logic;   
    gameTick : IN std_logic;       
    changeCoordinate : IN std_logic;
    randomCoordinate : OUT coordinate
  );
end component; 
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			random_number_x <= ((random_number_x + 17) REM (H_SIZE + 1));
			random_number_y <= ((random_number_y + 31) REM (V_SIZE + 1 ));
		end if;	
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(gameStarted = '1') then
				if((appleExists = '0') or (player1AteApple = '1' or player2AteApple = '1')) then
					apple_position(0) <= random_number_x;
					apple_position(1) <= random_number_y;
					appleExists <= '1';
				end if;
			else
				appleExists <= '0';
			end if;
		end if;
	end process;
end architecture;