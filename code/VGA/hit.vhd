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
begin

    process(clk)      
    begin
        if rising_edge(clk) then
          -- 1 => botão pressionado
          if entrada = '1' and entrada_anterior /= entrada then               
            saida <= '1';
          else
            saida <= '0';
          end if ;
          entrada_anterior <= entrada;
        end if;
    end process ;
end architecture ;