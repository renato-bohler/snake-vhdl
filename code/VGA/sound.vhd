library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use ieee.std_logic_unsigned.all;

entity sound is
  generic (
    FREQ: natural := 50_000_000 --50 Mhz    
  );
  port (
    clock : IN std_logic;
    snake1AteApple : IN std_logic;
    snake2AteApple : IN std_logic;
    snake1AteSpecial : IN std_logic;
    snake2AteSpecial : IN std_logic;
    player1won : IN std_logic;
	 player2won : IN std_logic;
    buzzer : OUT std_logic
  ) ;
end sound ; 

architecture arch of sound is
  TYPE state IS (
    stateSnake1AteApple_1, stateSnake2AteApple_1, 
    stateSnake1AteSpecial_1, stateSnake1AteSpecial_2, 
    stateSnake2AteSpecial_1, stateSnake2AteSpecial_2, 
    stateGameOver_1, stateGameOver_2, stateGameOver_3, stateGameOver_4,
    silence);
  signal pr_state : state := silence;
  signal nx_state : state := silence;  
  signal fator : integer;	-- FATOR  = (Frequencia da placa) / 2 * (Frequencia desejada na saida do buzzer)
  signal rocker : std_logic := '0';	-- Variavel que "oscila" o buzzer
  signal tone_duration : integer range 1 to 10; -- Duracao do toque

  signal var_snake1AteApple : std_logic;
  signal var_snake2AteApple : std_logic;
  signal var_snake1AteSpecial : std_logic;
  signal var_snake2AteSpecial : std_logic;
  signal var_player1won : std_logic;
  signal var_player2won : std_logic;
begin

  buzzer <= rocker;

  hit1: entity work.hit PORT MAP (
        clk => clock, entrada => snake1AteApple, saida => var_snake1AteApple);

  hit2: entity work.hit PORT MAP (
        clk => clock, entrada => snake2AteApple, saida => var_snake2AteApple);

  hit3: entity work.hit PORT MAP (
        clk => clock, entrada => snake1AteSpecial, saida => var_snake1AteSpecial);

  hit4: entity work.hit PORT MAP (
        clk => clock, entrada => snake2AteSpecial, saida => var_snake2AteSpecial);

  hit5: entity work.hit PORT MAP (
        clk => clock, entrada => player1won, saida => var_player1won);
		  
  hit6: entity work.hit PORT MAP (
        clk => clock, entrada => player2won, saida => var_player2won);
		  
  process(clock)
    variable counter_freq : integer := 0; -- Contador do tempo do toque 
    variable counter_fator: integer := 0; -- Contador que soma 1 ate igualar-se ao FATOR selecionado
    begin
      if rising_edge(clock) then 

        if counter_freq < FREQ / tone_duration and pr_state /= silence then
          
          counter_freq := counter_freq + 1;
          counter_fator := counter_fator + 1;

          if counter_fator = fator then
            counter_fator := 0;
            rocker <= not rocker;
          end if;

        elsif counter_freq = FREQ / tone_duration then   			 	  
          counter_freq := 0;          
          counter_fator := 0;
			 pr_state <= nx_state;
        end if;
		  
		  if var_snake1AteApple = '1' then
			 pr_state <= stateSnake1AteApple_1;
		  elsif var_snake2AteApple = '1' then
			 pr_state <= stateSnake2AteApple_1;
		  elsif var_snake1AteSpecial = '1' then
			 pr_state <= stateSnake1AteSpecial_1;
		  elsif var_snake2AteSpecial = '1' then
			 pr_state <= stateSnake2AteSpecial_1;
		  elsif var_player1won = '1' or var_player2won = '1' then
			 pr_state <= stateGameOver_1;
		  end if;

      end if;
    end process ;

  process(pr_state)
    begin
      case pr_state is  
        when silence => nx_state <= silence; tone_duration <= 1; fator <= 0;    
        when stateSnake1AteApple_1 => nx_state <= silence; tone_duration <= 3; fator <= 94967; -- Do  (264 Hz)
        when stateSnake2AteApple_1 => nx_state <= silence; tone_duration <= 3; fator <= 84175; -- Re  (297 Hz)
        when stateSnake1AteSpecial_1 => nx_state <= stateSnake1AteSpecial_2; tone_duration <= 6; fator <= 94967; -- Do  (264 Hz)
        when stateSnake1AteSpecial_2 => nx_state <= silence; tone_duration <= 6; fator <= 75757; -- Mi  (330 Hz)
        when stateSnake2AteSpecial_1 => nx_state <= stateSnake2AteSpecial_2; tone_duration <= 6; fator <= 84175; -- Re  (297 Hz)
        when stateSnake2AteSpecial_2 => nx_state <= silence; tone_duration <= 6; fator <= 71022; -- Fa  (352 Hz)
        when stateGameOver_1 => nx_state <= stateGameOver_2; tone_duration <= 2; fator <= 63131; -- Sol (396 Hz)
        when stateGameOver_2 => nx_state <= stateGameOver_3; tone_duration <= 3; fator <= 71022; -- Fa  (352 Hz)
        when stateGameOver_3 => nx_state <= stateGameOver_4; tone_duration <= 2; fator <= 56818; -- La  (440 Hz)
        when stateGameOver_4 => nx_state <= silence; tone_duration <= 1; fator <= 84175; -- Re  (297 Hz)
    end case ;
  end process ;

end architecture ;