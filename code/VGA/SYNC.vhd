library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.display_types.all;

entity SYNC is
port(
	clk : in std_logic;
	hsync, vsync :out std_logic;
	r,g,b : out std_logic_vector(3 downto 0);
	player1 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	player2 : in coordinate_array (0 to MAX_ELEMENTS - 1, 0 to 1);
	apple_position : in coordinate
);
end entity;

architecture main of SYNC is

constant H_SIZE : integer := 1280;
constant H_FP : integer := 48;
constant H_BP : integer := 248;
constant H_SYNCP : integer := 112;
constant H_OFFSET : integer := H_FP + H_BP + H_SYNCP;

constant V_SIZE : integer := 1024;
constant V_FP : integer := 1;
constant V_BP : integer := 38;
constant V_SYNCP : integer := 3;
constant V_OFFSET : integer := V_FP + V_BP + V_SYNCP;


constant BLACK : integer := 0;
constant WHITE : integer := 1;
constant BLUE : integer := 2;
constant RED : integer := 3;
constant GREEN : integer := 66;


signal hpos : integer range 0 to (H_SIZE + H_OFFSET) := 0;
signal vpos : integer range 0 to (V_SIZE + V_OFFSET) := 0;

signal singleAct : std_logic := '1';

begin 

process(clk)

variable hMatrix, vMatrix : integer := 0;
variable draw : std_logic := '0';

begin

	if(rising_edge(clk)) then
		if(draw = '1') then
			hMatrix := (hpos - H_OFFSET)/PIXEL_SIZE;
			vMatrix := (vpos - V_OFFSET)/PIXEL_SIZE;
			if((hpos - H_OFFSET) REM PIXEL_SIZE = 0 or (vpos - V_OFFSET) REM PIXEL_SIZE = 0) then
				r <= (others => '0');
				g <= (others => '0');
				b <= (others => '0');
			else
				for i in 0 to MAX_ELEMENTS - 1 loop
					if(vMatrix = player1(i, 1)) then
						if(hMatrix = player1(i,0)) then
							r <= (others => '1');
							g <= (others => '0');
							b <= (others => '1');
						end if;
					end if;
				end loop;
				for i in 0 to MAX_ELEMENTS - 1 loop
					if(vMatrix = player2(i, 1)) then
						if(hMatrix = player2(i,0)) then
							r <= (others => '0');
							g <= (others => '0');
							b <= (others => '1');
						end if;
					end if;
				end loop;
				if(vMatrix = apple_position(1)) then
					if(hMatrix = apple_position(0)) then
						r <= (others => '1');
						g <= (others => '1');
						b <= (others => '1');
					end if;
				end if;
--				if(MATRIX(vMatrix,hMatrix) = WHITE) then
--					r <= (others => '1');
--					g <= (others => '1');
--					b <= (others => '1');
--				elsif(MATRIX(vMatrix,hMatrix) = RED) then
--					r <= (others => '1');
--					g <= (others => '0');
--					b <= (others => '0');
--				elsif(MATRIX(vMatrix,hMatrix) = GREEN) then
--					r <= (others => '0');
--					g <= (others => '1');
--					b <= (others => '0');
--				elsif(MATRIX(vMatrix,hMatrix) = BLUE) then
--					r <= (others => '0');
--					g <= (others => '0');
--					b <= (others => '1');
--				else
--					r <= (0 => '1',others => '0');
--					g <= (0 => '1',others => '0');
--					b <= (0 => '1',others => '0');
--				end if;
			end if;
		else	
				r <= (0 => '1',others => '0');
				g <= (0 => '1',others => '0');
				b <= (0 => '1',others => '0');
		end if;
		if(hpos < H_OFFSET + H_SIZE) then
			hpos<= hpos +1;
		else
			hpos<= 0;
			if(vpos < 1066) then
				vpos<= vpos + 1;
			else
				vpos <= 0;
			end if;
		end if;
	end if;
	if(hpos >H_FP and hpos <H_FP + H_SYNCP) then
		hsync <= '0';
	else
		hsync <= '1';
	end if;
	if(vpos > 0 and vpos < V_FP + V_SYNCP) then
		vsync <= '0';
	else
		vsync <= '1';
	end if;
	if((hpos > 0 and hpos < H_OFFSET) or (vpos >0 and vpos <V_OFFSET)) then
		r<= (others => '0');
		g<= (others => '0');
		b<= (others => '0');
		draw := '0';
	else
		draw := '1';
	end if;
end process;

end architecture;