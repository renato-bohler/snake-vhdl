library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity TOP_LEVEL IS
	port (
		clk : in std_logic;
		up, down, left, right : in std_logic;
		VGA_HS, VGA_VS : out std_logic;
		VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0)
	);
end entity;

architecture main of TOP_LEVEL is

component VGA is
port (
	clk : in std_logic;
	VGA_HS, VGA_VS : out std_logic;
	VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
	test : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1)
);
end component;

component PLAYER_CONTROLLER IS
	port (
		clk : in std_logic;
		up, down, left, right : in std_logic;
		player : out coordinate_array(MAX_ELEMENTS - 1 downto 0, 0 to 1)
	);
end component;

signal player1 : coordinate_array(MAX_ELEMENTS - 1 downto 0, 0 to 1);

begin

	p1 : PLAYER_CONTROLLER PORT MAP (clk, up, down, left, right, player1);
	vga1 : VGA PORT MAP (clk, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, player1);

end architecture;