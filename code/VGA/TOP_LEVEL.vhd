library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity TOP_LEVEL IS
	port (
		clk : in std_logic;
		gameStartButton: in std_logic;
		ps2_clk, ps2_data : in std_logic;
		VGA_HS, VGA_VS : out std_logic;
		VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
		led_out_collision : out std_logic;
		led_out_gameStart : out std_logic;
		score_ssds : out ssd_array(3 downto 0)
	);
end entity;

architecture main of TOP_LEVEL is

component GAME_TIMER is
	port (
		clk : in std_logic;
		timerOut : out std_logic
	);
end component;

component ps2_keyboard IS
  PORT(
    clk          : IN  STD_LOGIC;                     --system clock
    ps2_clk      : IN  STD_LOGIC;                     --clock signal from PS/2 keyboard
    ps2_data     : IN  STD_LOGIC;                     --data signal from PS/2 keyboard
    --ps2_code_new : OUT STD_LOGIC;                     --flag that new PS/2 code is available on ps2_code bus
    --ps2_code     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --code received from PS/2
	 snake1Up	  : OUT STD_LOGIC;
	 snake1Down	  : OUT STD_LOGIC;
	 snake1Left	  : OUT STD_LOGIC;
	 snake1Right  : OUT STD_LOGIC;
	 snake1Special: OUT STD_LOGIC;
	 snake2Up	  : OUT STD_LOGIC;
	 snake2Down   : OUT STD_LOGIC;
	 snake2Left	  : OUT STD_LOGIC;
	 snake2Right  : OUT STD_LOGIC;
	 snake2Special: OUT STD_LOGIC);
	 --test			  : OUT STD_LOGIC);
END component;

component VGA is
port (
	clk : in std_logic;
	gameStarted : in std_logic;
	player1won			: in std_logic;
	player2won			: in std_logic;
	VGA_HS, VGA_VS : out std_logic;
	VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
	player1 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	player2 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	apple_position : in coordinate
);
end component;

component PLAYER_CONTROLLER IS
	port (
		timer : in std_logic;
		playerScore : in integer;
		up, down, left, right : in std_logic;
		game_start : std_logic;
		player : out coordinate_array(MAX_ELEMENTS - 1 downto 0, 0 to 1)
	);
end component;
component PLAYER2_CONTROLLER IS
	port (
		timer : in std_logic;
		playerScore : in integer;
		up, down, left, right : in std_logic;
		game_start : std_logic;
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
		gameStarted			: out std_logic;
		player1won			: out std_logic;
		player2won			: out std_logic
		
	);
end component;

component APPLE_CONTROLLER IS
	port (
		clk 	  : in std_logic;
		player1AteApple 	  : in std_logic;
		player2AteApple 	  : in std_logic;
		player1 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		player2 : in coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
		apple_position : out coordinate
	);
end component;

component ScoreController is
	port(
		scorePlayer1 : in integer;
		scorePlayer2 : in integer;
		gameTick : in std_logic;
		ssds : out ssd_array(3 downto 0)
	);
end component;

signal player1 : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
signal player2 : coordinate_array(0 to MAX_ELEMENTS - 1, 0 to 1);
signal up1, down1, left1, right1 , special1: std_logic;
signal up2, down2, left2, right2 , special2: std_logic;

signal score1, score2 : integer;
signal snake1AteApple, snake2AteApple, snake1AteSpecial, snake2AteSpecial, gameOver, timer , gameStarted: std_logic;
signal apple_position : coordinate;
signal player1won, player2won : std_logic;
begin

	C3 : GAME_TIMER PORT MAP (clk, timer);
	gameController	: GAME_CONTROLLER PORT MAP (timer, gameStartButton, player1, player2, apple_position, (2, 2), score1, score2, snake1AteApple, snake2AteApple, snake1AteSpecial, snake2AteSpecial,gameStarted,player1won, player2won);
	Apple : APPLE_CONTROLLER PORT MAP (clk, snake1AteApple, snake2AteApple, player1, player2, apple_position);
	p1 : PLAYER_CONTROLLER PORT MAP (timer,score1, up1, down1, left1, right1, gameStarted, player1);
	p2 : PLAYER2_CONTROLLER PORT MAP (timer,score2, up2, down2, left2, right2, gameStarted, player2);
	vga1 : VGA PORT MAP (clk, gameStarted, player1won, player2won, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, player1, player2, apple_position);
	keyboard : ps2_keyboard PORT MAP (clk, ps2_clk, ps2_data, up1, down1, left1, right1, special1, up2, down2, left2, right2, special2);
	scoreC : ScoreController PORT MAP (score1, score2, timer, score_ssds);
	-- Debug
	led_out_collision <= gameOver;
	led_out_gameStart <= gameStarted;

end architecture;