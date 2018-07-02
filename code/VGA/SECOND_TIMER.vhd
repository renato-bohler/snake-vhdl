library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity SECOND_TIMER IS
	port (
		clk : in std_logic;
		rst : in std_logic;
		timerOut : out std_logic
	);
end entity;

architecture main of SECOND_TIMER is

begin

process(clk)
variable timerCounter : integer := 0;
begin
	if(clk'EVENT and clk = '1') then
		if(rst = '1') then
			timerCounter := 0;
			timerOut <= '0';
		elsif(timerCounter < 1000 - 1) then
			timerCounter := timerCounter +1;
			timerOut <= '0';
		else
			timerOut <= '1';
			timerCounter := 0;
	end if;
 end if;
end process;

end architecture;