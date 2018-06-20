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

	variable snakesCollided			: std_logic := '0';

	variable xCabecaCobra1			: integer;
	variable yCabecaCobra1			: integer;
	
	variable xCabecaCobra2			: integer;
	variable yCabecaCobra2			: integer;
	
begin
	if(rising_edge(gameTick)) then
		-- Detecção de colisão cobra 1 <=> cobra 2
		snakesCollided := '0';
		
		xCabecaCobra1 := snake1Matrix(0,0);
		yCabecaCobra1 := snake1Matrix(0,1);
		
		xCabecaCobra2 := snake2Matrix(0,0);
		yCabecaCobra2 := snake2Matrix(0,1);
		
		for i in 0 to MAX_ELEMENTS - 1 loop
			if ((xCabecaCobra1 = snake2Matrix(i,0) and yCabecaCobra1 = snake2Matrix(i,1)) or
				 (xCabecaCobra2 = snake1Matrix(i,0) and yCabecaCobra2 = snake1Matrix(i,1))) then
				snakesCollided := '1';
			end if;
		end loop;
		
		gameOver <= snakesCollided;
	end if;
end process;

end architecture;