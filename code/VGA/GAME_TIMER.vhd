library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity GAME_TIMER IS
	port (
		clk : in std_logic;
		timerOut : out std_logic
	);
end entity;

architecture main of GAME_TIMER is

begin

process(clk)
variable timerCounter : integer := 0;
begin
	if(clk'EVENT and clk = '1') then
		if(timerCounter < ANIMATIONTIME - 1) then
			timerCounter := timerCounter +1;
			timerOut <= '0';
		else
			timerOut <= '1';
			timerCounter := 0;
	end if;
 end if;
  end process;

end architecture;