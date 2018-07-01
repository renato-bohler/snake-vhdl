-- Projeto: Circuito Beep
--
-- Ao clicar no botao e mudar as chaves emite sons em diferentes 
--    frequencias no buzzer conectado a FPGA
--	ao despressionar, termina.
--
-- Levindo GTN (00243685) e Felipe BT (00243686)
---------------- Bibliotecas ---------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
---------------- Entidade ------------------------
entity beep is 
	  
		port
		(
        -- Sinais de Entrada: 
        ENA,CLK,RST,E0,E1,E2	: in std_logic;
		  -- Sinais de Saida:
		  A,B,C,D,E,F,G,BUZR						: out std_logic
		);
 
end entity beep;
---------------- Arquitetura --------------------
architecture comportamento of beep is
	
		shared variable FATOR:integer;					-- FATOR  = (Frequencia da placa) / 2 * (Frequencia desejada na saida do buzzer)
		shared variable CONT: integer:= 0;				-- Contador que soma 1 ate igualar-se ao FATOR selecionado
		signal LIGABUZR: std_logic := '0';				-- Variavel que aciona o Buzzer
		signal FREQ: std_logic_vector(2 downto 0);	-- Vetor que recebe o valor colocado nos switches, o qual representa uma certa nota musical
		signal DISPLAY : STD_LOGIC_VECTOR(6 downto 0);

begin
		-- Os valores de entrada dos switches sao colocados no vetor que seleciona a frequencia
	FREQ (0) <= E0;
	FREQ (1) <= E1;
	FREQ (2) <= E2;
					
prescaler: process(CLK,RST)

begin
		-- Case que indica qual fator deve ser utilizado
	case FREQ is

			when "000" => FATOR := 94967; 		-- Do  (264 Hz)
							  DISPLAY <= "0000001"; -- Imprime o valor 0 no display de 7 seguimentos
			when "001" => FATOR := 84175; 		-- Re  (297 Hz)
							  DISPLAY <= "1001111"; -- Imprime o valor 1 no display de 7 seguimentos
			when "010" => FATOR := 75757; 		-- Mi  (330 Hz)
							  DISPLAY <= "0010010"; -- Imprime o valor 2 no display de 7 seguimentos
			when "011" => FATOR := 71022; 		-- Fa  (352 Hz)
							  DISPLAY <= "0000110"; -- Imprime o valor 3 no display de 7 seguimentos
			when "100" => FATOR := 63131; 		-- Sol (396 Hz)
							  DISPLAY <= "1001100"; -- Imprime o valor 4 no display de 7 seguimentos
			when "101" => FATOR := 56818; 		-- La  (440 Hz)
							  DISPLAY <= "0100100"; -- Imprime o valor 5 no display de 7 seguimentos
			when "110" => FATOR := 50505; 		-- Si  (495 Hz)
							  DISPLAY <= "0100000"; -- Imprime o valor 6 no display de 7 seguimentos
			when "111" => FATOR := 47348; 		-- Do  (528 Hz)
							  DISPLAY <= "0001111"; -- Imprime o valor 7 no display de 7 seguimentos
			
	end case;
			
	if RST = '0' then			-- Caso esse botao for acionado o som so beep para, independente de o botao ENA estar pressionado ou nao
			CONT := 0;
			
	elsif ENA = '0' then   -- Quando o botao que aciona o buzer esta pressionado
	
			if rising_edge(CLK) then			-- A cada ciclo de clock da placa
				CONT := CONT + 1;					-- e' somado 1 no contador
				
				if CONT = FATOR then				-- Quando esse contador chegar ao valor do FATOR escolhido
					CONT := 0;						-- o contador e' zerado
					LIGABUZR <= not LIGABUZR;	-- e a variavel que aciona o buzzer passa de '0' para '1'
					
				end if;
				
			end if;	
			
	else   -- Quando solta o botao
	
		CONT := 0;
		
	end if;
	
	BUZR <= LIGABUZR;  	-- O buzzer recebe o valor '1', ou seja, comeca a emitir som
	
	-- Liga os segmentos do display
	A <= DISPLAY(6);
	B <= DISPLAY(5);
	C <= DISPLAY(4);
	D <= DISPLAY(3);
	E <= DISPLAY(2);
	F <= DISPLAY(1);
	G <= DISPLAY(0);
	
end process;
end architecture comportamento;
