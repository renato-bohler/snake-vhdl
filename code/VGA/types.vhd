library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package display_types is
	constant PIXEL_SIZE : integer := 16;
	constant MAX_ELEMENTS : integer := 32;
	constant FIXED_SCREEN_ELEMENTS : integer range 0 to 601:= 600;
	constant ANIMATIONTIME : integer := 1 *50000;
	constant H_SIZE : integer := 80;
	constant V_SIZE : integer := 64;
	type display_matrix is array(natural range <>, natural range <>) of integer range -1 to H_SIZE;
	type coordinate is array(0 to 1) of integer range 0 to H_SIZE;
	type coordinate_array is array(natural range <>, natural range<>) of integer range -1 to H_SIZE;
	type ssd_array is array(natural range<>) of std_logic_vector(6 downto 0);
	type logic_image is array (natural range<>, natural range<>) of bit;
end package;