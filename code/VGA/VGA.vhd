library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;
entity VGA is
port (
	clk : in std_logic;
	gameStarted : in std_logic;
	player1won : in std_logic;
	player2won : in std_logic;
	VGA_HS, VGA_VS : out std_logic;
	VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
	player1 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	player2 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	apple_position : in coordinate
);
end entity;

architecture main of VGA is


 component PLL is
	  port (
			clk_in_clk  : in  std_logic := 'X'; -- clk
			reset_reset : in  std_logic := 'X'; -- reset
			clk_out_clk : out std_logic         -- clk
	  );
 end component PLL;

component SYNC is
port(
	clk : in std_logic;
	gameStarted : in std_logic;
	player1won : in std_logic;
	player2won : in std_logic;
	hsync, vsync :out std_logic;
	r,g,b : out std_logic_vector(3 downto 0);
	player1 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	player2 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	apple_position : in coordinate
);
end component;


constant BLACK : integer := 0;
constant WHITE : integer := 1;
constant BLUE : integer := 2;
constant RED : integer := 3;
constant GREEN : integer := 66;

constant H_SIZE : integer := 1280;
constant V_SIZE : integer := 1024;
constant H_MATRIX_SIZE : integer := H_SIZE/PIXEL_SIZE;
constant V_MATRIX_SIZE : integer := V_SIZE/PIXEL_SIZE;

signal RESET, VGACLK : std_logic := '1';

signal timer : std_logic;
begin 
	C1 : SYNC PORT MAP(VGACLK, gameStarted, player1won, player2won, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, player1, player2, apple_position);
	C2 : PLL PORT MAP (clk, RESET, VGACLK);

end main;