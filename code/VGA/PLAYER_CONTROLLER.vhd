library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity PLAYER_CONTROLLER IS
	port (
		clk : in std_logic;
		up, down, left, right : in std_logic;
		player : out coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1)
	);
end entity;

architecture main of PLAYER_CONTROLLER is

component GAME_TIMER is
	port (
		clk : in std_logic;
		timerOut : out std_logic
	);
end component;

signal timer : std_logic;

signal player_position : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1) := (0 => (others => 1), 1 => (2,1), 2 => (3,1), others => (1,1));

begin

	C3 : GAME_TIMER PORT MAP (clk, timer);
	process (clk)
	begin
		if(rising_edge(timer)) then
			if(right = '1') then
				for i in 0 to MAX_ELEMENTS - 1 loop
					player_position(i,0) <= player_position(i,0) + 1;
				end loop;
			elsif(left = '1') then
				for i in 0 to MAX_ELEMENTS - 1 loop
					player_position(i,0) <= player_position(i,0) - 1;
				end loop;
			elsif (down = '1') then
				for i in 0 to MAX_ELEMENTS - 1 loop
					player_position(i,1) <= player_position(i,1) + 1;
				end loop;
			elsif (up = '1') then
				for i in 0 to MAX_ELEMENTS - 1 loop
					player_position(i,1) <= player_position(i,1) - 1;
				end loop;
			end if;
			player <= player_position;
		end if;
	end process;
end architecture;