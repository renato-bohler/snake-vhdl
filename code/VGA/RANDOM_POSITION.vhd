library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use work.display_types.all;

entity random_position is
  port (
    clock : IN std_logic;       
    changeCoordinate : IN std_logic;
    pseudoClock : IN std_logic;
    randomCoordinate : OUT coordinate
  );
end random_position ; 

architecture arch of random_position is
    signal change : std_logic;
    signal x_random : integer range 0 to H_SIZE := H_SIZE / 2;
    signal y_random : integer range 0 to V_SIZE := V_SIZE / 3;
begin

    hit: entity work.hit PORT MAP (
        clk => clock, entrada => changeCoordinate, saida => change);

    process(clock)      
    begin
        if change = '1' then
            randomCoordinate(0) <= x_random;
            randomCoordinate(1) <= y_random;
        end if;
    end process ;

    process(pseudoClock)        
        begin
            if rising_edge(pseudoClock) then
                x_random <= x_random + 19;
                y_random <= y_random + 27;
            end if;
    end process;

end architecture ;