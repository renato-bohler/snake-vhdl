library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity TOP_LEVEL IS
	port (
		clk : in std_logic;
		up1, down1, left1, right1 : in std_logic;
		up2, down2, left2, right2 : in std_logic;
		VGA_HS, VGA_VS : out std_logic;
		VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
		led_out : out std_logic
	);
end entity;

architecture main of TOP_LEVEL is

component GAME_TIMER is
	port (
		clk : in std_logic;
		timerOut : out std_logic
	);
end component;

component VGA is
port (
	clk : in std_logic;
	VGA_HS, VGA_VS : out std_logic;
	VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
	player1 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	player2 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1)
);
end component;

component PLAYER_CONTROLLER IS
	port (
		timer : in std_logic;
		up, down, left, right : in std_logic;
		player : out coordinate_array(MAX_ELEMENTS - 1 downto 0, 0 to 1)
	);
end component;

component GAME_CONTROLLER IS
	port (
		gameTick 			: in std_logic;
		gameStart			: in std_logic;
		snake1Matrix		: in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
		snake2Matrix		: in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
		appleMatrix			: in coordinate;
		specialMatrix		: in coordinate;
		
		score1				: out integer;
		score2				: out integer;
		snake1AteApple		: out std_logic;
		snake2AteApple		: out std_logic;
		snake1AteSpecial	: out std_logic;
		snake2AteSpecial	: out std_logic;
		gameOver				: out std_logic
		
	);
end component;

signal player1 : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
signal player2 : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);

signal score1, score2 : integer;
signal snake1AteApple, snake2AteApple, snake1AteSpecial, snake2AteSpecial, gameOver, timer : std_logic;

begin

	C3 : GAME_TIMER PORT MAP (clk, timer);
	p1 : PLAYER_CONTROLLER PORT MAP (timer, up1, down1, left1, right1, player1);
	p2 : PLAYER_CONTROLLER PORT MAP (timer, up2, down2, left2, right2, player2);
	vga1 : VGA PORT MAP (clk, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, player1, player2);
	gameController	: GAME_CONTROLLER PORT MAP (timer, '0', player1, player2, (1, 1), (2, 2), score1, score2, snake1AteApple, snake2AteApple, snake1AteSpecial, snake2AteSpecial, gameOver);

	-- Debug
	led_out <= gameOver;

end architecture;