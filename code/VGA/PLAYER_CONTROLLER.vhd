library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity PLAYER_CONTROLLER IS
	port (
		timer : in std_logic;
		up, down, left, right : in std_logic;
		player : out coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1)
	);
end entity;

architecture main of PLAYER_CONTROLLER is


signal player_position : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1) := (0 => (3,1), 1 => (2,1), 2 => (1,1), others => (1,1));
signal player_direction : integer;

constant right_d : integer := 1;
constant up_d : integer := 2;
constant down_d : integer := 3;
constant left_d : integer := 4;
constant default_d : integer := 5;

begin
	
	process (timer)
	
	begin
		if(rising_edge(timer)) then
			if(right = '1' and player_direction /= left_d) then
				player_direction <= right_d;
			elsif (left = '1' and player_direction /= right_d) then
				player_direction <= left_d;
			elsif (down = '1' and player_direction /= up_d) then
				player_direction <= down_d;
			elsif (up = '1' and player_direction /= down_d) then
				player_direction <= up_d;
			end if;
		end if;
	end process;
	
	process (timer)
	begin
		if(rising_edge(timer)) then
			if(player_direction = right_d) then
				for i in 1 to MAX_ELEMENTS - 1 loop
					player_position(i,0) <= player_position(i - 1,0);
					player_position(i,1) <= player_position(i - 1,1);
				end loop;
				player_position(0,0) <= player_position(0,0) + 1;
			elsif(player_direction = left_d) then
				for i in 1 to MAX_ELEMENTS - 1 loop
					player_position(i,0) <= player_position(i - 1,0);
					player_position(i,1) <= player_position(i - 1,1);
				end loop;
				player_position(0,0) <= player_position(0,0) - 1;
			elsif (player_direction = down_d) then
				for i in 1 to MAX_ELEMENTS - 1 loop
					player_position(i,0) <= player_position(i - 1,0);
					player_position(i,1) <= player_position(i - 1,1);
				end loop;
				player_position(0,1) <= player_position(0,1) + 1;
			elsif (player_direction = up_d) then
				for i in 1 to MAX_ELEMENTS - 1 loop
					player_position(i,0) <= player_position(i - 1,0);
					player_position(i,1) <= player_position(i - 1,1);
				end loop;
				player_position(0,1) <= player_position(0,1) - 1;
			end if;
			player <= player_position;
		end if;
	end process;
end architecture;