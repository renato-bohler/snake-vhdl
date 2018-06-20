library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package display_types is
	type display_matrix is array(natural range <>, natural range <>) of integer;
	type coordinate is array(0 to 1) of integer;
	type coordinate_array is array(natural range <>, natural range<>) of integer;
	constant PIXEL_SIZE : integer := 16;
	constant MAX_ELEMENTS : integer := 61;
	constant ANIMATIONTIME : integer := 100 *50000;
end package;