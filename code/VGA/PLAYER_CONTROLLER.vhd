library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity PLAYER_CONTROLLER IS
	port (
		timer : in std_logic;
		playerScore : in integer;
		playerNumber : in std_logic;
		up, down, left, right : in std_logic;
		special : in std_logic;
		game_start : in std_logic;
		player : out coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1)
	);
end entity;

architecture main of PLAYER_CONTROLLER is
constant starting_player_position1 : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1) := (0 => (3,1), 1 => (2,1), 2 => (1,1), others => (-1,-1));
constant starting_player_position2 : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1) := (0 => (3,2), 1 => (2,2), 2 => (1,2), others => (-1,-1));
signal player_position : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
signal player_direction : integer range 0 to 6;
signal snake_direction : integer range 0 to 6;

signal playerSize : integer := 3;

constant right_d : integer := 1;
constant up_d : integer := 2;
constant down_d : integer := 3;
constant left_d : integer := 4;
constant default_d : integer := 5;

signal accel_counter : integer range 0 to 100 := 80;

signal oneSecondTimer : std_logic;
signal timerReset : std_logic;

component SECOND_TIMER IS
	port (
		clk : in std_logic;
		rst : in std_logic;
		timerOut : out std_logic
	);
end component;

begin
	ONESECOND : SECOND_TIMER PORT MAP(timer, timerReset, oneSecondTimer);
	process (timer)
	begin
		playerSize <= 3 + playerScore;
		if(rising_edge(timer)) then
			if(game_start = '1') then
				if(right = '1' and snake_direction /= left_d) then
					player_direction <= right_d;
				elsif (left = '1' and snake_direction /= right_d) then
					player_direction <= left_d;
				elsif (down = '1' and snake_direction /= up_d) then
					player_direction <= down_d;
				elsif (up = '1' and snake_direction /= down_d) then
					player_direction <= up_d;
				end if;
			else
				player_direction <= right_d;
			end if;
		end if;
	end process;
	
	process(timer)
		variable specialActive 	 : std_logic := '0';
		variable allowSpecial 	 : std_logic := '1';
		variable timerCounter 	 : integer range 0 to 10000 := 0;
		variable activeCounter   : integer range 0 to 10 := 0;
		variable cooldownCounter : integer range 0 to 10 := 0;
	begin
		if(rising_edge(timer)) then
			if(special = '1') then
				if(allowSpecial = '1') then
					specialActive := '1';
					timerCounter := 0;
					allowSpecial := '0';
				end if;
			end if;
			timerCounter := (timerCounter + 1) MOD (10000);
			if(timerCounter >= 2000) then
				specialActive := '0';
			end if;
			if(timerCounter >= 10000-1) then
				allowSpecial := '1';
			end if;
			if(specialActive = '1') then
				accel_counter <= 50;
			else
				accel_counter <= 80;
			end if;
			
		end if;
	end process;
	
	process (timer)
		variable timerCounter : integer range 0 to 120:= 0;
	begin
		if(rising_edge(timer)) then
			if(game_start = '1') then
				timerCounter := timerCounter +1;
				if(timerCounter > accel_counter) then
					timerCounter := 0;
					if(player_direction = right_d) then
						snake_direction <= right_d;
						for i in 1 to MAX_ELEMENTS - 1 loop
							if(i < playerSize) then
								player_position(i,0) <= player_position(i - 1,0);
								player_position(i,1) <= player_position(i - 1,1);
							else
								player_position(i,0) <= -1;
								player_position(i,1) <= -1;
							end if;
						end loop;
						player_position(0,0) <= (player_position(0,0) + 1) REM (H_SIZE + 1);
					elsif(player_direction = left_d) then
						snake_direction <= left_d;
						for i in 1 to MAX_ELEMENTS - 1 loop
							if(i < playerSize) then
								player_position(i,0) <= player_position(i - 1,0);
								player_position(i,1) <= player_position(i - 1,1);
							else
								player_position(i,0) <= -1;
								player_position(i,1) <= -1;
							end if;						
						end loop;
						if(player_position(0,0) <= 0) then
							player_position(0,0) <= H_SIZE;
						else	
							player_position(0,0) <= player_position(0,0) - 1;
						end if;
					elsif (player_direction = down_d) then
						snake_direction <= down_d;
						for i in 1 to MAX_ELEMENTS - 1 loop
							if(i < playerSize) then
								player_position(i,0) <= player_position(i - 1,0);
								player_position(i,1) <= player_position(i - 1,1);
							else
								player_position(i,0) <= -1;
								player_position(i,1) <= -1;
							end if;
						end loop;
						player_position(0,1) <= (player_position(0,1) + 1) REM (V_SIZE + 1);
					elsif (player_direction = up_d) then
						snake_direction <= up_d;
						for i in 1 to MAX_ELEMENTS - 1 loop
							if(i < playerSize) then
								player_position(i,0) <= player_position(i - 1,0);
								player_position(i,1) <= player_position(i - 1,1);
							else
								player_position(i,0) <= -1;
								player_position(i,1) <= -1;
							end if;
						end loop;
						if(player_position(0,1) <= 0) then
							player_position(0,1) <= V_SIZE;
						else
							player_position(0,1) <= player_position(0,1) - 1;
						end if;
					end if;
				end if;
			else
				if(playerNumber = '1') then
					player_position <= starting_player_position1;
				else
					player_position <= starting_player_position2;
				end if;
			end if;
			player <= player_position;
		end if;
	end process;
end architecture;