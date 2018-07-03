library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity ScoreController is
	port(
		scorePlayer1 : in integer;
		scorePlayer2 : in integer;
		gameStarted : in std_logic;
		gameTick : in std_logic;
		ssds : out ssd_array(3 downto 0)
	);
end entity;

architecture main of ScoreController is

begin

process(gameTick)
	variable display_digit : integer range 0 to 9 := 0;
	variable i : integer range 0 to 9 := 0;
begin
	if(rising_edge(gameTick)) then
		if(gameStarted = '1') then
			display_digit := scorePlayer1/10;
			i := 3;
			case (display_digit) is
				when 0 =>
					ssds(i) <= "0000001";
				when 1 =>
					ssds(i) <= "1001111";
				when 2 =>
					ssds(i) <= "0010010";
				when 3 =>
					ssds(i) <= "0000110";
				when 4 =>
					ssds(i) <= "1001100";
				when 5 =>
					ssds(i) <= "0100100";
				when 6 =>
					ssds(i) <= "0100000";
				when 7 =>
					ssds(i) <= "0001111";
				when 8 =>
					ssds(i) <= "0000000";
				when 9 =>
					ssds(i) <= "0001100";
				when others =>
					ssds(i) <= "0010000";
			end case;
			display_digit := scorePlayer1 - display_digit*10;
			i := 2;
			case (display_digit) is
				when 0 =>
					ssds(i) <= "0000001";
				when 1 =>
					ssds(i) <= "1001111";
				when 2 =>
					ssds(i) <= "0010010";
				when 3 =>
					ssds(i) <= "0000110";
				when 4 =>
					ssds(i) <= "1001100";
				when 5 =>
					ssds(i) <= "0100100";
				when 6 =>
					ssds(i) <= "0100000";
				when 7 =>
					ssds(i) <= "0001111";
				when 8 =>
					ssds(i) <= "0000000";
				when 9 =>
					ssds(i) <= "0001100";
				when others =>
					ssds(i) <= "0010000";
			end case;
			display_digit := scorePlayer2/10;
			i := 1;
			case (display_digit) is
				when 0 =>
					ssds(i) <= "0000001";
				when 1 =>
					ssds(i) <= "1001111";
				when 2 =>
					ssds(i) <= "0010010";
				when 3 =>
					ssds(i) <= "0000110";
				when 4 =>
					ssds(i) <= "1001100";
				when 5 =>
					ssds(i) <= "0100100";
				when 6 =>
					ssds(i) <= "0100000";
				when 7 =>
					ssds(i) <= "0001111";
				when 8 =>
					ssds(i) <= "0000000";
				when 9 =>
					ssds(i) <= "0001100";
				when others =>
					ssds(i) <= "0010000";
			end case;
			display_digit := scorePlayer2 - display_digit*10;
			i := 0;
			case (display_digit) is
				when 0 =>
					ssds(i) <= "0000001";
				when 1 =>
					ssds(i) <= "1001111";
				when 2 =>
					ssds(i) <= "0010010";
				when 3 =>
					ssds(i) <= "0000110";
				when 4 =>
					ssds(i) <= "1001100";
				when 5 =>
					ssds(i) <= "0100100";
				when 6 =>
					ssds(i) <= "0100000";
				when 7 =>
					ssds(i) <= "0001111";
				when 8 =>
					ssds(i) <= "0000000";
				when 9 =>
					ssds(i) <= "0001100";
				when others =>
					ssds(i) <= "0010000";
			end case;
		else
			ssds(0) <= "1111111";
			ssds(1) <= "1111111";
			ssds(2) <= "1111111";
			ssds(3) <= "1111111";
		end if;
	end if;
end process;

end architecture;