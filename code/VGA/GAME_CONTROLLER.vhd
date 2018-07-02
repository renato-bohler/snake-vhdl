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
		gameStarted			: out std_logic;
		player1won			: out std_logic;
		player2won			: out std_logic
	);
end entity;

architecture main of GAME_CONTROLLER is


signal player1Collided : std_logic := '0';
signal player2Collided : std_logic := '0';

signal scorePlayer1 : integer := INIT_SIZE;
signal scorePlayer2 : integer := INIT_SIZE;

signal started : std_logic;
begin

process(gameTick)
	constant pamonhaNaMandiocaTime : integer := 10;
	variable timerCounter : integer := 0;
	variable singleAct 	 : std_logic := '0';
begin
	if(rising_edge(gameTick)) then
		if(timerCounter > pamonhaNaMandiocaTime) then
			timerCounter := 0;
			if(gameStart = '1' and singleAct = '0') then
				gameStarted <= not started;
				started <= not started;
				singleAct := '1';
			elsif(gameStart = '0' and singleAct = '1') then
				singleAct := '0';
			end if;
		else
			timerCounter := timerCounter + 1;
		end if;
	end if;
end process;


process(gameTick)

	variable snakesCollided			: std_logic := '0';
	
	variable internalPlayer1Collided			: std_logic := '0';
	variable internalPlayer2Collided 	: std_logic := '0';
	
	
	variable xCabecaCobra1			: integer;
	variable yCabecaCobra1			: integer;
	
	variable xCabecaCobra2			: integer;
	variable yCabecaCobra2			: integer;
	
begin
	if(rising_edge(gameTick)) then
		-- Detecção de colisão cobra 1 <=> cobra 2
		if(started = '1') then
			snakesCollided := '0';
			internalPlayer1Collided := '0';
			internalPlayer2Collided := '0';
			
			xCabecaCobra1 := snake1Matrix(0,0);
			yCabecaCobra1 := snake1Matrix(0,1);
			
			xCabecaCobra2 := snake2Matrix(0,0);
			yCabecaCobra2 := snake2Matrix(0,1);
			
			for i in 0 to MAX_ELEMENTS - 1 loop
				if ((xCabecaCobra1 = snake2Matrix(i,0) and yCabecaCobra1 = snake2Matrix(i,1))) then
					internalPlayer1Collided := '1';
				end if;
				if((xCabecaCobra2 = snake1Matrix(i,0) and yCabecaCobra2 = snake1Matrix(i,1))) then
					internalPlayer2Collided := '1';
				end if;
			end loop;
			for i in 1 to MAX_ELEMENTS - 1 loop
				if ((xCabecaCobra1 = snake1Matrix(i,0) and yCabecaCobra1 = snake1Matrix(i,1))) then
					internalPlayer1Collided := '1';
				end if;
				if((xCabecaCobra2 = snake2Matrix(i,0) and yCabecaCobra2 = snake2Matrix(i,1))) then
					internalPlayer2Collided := '1';
				end if;
			end loop;
			player1Collided <= internalPlayer1Collided;
			player2Collided <= internalPlayer2Collided;
		end if;
	end if;
end process;

process(gameTick)
	variable score1Var : integer := 0;
	variable score2Var : integer := 0;

	variable xCabecaCobra1			: integer;
	variable yCabecaCobra1			: integer;
	
	variable xCabecaCobra2			: integer;
	variable yCabecaCobra2			: integer;
	
	variable singleAct1 : std_logic := '0';
	variable singleAct2 : std_logic := '0';
	variable singleAct3 : std_logic := '0';
	variable singleAct4 : std_logic := '0';
begin
	if(rising_edge(gameTick)) then
		if(started = '1') then
			-- Detecção de colisão cobra 1 <=> cobra 2
			xCabecaCobra1 := snake1Matrix(0,0);
			yCabecaCobra1 := snake1Matrix(0,1);
			
			xCabecaCobra2 := snake2Matrix(0,0);
			yCabecaCobra2 := snake2Matrix(0,1);
			
			if ((xCabecaCobra1 = appleMatrix(0) and yCabecaCobra1 = appleMatrix(1)) and singleAct1 = '0') then 
				score1Var := score1Var + 1;
				snake1AteApple <= '1';
				singleAct1 := '1';
			elsif(singleAct1 = '1' and (xCabecaCobra1 /= appleMatrix(0) or yCabecaCobra1 /= appleMatrix(1))) then
				snake1AteApple <= '0';
				singleAct1 := '0';
			else
				snake1AteApple <= '0';
			end if;
			if ((xCabecaCobra2 = appleMatrix(0) and yCabecaCobra2 = appleMatrix(1)) and singleAct2 = '0') then
				score2Var := score2Var + 1;
				snake2AteApple <= '1';
				singleAct2 := '1';
			elsif(singleAct2 = '1' and (xCabecaCobra2 /= appleMatrix(0) or yCabecaCobra2 /= appleMatrix(1))) then
				snake2AteApple <= '0';
				singleAct2 := '0';
			else 
				snake2AteApple <= '0';
			end if;
			
			if ((xCabecaCobra1 = specialMatrix(0) and yCabecaCobra1 = specialMatrix(1)) and singleAct3 = '0') then 
				score1Var := score1Var + 3;
				snake1AteSpecial <= '1';
				singleAct3 := '1';
			elsif(singleAct1 = '1' and (xCabecaCobra1 /= specialMatrix(0) or yCabecaCobra1 /= specialMatrix(1))) then
				snake1AteSpecial <= '0';
				singleAct3 := '0';
			else
				snake1AteSpecial <= '0';
			end if;
			if ((xCabecaCobra2 = specialMatrix(0) and yCabecaCobra2 = specialMatrix(1)) and singleAct4 = '0') then
				score2Var := score2Var + 3;
				snake2AteSpecial <= '1';
				singleAct4 := '1';
			elsif(singleAct4 = '1' and (xCabecaCobra2 /= specialMatrix(0) or yCabecaCobra2 /= specialMatrix(1))) then
				snake2AteSpecial <= '0';
				singleAct4 := '0';
			else 
				snake2AteSpecial <= '0';
			end if;
		else
			score1Var := INIT_SIZE;
			score2Var := INIT_SIZE;
		end if;
		scorePlayer1 <= score1Var;
		scorePlayer2 <= score2Var;
		score1 <= score1Var;
		score2 <= score2Var;
	end if;
end process;

process(gameTick)
	variable varPlayer1Wins : std_logic := '0';
	variable varPlayer2Wins : std_logic := '0';
begin
	if(rising_edge(gameTick)) then
		if(started = '1') then
			if(scorePlayer1 >= WIN_SIZE) then
				varPlayer1Wins := '1';
			end if;
			if(scorePlayer2 >= WIN_SIZE) then
				varPlayer2Wins := '1';
			end if;
			if(player1Collided = '1') then
				varPlayer2Wins := '1';
			end if;
			if(player2Collided = '1') then
				varPlayer1Wins := '1';
			end if;
			if(varPlayer1Wins = '1' and varPlayer2Wins = '1') then
				varPlayer2Wins := '0';
			end if;
		else
			varPlayer1Wins := '0';
			varPlayer2Wins := '0';
		end if;
		player1won <= varPlayer1Wins;
		player2won <= varPlayer2Wins;
	end if;
end process;


end architecture;