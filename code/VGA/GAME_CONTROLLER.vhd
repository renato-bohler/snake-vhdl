library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity GAME_CONTROLLER IS
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
end entity;

architecture main of GAME_CONTROLLER is

begin

process(gameTick)

	variable score1Var 				: integer := 0;
	variable score2Var 				: integer := 0;

	variable snake1AteAppleVar 	: std_logic := '0';
	variable snake2AteAppleVar 	: std_logic := '0';

	variable snake1AteSpecialVar	: std_logic := '0';
	variable snake2AteSpecialVar	: std_logic := '0';

	variable gameOverVar 			: std_logic	:= '0';

	-- TODO: gameRunning deveria ser controlado pelo gameStart
	variable gameRunningVar 		: std_logic := '1';

begin

	if(rising_edge(gameTick)) then
		gameOverVar := not(gameOverVar);
	end if;
	gameOver <= gameOverVar;

end process;

end architecture;