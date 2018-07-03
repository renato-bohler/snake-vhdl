library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

-- Retorna o sinal da entrada em um período de clock

entity hit is
  generic (
    FREQ: natural := 50_000_000 --50 Mhz
  );
  port (
    clk: in std_logic;
    entrada: in std_logic;
    saida: out std_logic
  ) ;
end hit ; 

architecture arch of hit is     
    signal entrada_anterior : std_logic;
	 signal entrada_debounce : std_logic;
begin

	deb: entity work.debounce PORT MAP (
        clk => clk, button => entrada, result => entrada_debounce);

    process(clk)      
    begin
        if rising_edge(clk) then
          -- 1 => botão pressionado
          if entrada = '1' and entrada_anterior /= entrada_debounce then               
            saida <= '1';
          else
            saida <= '0';
          end if ;
          entrada_anterior <= entrada_debounce;
        end if;
    end process ;
end architecture ;