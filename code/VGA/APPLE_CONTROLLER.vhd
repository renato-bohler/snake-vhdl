library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity APPLE_CONTROLLER IS
	port (
		clk 	  : in std_logic;
		gameTick : in std_logic;
		gameStarted : in std_logic;
		swap			 : in std_logic;
		player1AteApple 	  : in std_logic;
		player2AteApple 	  : in std_logic;
		player1AteSpecial 	  : in std_logic;
		player2AteSpecial 	  : in std_logic;
		player1 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		player2 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		apple_position : out coordinate;
		special_position : out coordinate
	);
end entity;

architecture main of APPLE_CONTROLLER is
	signal random_number_x : integer := 17;
	signal random_number_y : integer := 31;
	
	signal appleExists : std_logic := '0';
	
	
	signal specialTimerOut : std_logic := '0';
	
begin
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			random_number_x <= ((random_number_x + 17) REM (H_SIZE + 1));
			random_number_y <= ((random_number_y + 31) REM (V_SIZE + 1 ));
		end if;	
	end process;
	
	
	process(clk)
		variable singleAct : std_logic := '0';
		variable cooldownCounter : integer := 0;
	begin
		if(rising_edge(gameTick)) then
			if(gameStarted = '1') then
				cooldownCounter := cooldownCounter + 1;
				if(swap = '1' and singleAct = '0' and (cooldownCounter > PERIODTIME*20)) then
					apple_position(0) <= random_number_x;
					apple_position(1) <= random_number_y;
					appleExists <= '1';
					singleAct := '1';
					cooldownCounter := 0;
				elsif(swap = '0' and singleAct = '1') then
					singleAct := '0';
				elsif((appleExists = '0') or (player1AteApple = '1' or player2AteApple = '1')) then
						apple_position(0) <= random_number_x;
						apple_position(1) <= random_number_y;
						appleExists <= '1';
				end if;
			else
				appleExists <= '0';
			end if;
		end if;
	end process;
	
	process(gameTick)
		variable singleAct : std_logic := '0';
		variable eaten : std_logic := '1';
		variable specialTimerCounter : integer := 0;
		variable internalSpecial : coordinate;
	begin
		if(rising_edge(gameTick)) then
			if(gameStarted = '1') then
				if(specialTimerCounter > SPECIALTIME*PERIODTIME) then
					specialTimerOut <= '1';
					specialTimerCounter := 0;
				else
					specialTimerOut <= '0';
					specialTimerCounter := specialTimerCounter + 1;
				end if;
				
				if(player1AteSpecial = '1' or player2AteSpecial = '1') then
					eaten := '1';
					specialTimerCounter := 0;
					internalSpecial := (-1, -1);
				end if;
				
				if(specialTimerOut = '1' and singleAct = '0' and eaten = '1')then
					singleAct := '1';
					internalSpecial := (random_number_x, random_number_y);
					eaten := '0';
				elsif(specialTimerOut = '0' and singleAct = '1') then
					singleAct := '0';
				end if;
			else
				eaten := '1';
			end if;
			special_position <= internalSpecial;
		end if;
	end process;

end architecture;