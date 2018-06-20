-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/20/2018 17:10:17"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ps2_keyboard IS
    PORT (
	clk : IN std_logic;
	ps2_clk : IN std_logic;
	ps2_data : IN std_logic;
	snake1Up : BUFFER std_logic;
	snake1Down : BUFFER std_logic;
	snake1Left : BUFFER std_logic;
	snake1Right : BUFFER std_logic;
	snake1Special : BUFFER std_logic;
	snake2Up : BUFFER std_logic;
	snake2Down : BUFFER std_logic;
	snake2Left : BUFFER std_logic;
	snake2Right : BUFFER std_logic;
	snake2Special : BUFFER std_logic
	);
END ps2_keyboard;

-- Design Ports Information
-- snake1Up	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake1Down	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake1Left	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake1Right	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake1Special	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake2Up	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake2Down	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake2Left	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake2Right	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- snake2Special	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ps2_clk	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ps2_data	=>  Location: PIN_P21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ps2_keyboard IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_ps2_clk : std_logic;
SIGNAL ww_ps2_data : std_logic;
SIGNAL ww_snake1Up : std_logic;
SIGNAL ww_snake1Down : std_logic;
SIGNAL ww_snake1Left : std_logic;
SIGNAL ww_snake1Right : std_logic;
SIGNAL ww_snake1Special : std_logic;
SIGNAL ww_snake2Up : std_logic;
SIGNAL ww_snake2Down : std_logic;
SIGNAL ww_snake2Left : std_logic;
SIGNAL ww_snake2Right : std_logic;
SIGNAL ww_snake2Special : std_logic;
SIGNAL \debounce_ps2_clk|result~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ps2_code_new~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \snake1Up~output_o\ : std_logic;
SIGNAL \snake1Down~output_o\ : std_logic;
SIGNAL \snake1Left~output_o\ : std_logic;
SIGNAL \snake1Right~output_o\ : std_logic;
SIGNAL \snake1Special~output_o\ : std_logic;
SIGNAL \snake2Up~output_o\ : std_logic;
SIGNAL \snake2Down~output_o\ : std_logic;
SIGNAL \snake2Left~output_o\ : std_logic;
SIGNAL \snake2Right~output_o\ : std_logic;
SIGNAL \snake2Special~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \count_idle[0]~12_combout\ : std_logic;
SIGNAL \ps2_clk~input_o\ : std_logic;
SIGNAL \debounce_ps2_clk|flipflops[0]~feeder_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|flipflops[1]~feeder_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|result~1_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[0]~1_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~0_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[0]~9_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~1\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~2_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[1]~8_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~3\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~4_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[2]~7_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~5\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~6_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[3]~6_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~7\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~8_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[4]~5_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~9\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~10_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[5]~4_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~11\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~12_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[6]~3_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~13\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~14_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out[7]~2_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~15\ : std_logic;
SIGNAL \debounce_ps2_clk|Add0~16_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|counter_out~0_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|result~0_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|result~feeder_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|result~q\ : std_logic;
SIGNAL \count_idle[6]~26\ : std_logic;
SIGNAL \count_idle[7]~27_combout\ : std_logic;
SIGNAL \count_idle[7]~28\ : std_logic;
SIGNAL \count_idle[8]~29_combout\ : std_logic;
SIGNAL \count_idle[8]~30\ : std_logic;
SIGNAL \count_idle[9]~31_combout\ : std_logic;
SIGNAL \count_idle[9]~32\ : std_logic;
SIGNAL \count_idle[10]~33_combout\ : std_logic;
SIGNAL \count_idle[10]~34\ : std_logic;
SIGNAL \count_idle[11]~35_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \count_idle[10]~14_combout\ : std_logic;
SIGNAL \count_idle[0]~13\ : std_logic;
SIGNAL \count_idle[1]~15_combout\ : std_logic;
SIGNAL \count_idle[1]~16\ : std_logic;
SIGNAL \count_idle[2]~17_combout\ : std_logic;
SIGNAL \count_idle[2]~18\ : std_logic;
SIGNAL \count_idle[3]~19_combout\ : std_logic;
SIGNAL \count_idle[3]~20\ : std_logic;
SIGNAL \count_idle[4]~21_combout\ : std_logic;
SIGNAL \count_idle[4]~22\ : std_logic;
SIGNAL \count_idle[5]~23_combout\ : std_logic;
SIGNAL \count_idle[5]~24\ : std_logic;
SIGNAL \count_idle[6]~25_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \debounce_ps2_clk|result~clkctrl_outclk\ : std_logic;
SIGNAL \ps2_data~input_o\ : std_logic;
SIGNAL \debounce_ps2_data|flipflops[1]~feeder_combout\ : std_logic;
SIGNAL \debounce_ps2_data|result~1_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[0]~1_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~0_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[0]~9_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~1\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~2_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[1]~8_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~3\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~4_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[2]~7_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~5\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~6_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[3]~6_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~7\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~8_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[4]~5_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~9\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~10_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[5]~4_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~11\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~12_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[6]~3_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~13\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~14_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out[7]~2_combout\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~15\ : std_logic;
SIGNAL \debounce_ps2_data|Add0~16_combout\ : std_logic;
SIGNAL \debounce_ps2_data|counter_out~0_combout\ : std_logic;
SIGNAL \debounce_ps2_data|result~0_combout\ : std_logic;
SIGNAL \debounce_ps2_data|result~q\ : std_logic;
SIGNAL \ps2_word[10]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[9]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[8]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[7]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[6]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[5]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[4]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[3]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[2]~feeder_combout\ : std_logic;
SIGNAL \ps2_word[1]~feeder_combout\ : std_logic;
SIGNAL \error~0_combout\ : std_logic;
SIGNAL \process_2~0_combout\ : std_logic;
SIGNAL \error~1_combout\ : std_logic;
SIGNAL \process_2~1_combout\ : std_logic;
SIGNAL \process_2~2_combout\ : std_logic;
SIGNAL \ps2_code_new~q\ : std_logic;
SIGNAL \ps2_code_new~clkctrl_outclk\ : std_logic;
SIGNAL \ps2_code_old1[1]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old1[0]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old1[7]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old1[3]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old1[5]~feeder_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \ps2_code_old2[4]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old2[7]~feeder_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \ps2_code_old2[3]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old2[2]~feeder_combout\ : std_logic;
SIGNAL \ps2_code_old2[1]~feeder_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \snake1Left~2_combout\ : std_logic;
SIGNAL \snake1Left~3_combout\ : std_logic;
SIGNAL \snake1Up~3_combout\ : std_logic;
SIGNAL \snake1Up~2_combout\ : std_logic;
SIGNAL \snake1Up~reg0_q\ : std_logic;
SIGNAL \snake1Down~4_combout\ : std_logic;
SIGNAL \snake1Down~3_combout\ : std_logic;
SIGNAL \snake1Down~reg0_q\ : std_logic;
SIGNAL \snake1Left~5_combout\ : std_logic;
SIGNAL \snake1Left~4_combout\ : std_logic;
SIGNAL \snake1Left~reg0_q\ : std_logic;
SIGNAL \snake1Special~0_combout\ : std_logic;
SIGNAL \snake1Down~2_combout\ : std_logic;
SIGNAL \snake1Special~1_combout\ : std_logic;
SIGNAL \snake1Right~0_combout\ : std_logic;
SIGNAL \snake1Right~1_combout\ : std_logic;
SIGNAL \snake1Right~reg0_q\ : std_logic;
SIGNAL \snake1Special~2_combout\ : std_logic;
SIGNAL \snake1Special~3_combout\ : std_logic;
SIGNAL \snake1Special~reg0_q\ : std_logic;
SIGNAL \snake2Up~1_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \snake2Up~0_combout\ : std_logic;
SIGNAL \snake2Up~3_combout\ : std_logic;
SIGNAL \snake2Up~4_combout\ : std_logic;
SIGNAL \snake2Up~2_combout\ : std_logic;
SIGNAL \snake2Up~reg0_q\ : std_logic;
SIGNAL \snake2Right~0_combout\ : std_logic;
SIGNAL \snake2Down~6_combout\ : std_logic;
SIGNAL \snake2Down~4_combout\ : std_logic;
SIGNAL \snake2Down~5_combout\ : std_logic;
SIGNAL \snake2Down~7_combout\ : std_logic;
SIGNAL \snake2Down~reg0_q\ : std_logic;
SIGNAL \snake2Left~0_combout\ : std_logic;
SIGNAL \snake2Left~1_combout\ : std_logic;
SIGNAL \snake2Left~reg0_q\ : std_logic;
SIGNAL \snake2Right~1_combout\ : std_logic;
SIGNAL \snake2Right~reg0_q\ : std_logic;
SIGNAL \snake2Special~0_combout\ : std_logic;
SIGNAL \snake2Special~1_combout\ : std_logic;
SIGNAL \snake2Special~reg0_q\ : std_logic;
SIGNAL \debounce_ps2_data|flipflops\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \debounce_ps2_data|counter_out\ : std_logic_vector(8 DOWNTO 0);
SIGNAL sync_ffs : std_logic_vector(1 DOWNTO 0);
SIGNAL ps2_word : std_logic_vector(10 DOWNTO 0);
SIGNAL ps2_code_old2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ps2_code_old1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ps2_code : std_logic_vector(7 DOWNTO 0);
SIGNAL count_idle : std_logic_vector(11 DOWNTO 0);
SIGNAL \debounce_ps2_clk|flipflops\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \debounce_ps2_clk|counter_out\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\ : std_logic;
SIGNAL \debounce_ps2_clk|ALT_INV_result~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_ps2_clk <= ps2_clk;
ww_ps2_data <= ps2_data;
snake1Up <= ww_snake1Up;
snake1Down <= ww_snake1Down;
snake1Left <= ww_snake1Left;
snake1Right <= ww_snake1Right;
snake1Special <= ww_snake1Special;
snake2Up <= ww_snake2Up;
snake2Down <= ww_snake2Down;
snake2Left <= ww_snake2Left;
snake2Right <= ww_snake2Right;
snake2Special <= ww_snake2Special;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\debounce_ps2_clk|result~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \debounce_ps2_clk|result~q\);

\ps2_code_new~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ps2_code_new~q\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\ <= NOT \debounce_ps2_clk|result~clkctrl_outclk\;
\debounce_ps2_clk|ALT_INV_result~q\ <= NOT \debounce_ps2_clk|result~q\;

-- Location: IOOBUF_X0_Y27_N16
\snake1Up~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake1Up~reg0_q\,
	devoe => ww_devoe,
	o => \snake1Up~output_o\);

-- Location: IOOBUF_X0_Y27_N9
\snake1Down~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake1Down~reg0_q\,
	devoe => ww_devoe,
	o => \snake1Down~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\snake1Left~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake1Left~reg0_q\,
	devoe => ww_devoe,
	o => \snake1Left~output_o\);

-- Location: IOOBUF_X0_Y26_N23
\snake1Right~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake1Right~reg0_q\,
	devoe => ww_devoe,
	o => \snake1Right~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\snake1Special~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake1Special~reg0_q\,
	devoe => ww_devoe,
	o => \snake1Special~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\snake2Up~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake2Up~reg0_q\,
	devoe => ww_devoe,
	o => \snake2Up~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\snake2Down~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake2Down~reg0_q\,
	devoe => ww_devoe,
	o => \snake2Down~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\snake2Left~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake2Left~reg0_q\,
	devoe => ww_devoe,
	o => \snake2Left~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\snake2Right~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake2Right~reg0_q\,
	devoe => ww_devoe,
	o => \snake2Right~output_o\);

-- Location: IOOBUF_X0_Y20_N9
\snake2Special~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \snake2Special~reg0_q\,
	devoe => ww_devoe,
	o => \snake2Special~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G9
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X23_Y23_N6
\count_idle[0]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[0]~12_combout\ = count_idle(0) $ (VCC)
-- \count_idle[0]~13\ = CARRY(count_idle(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(0),
	datad => VCC,
	combout => \count_idle[0]~12_combout\,
	cout => \count_idle[0]~13\);

-- Location: IOIBUF_X41_Y11_N1
\ps2_clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ps2_clk,
	o => \ps2_clk~input_o\);

-- Location: FF_X22_Y7_N29
\sync_ffs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ps2_clk~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sync_ffs(0));

-- Location: LCCOMB_X22_Y7_N26
\debounce_ps2_clk|flipflops[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|flipflops[0]~feeder_combout\ = sync_ffs(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => sync_ffs(0),
	combout => \debounce_ps2_clk|flipflops[0]~feeder_combout\);

-- Location: FF_X22_Y7_N27
\debounce_ps2_clk|flipflops[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|flipflops[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|flipflops\(0));

-- Location: LCCOMB_X22_Y7_N24
\debounce_ps2_clk|flipflops[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|flipflops[1]~feeder_combout\ = \debounce_ps2_clk|flipflops\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_ps2_clk|flipflops\(0),
	combout => \debounce_ps2_clk|flipflops[1]~feeder_combout\);

-- Location: FF_X22_Y7_N25
\debounce_ps2_clk|flipflops[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|flipflops[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|flipflops\(1));

-- Location: LCCOMB_X22_Y7_N22
\debounce_ps2_clk|result~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|result~1_combout\ = (\debounce_ps2_clk|counter_out\(8) & (\debounce_ps2_clk|flipflops\(1) $ (!\debounce_ps2_clk|flipflops\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_clk|flipflops\(1),
	datac => \debounce_ps2_clk|flipflops\(0),
	datad => \debounce_ps2_clk|counter_out\(8),
	combout => \debounce_ps2_clk|result~1_combout\);

-- Location: LCCOMB_X22_Y7_N28
\debounce_ps2_clk|counter_out[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[0]~1_combout\ = (!\debounce_ps2_clk|counter_out\(8) & (\debounce_ps2_clk|flipflops\(0) $ (!\debounce_ps2_clk|flipflops\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|flipflops\(0),
	datab => \debounce_ps2_clk|flipflops\(1),
	datad => \debounce_ps2_clk|counter_out\(8),
	combout => \debounce_ps2_clk|counter_out[0]~1_combout\);

-- Location: LCCOMB_X23_Y7_N12
\debounce_ps2_clk|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~0_combout\ = \debounce_ps2_clk|counter_out\(0) $ (VCC)
-- \debounce_ps2_clk|Add0~1\ = CARRY(\debounce_ps2_clk|counter_out\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|counter_out\(0),
	datad => VCC,
	combout => \debounce_ps2_clk|Add0~0_combout\,
	cout => \debounce_ps2_clk|Add0~1\);

-- Location: LCCOMB_X22_Y7_N16
\debounce_ps2_clk|counter_out[0]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[0]~9_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(0)) # ((\debounce_ps2_clk|Add0~0_combout\ & \debounce_ps2_clk|counter_out[0]~1_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (((\debounce_ps2_clk|Add0~0_combout\ & \debounce_ps2_clk|counter_out[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out\(0),
	datac => \debounce_ps2_clk|Add0~0_combout\,
	datad => \debounce_ps2_clk|counter_out[0]~1_combout\,
	combout => \debounce_ps2_clk|counter_out[0]~9_combout\);

-- Location: FF_X23_Y7_N29
\debounce_ps2_clk|counter_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \debounce_ps2_clk|counter_out[0]~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(0));

-- Location: LCCOMB_X23_Y7_N14
\debounce_ps2_clk|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~2_combout\ = (\debounce_ps2_clk|counter_out\(1) & (!\debounce_ps2_clk|Add0~1\)) # (!\debounce_ps2_clk|counter_out\(1) & ((\debounce_ps2_clk|Add0~1\) # (GND)))
-- \debounce_ps2_clk|Add0~3\ = CARRY((!\debounce_ps2_clk|Add0~1\) # (!\debounce_ps2_clk|counter_out\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_clk|counter_out\(1),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~1\,
	combout => \debounce_ps2_clk|Add0~2_combout\,
	cout => \debounce_ps2_clk|Add0~3\);

-- Location: LCCOMB_X22_Y7_N6
\debounce_ps2_clk|counter_out[1]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[1]~8_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(1)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~2_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(1),
	datad => \debounce_ps2_clk|Add0~2_combout\,
	combout => \debounce_ps2_clk|counter_out[1]~8_combout\);

-- Location: FF_X22_Y7_N7
\debounce_ps2_clk|counter_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(1));

-- Location: LCCOMB_X23_Y7_N16
\debounce_ps2_clk|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~4_combout\ = (\debounce_ps2_clk|counter_out\(2) & (\debounce_ps2_clk|Add0~3\ $ (GND))) # (!\debounce_ps2_clk|counter_out\(2) & (!\debounce_ps2_clk|Add0~3\ & VCC))
-- \debounce_ps2_clk|Add0~5\ = CARRY((\debounce_ps2_clk|counter_out\(2) & !\debounce_ps2_clk|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|counter_out\(2),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~3\,
	combout => \debounce_ps2_clk|Add0~4_combout\,
	cout => \debounce_ps2_clk|Add0~5\);

-- Location: LCCOMB_X23_Y7_N10
\debounce_ps2_clk|counter_out[2]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[2]~7_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(2)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~4_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(2),
	datad => \debounce_ps2_clk|Add0~4_combout\,
	combout => \debounce_ps2_clk|counter_out[2]~7_combout\);

-- Location: FF_X23_Y7_N11
\debounce_ps2_clk|counter_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(2));

-- Location: LCCOMB_X23_Y7_N18
\debounce_ps2_clk|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~6_combout\ = (\debounce_ps2_clk|counter_out\(3) & (!\debounce_ps2_clk|Add0~5\)) # (!\debounce_ps2_clk|counter_out\(3) & ((\debounce_ps2_clk|Add0~5\) # (GND)))
-- \debounce_ps2_clk|Add0~7\ = CARRY((!\debounce_ps2_clk|Add0~5\) # (!\debounce_ps2_clk|counter_out\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|counter_out\(3),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~5\,
	combout => \debounce_ps2_clk|Add0~6_combout\,
	cout => \debounce_ps2_clk|Add0~7\);

-- Location: LCCOMB_X23_Y7_N6
\debounce_ps2_clk|counter_out[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[3]~6_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(3)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~6_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(3),
	datad => \debounce_ps2_clk|Add0~6_combout\,
	combout => \debounce_ps2_clk|counter_out[3]~6_combout\);

-- Location: FF_X23_Y7_N7
\debounce_ps2_clk|counter_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(3));

-- Location: LCCOMB_X23_Y7_N20
\debounce_ps2_clk|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~8_combout\ = (\debounce_ps2_clk|counter_out\(4) & (\debounce_ps2_clk|Add0~7\ $ (GND))) # (!\debounce_ps2_clk|counter_out\(4) & (!\debounce_ps2_clk|Add0~7\ & VCC))
-- \debounce_ps2_clk|Add0~9\ = CARRY((\debounce_ps2_clk|counter_out\(4) & !\debounce_ps2_clk|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_clk|counter_out\(4),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~7\,
	combout => \debounce_ps2_clk|Add0~8_combout\,
	cout => \debounce_ps2_clk|Add0~9\);

-- Location: LCCOMB_X23_Y7_N0
\debounce_ps2_clk|counter_out[4]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[4]~5_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(4)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~8_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(4),
	datad => \debounce_ps2_clk|Add0~8_combout\,
	combout => \debounce_ps2_clk|counter_out[4]~5_combout\);

-- Location: FF_X23_Y7_N1
\debounce_ps2_clk|counter_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[4]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(4));

-- Location: LCCOMB_X23_Y7_N22
\debounce_ps2_clk|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~10_combout\ = (\debounce_ps2_clk|counter_out\(5) & (!\debounce_ps2_clk|Add0~9\)) # (!\debounce_ps2_clk|counter_out\(5) & ((\debounce_ps2_clk|Add0~9\) # (GND)))
-- \debounce_ps2_clk|Add0~11\ = CARRY((!\debounce_ps2_clk|Add0~9\) # (!\debounce_ps2_clk|counter_out\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_clk|counter_out\(5),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~9\,
	combout => \debounce_ps2_clk|Add0~10_combout\,
	cout => \debounce_ps2_clk|Add0~11\);

-- Location: LCCOMB_X23_Y7_N2
\debounce_ps2_clk|counter_out[5]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[5]~4_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(5)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~10_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(5),
	datad => \debounce_ps2_clk|Add0~10_combout\,
	combout => \debounce_ps2_clk|counter_out[5]~4_combout\);

-- Location: FF_X23_Y7_N3
\debounce_ps2_clk|counter_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(5));

-- Location: LCCOMB_X23_Y7_N24
\debounce_ps2_clk|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~12_combout\ = (\debounce_ps2_clk|counter_out\(6) & (\debounce_ps2_clk|Add0~11\ $ (GND))) # (!\debounce_ps2_clk|counter_out\(6) & (!\debounce_ps2_clk|Add0~11\ & VCC))
-- \debounce_ps2_clk|Add0~13\ = CARRY((\debounce_ps2_clk|counter_out\(6) & !\debounce_ps2_clk|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_clk|counter_out\(6),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~11\,
	combout => \debounce_ps2_clk|Add0~12_combout\,
	cout => \debounce_ps2_clk|Add0~13\);

-- Location: LCCOMB_X23_Y7_N8
\debounce_ps2_clk|counter_out[6]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[6]~3_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(6)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~12_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(6),
	datad => \debounce_ps2_clk|Add0~12_combout\,
	combout => \debounce_ps2_clk|counter_out[6]~3_combout\);

-- Location: FF_X23_Y7_N9
\debounce_ps2_clk|counter_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[6]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(6));

-- Location: LCCOMB_X23_Y7_N26
\debounce_ps2_clk|Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~14_combout\ = (\debounce_ps2_clk|counter_out\(7) & (!\debounce_ps2_clk|Add0~13\)) # (!\debounce_ps2_clk|counter_out\(7) & ((\debounce_ps2_clk|Add0~13\) # (GND)))
-- \debounce_ps2_clk|Add0~15\ = CARRY((!\debounce_ps2_clk|Add0~13\) # (!\debounce_ps2_clk|counter_out\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|counter_out\(7),
	datad => VCC,
	cin => \debounce_ps2_clk|Add0~13\,
	combout => \debounce_ps2_clk|Add0~14_combout\,
	cout => \debounce_ps2_clk|Add0~15\);

-- Location: LCCOMB_X23_Y7_N30
\debounce_ps2_clk|counter_out[7]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out[7]~2_combout\ = (\debounce_ps2_clk|result~1_combout\ & ((\debounce_ps2_clk|counter_out\(7)) # ((\debounce_ps2_clk|counter_out[0]~1_combout\ & \debounce_ps2_clk|Add0~14_combout\)))) # (!\debounce_ps2_clk|result~1_combout\ & 
-- (\debounce_ps2_clk|counter_out[0]~1_combout\ & ((\debounce_ps2_clk|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|result~1_combout\,
	datab => \debounce_ps2_clk|counter_out[0]~1_combout\,
	datac => \debounce_ps2_clk|counter_out\(7),
	datad => \debounce_ps2_clk|Add0~14_combout\,
	combout => \debounce_ps2_clk|counter_out[7]~2_combout\);

-- Location: FF_X23_Y7_N31
\debounce_ps2_clk|counter_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(7));

-- Location: LCCOMB_X23_Y7_N28
\debounce_ps2_clk|Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|Add0~16_combout\ = \debounce_ps2_clk|counter_out\(8) $ (!\debounce_ps2_clk|Add0~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_clk|counter_out\(8),
	cin => \debounce_ps2_clk|Add0~15\,
	combout => \debounce_ps2_clk|Add0~16_combout\);

-- Location: LCCOMB_X23_Y7_N4
\debounce_ps2_clk|counter_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|counter_out~0_combout\ = (\debounce_ps2_clk|counter_out\(8) & (\debounce_ps2_clk|flipflops\(0) $ ((!\debounce_ps2_clk|flipflops\(1))))) # (!\debounce_ps2_clk|counter_out\(8) & (\debounce_ps2_clk|Add0~16_combout\ & 
-- (\debounce_ps2_clk|flipflops\(0) $ (!\debounce_ps2_clk|flipflops\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|flipflops\(0),
	datab => \debounce_ps2_clk|flipflops\(1),
	datac => \debounce_ps2_clk|counter_out\(8),
	datad => \debounce_ps2_clk|Add0~16_combout\,
	combout => \debounce_ps2_clk|counter_out~0_combout\);

-- Location: FF_X23_Y7_N5
\debounce_ps2_clk|counter_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|counter_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|counter_out\(8));

-- Location: LCCOMB_X22_Y7_N30
\debounce_ps2_clk|result~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|result~0_combout\ = (\debounce_ps2_clk|counter_out\(8) & ((\debounce_ps2_clk|flipflops\(1) & ((\debounce_ps2_clk|flipflops\(0)) # (\debounce_ps2_clk|result~q\))) # (!\debounce_ps2_clk|flipflops\(1) & (\debounce_ps2_clk|flipflops\(0) & 
-- \debounce_ps2_clk|result~q\)))) # (!\debounce_ps2_clk|counter_out\(8) & (((\debounce_ps2_clk|result~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_clk|counter_out\(8),
	datab => \debounce_ps2_clk|flipflops\(1),
	datac => \debounce_ps2_clk|flipflops\(0),
	datad => \debounce_ps2_clk|result~q\,
	combout => \debounce_ps2_clk|result~0_combout\);

-- Location: LCCOMB_X22_Y7_N20
\debounce_ps2_clk|result~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_clk|result~feeder_combout\ = \debounce_ps2_clk|result~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_ps2_clk|result~0_combout\,
	combout => \debounce_ps2_clk|result~feeder_combout\);

-- Location: FF_X22_Y7_N21
\debounce_ps2_clk|result\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_clk|result~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_clk|result~q\);

-- Location: LCCOMB_X23_Y23_N18
\count_idle[6]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[6]~25_combout\ = (count_idle(6) & (\count_idle[5]~24\ $ (GND))) # (!count_idle(6) & (!\count_idle[5]~24\ & VCC))
-- \count_idle[6]~26\ = CARRY((count_idle(6) & !\count_idle[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_idle(6),
	datad => VCC,
	cin => \count_idle[5]~24\,
	combout => \count_idle[6]~25_combout\,
	cout => \count_idle[6]~26\);

-- Location: LCCOMB_X23_Y23_N20
\count_idle[7]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[7]~27_combout\ = (count_idle(7) & (!\count_idle[6]~26\)) # (!count_idle(7) & ((\count_idle[6]~26\) # (GND)))
-- \count_idle[7]~28\ = CARRY((!\count_idle[6]~26\) # (!count_idle(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(7),
	datad => VCC,
	cin => \count_idle[6]~26\,
	combout => \count_idle[7]~27_combout\,
	cout => \count_idle[7]~28\);

-- Location: FF_X23_Y23_N21
\count_idle[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[7]~27_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(7));

-- Location: LCCOMB_X23_Y23_N22
\count_idle[8]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[8]~29_combout\ = (count_idle(8) & (\count_idle[7]~28\ $ (GND))) # (!count_idle(8) & (!\count_idle[7]~28\ & VCC))
-- \count_idle[8]~30\ = CARRY((count_idle(8) & !\count_idle[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(8),
	datad => VCC,
	cin => \count_idle[7]~28\,
	combout => \count_idle[8]~29_combout\,
	cout => \count_idle[8]~30\);

-- Location: FF_X23_Y23_N23
\count_idle[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[8]~29_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(8));

-- Location: LCCOMB_X23_Y23_N24
\count_idle[9]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[9]~31_combout\ = (count_idle(9) & (!\count_idle[8]~30\)) # (!count_idle(9) & ((\count_idle[8]~30\) # (GND)))
-- \count_idle[9]~32\ = CARRY((!\count_idle[8]~30\) # (!count_idle(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(9),
	datad => VCC,
	cin => \count_idle[8]~30\,
	combout => \count_idle[9]~31_combout\,
	cout => \count_idle[9]~32\);

-- Location: FF_X23_Y23_N25
\count_idle[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[9]~31_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(9));

-- Location: LCCOMB_X23_Y23_N26
\count_idle[10]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[10]~33_combout\ = (count_idle(10) & (\count_idle[9]~32\ $ (GND))) # (!count_idle(10) & (!\count_idle[9]~32\ & VCC))
-- \count_idle[10]~34\ = CARRY((count_idle(10) & !\count_idle[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_idle(10),
	datad => VCC,
	cin => \count_idle[9]~32\,
	combout => \count_idle[10]~33_combout\,
	cout => \count_idle[10]~34\);

-- Location: FF_X23_Y23_N27
\count_idle[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[10]~33_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(10));

-- Location: LCCOMB_X23_Y23_N28
\count_idle[11]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[11]~35_combout\ = \count_idle[10]~34\ $ (count_idle(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count_idle(11),
	cin => \count_idle[10]~34\,
	combout => \count_idle[11]~35_combout\);

-- Location: FF_X23_Y23_N29
\count_idle[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[11]~35_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(11));

-- Location: LCCOMB_X23_Y23_N4
\Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!count_idle(8) & (count_idle(9) & (!count_idle(10) & count_idle(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(8),
	datab => count_idle(9),
	datac => count_idle(10),
	datad => count_idle(11),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X23_Y23_N0
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (count_idle(3) & (!count_idle(1) & (count_idle(0) & !count_idle(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(3),
	datab => count_idle(1),
	datac => count_idle(0),
	datad => count_idle(2),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X23_Y23_N2
\count_idle[10]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[10]~14_combout\ = (((!\Equal0~0_combout\) # (!\Equal0~2_combout\)) # (!\debounce_ps2_clk|result~q\)) # (!\Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \debounce_ps2_clk|result~q\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \count_idle[10]~14_combout\);

-- Location: FF_X23_Y23_N7
\count_idle[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[0]~12_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(0));

-- Location: LCCOMB_X23_Y23_N8
\count_idle[1]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[1]~15_combout\ = (count_idle(1) & (!\count_idle[0]~13\)) # (!count_idle(1) & ((\count_idle[0]~13\) # (GND)))
-- \count_idle[1]~16\ = CARRY((!\count_idle[0]~13\) # (!count_idle(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_idle(1),
	datad => VCC,
	cin => \count_idle[0]~13\,
	combout => \count_idle[1]~15_combout\,
	cout => \count_idle[1]~16\);

-- Location: FF_X23_Y23_N9
\count_idle[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[1]~15_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(1));

-- Location: LCCOMB_X23_Y23_N10
\count_idle[2]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[2]~17_combout\ = (count_idle(2) & (\count_idle[1]~16\ $ (GND))) # (!count_idle(2) & (!\count_idle[1]~16\ & VCC))
-- \count_idle[2]~18\ = CARRY((count_idle(2) & !\count_idle[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(2),
	datad => VCC,
	cin => \count_idle[1]~16\,
	combout => \count_idle[2]~17_combout\,
	cout => \count_idle[2]~18\);

-- Location: FF_X23_Y23_N11
\count_idle[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[2]~17_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(2));

-- Location: LCCOMB_X23_Y23_N12
\count_idle[3]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[3]~19_combout\ = (count_idle(3) & (!\count_idle[2]~18\)) # (!count_idle(3) & ((\count_idle[2]~18\) # (GND)))
-- \count_idle[3]~20\ = CARRY((!\count_idle[2]~18\) # (!count_idle(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(3),
	datad => VCC,
	cin => \count_idle[2]~18\,
	combout => \count_idle[3]~19_combout\,
	cout => \count_idle[3]~20\);

-- Location: FF_X23_Y23_N13
\count_idle[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[3]~19_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(3));

-- Location: LCCOMB_X23_Y23_N14
\count_idle[4]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[4]~21_combout\ = (count_idle(4) & (\count_idle[3]~20\ $ (GND))) # (!count_idle(4) & (!\count_idle[3]~20\ & VCC))
-- \count_idle[4]~22\ = CARRY((count_idle(4) & !\count_idle[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_idle(4),
	datad => VCC,
	cin => \count_idle[3]~20\,
	combout => \count_idle[4]~21_combout\,
	cout => \count_idle[4]~22\);

-- Location: FF_X23_Y23_N15
\count_idle[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[4]~21_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(4));

-- Location: LCCOMB_X23_Y23_N16
\count_idle[5]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \count_idle[5]~23_combout\ = (count_idle(5) & (!\count_idle[4]~22\)) # (!count_idle(5) & ((\count_idle[4]~22\) # (GND)))
-- \count_idle[5]~24\ = CARRY((!\count_idle[4]~22\) # (!count_idle(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_idle(5),
	datad => VCC,
	cin => \count_idle[4]~22\,
	combout => \count_idle[5]~23_combout\,
	cout => \count_idle[5]~24\);

-- Location: FF_X23_Y23_N17
\count_idle[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[5]~23_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(5));

-- Location: FF_X23_Y23_N19
\count_idle[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_idle[6]~25_combout\,
	sclr => \debounce_ps2_clk|ALT_INV_result~q\,
	ena => \count_idle[10]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_idle(6));

-- Location: LCCOMB_X23_Y23_N30
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (count_idle(6) & (!count_idle(5) & (count_idle(4) & count_idle(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_idle(6),
	datab => count_idle(5),
	datac => count_idle(4),
	datad => count_idle(7),
	combout => \Equal0~1_combout\);

-- Location: CLKCTRL_G16
\debounce_ps2_clk|result~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \debounce_ps2_clk|result~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \debounce_ps2_clk|result~clkctrl_outclk\);

-- Location: IOIBUF_X41_Y12_N22
\ps2_data~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ps2_data,
	o => \ps2_data~input_o\);

-- Location: FF_X22_Y22_N23
\sync_ffs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ps2_data~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sync_ffs(1));

-- Location: FF_X22_Y22_N7
\debounce_ps2_data|flipflops[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => sync_ffs(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|flipflops\(0));

-- Location: LCCOMB_X22_Y22_N12
\debounce_ps2_data|flipflops[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|flipflops[1]~feeder_combout\ = \debounce_ps2_data|flipflops\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_ps2_data|flipflops\(0),
	combout => \debounce_ps2_data|flipflops[1]~feeder_combout\);

-- Location: FF_X22_Y22_N13
\debounce_ps2_data|flipflops[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|flipflops[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|flipflops\(1));

-- Location: LCCOMB_X22_Y22_N14
\debounce_ps2_data|result~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|result~1_combout\ = (\debounce_ps2_data|counter_out\(8) & (\debounce_ps2_data|flipflops\(1) $ (!\debounce_ps2_data|flipflops\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|flipflops\(1),
	datab => \debounce_ps2_data|counter_out\(8),
	datac => \debounce_ps2_data|flipflops\(0),
	combout => \debounce_ps2_data|result~1_combout\);

-- Location: LCCOMB_X22_Y22_N6
\debounce_ps2_data|counter_out[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[0]~1_combout\ = (!\debounce_ps2_data|counter_out\(8) & (\debounce_ps2_data|flipflops\(0) $ (!\debounce_ps2_data|flipflops\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_data|counter_out\(8),
	datac => \debounce_ps2_data|flipflops\(0),
	datad => \debounce_ps2_data|flipflops\(1),
	combout => \debounce_ps2_data|counter_out[0]~1_combout\);

-- Location: LCCOMB_X23_Y22_N6
\debounce_ps2_data|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~0_combout\ = \debounce_ps2_data|counter_out\(0) $ (VCC)
-- \debounce_ps2_data|Add0~1\ = CARRY(\debounce_ps2_data|counter_out\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|counter_out\(0),
	datad => VCC,
	combout => \debounce_ps2_data|Add0~0_combout\,
	cout => \debounce_ps2_data|Add0~1\);

-- Location: LCCOMB_X23_Y22_N26
\debounce_ps2_data|counter_out[0]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[0]~9_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(0)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~0_combout\)))) # (!\debounce_ps2_data|result~1_combout\ 
-- & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(0),
	datad => \debounce_ps2_data|Add0~0_combout\,
	combout => \debounce_ps2_data|counter_out[0]~9_combout\);

-- Location: FF_X23_Y22_N27
\debounce_ps2_data|counter_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(0));

-- Location: LCCOMB_X23_Y22_N8
\debounce_ps2_data|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~2_combout\ = (\debounce_ps2_data|counter_out\(1) & (!\debounce_ps2_data|Add0~1\)) # (!\debounce_ps2_data|counter_out\(1) & ((\debounce_ps2_data|Add0~1\) # (GND)))
-- \debounce_ps2_data|Add0~3\ = CARRY((!\debounce_ps2_data|Add0~1\) # (!\debounce_ps2_data|counter_out\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_data|counter_out\(1),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~1\,
	combout => \debounce_ps2_data|Add0~2_combout\,
	cout => \debounce_ps2_data|Add0~3\);

-- Location: LCCOMB_X23_Y22_N0
\debounce_ps2_data|counter_out[1]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[1]~8_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(1)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~2_combout\)))) # (!\debounce_ps2_data|result~1_combout\ 
-- & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(1),
	datad => \debounce_ps2_data|Add0~2_combout\,
	combout => \debounce_ps2_data|counter_out[1]~8_combout\);

-- Location: FF_X23_Y22_N1
\debounce_ps2_data|counter_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(1));

-- Location: LCCOMB_X23_Y22_N10
\debounce_ps2_data|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~4_combout\ = (\debounce_ps2_data|counter_out\(2) & (\debounce_ps2_data|Add0~3\ $ (GND))) # (!\debounce_ps2_data|counter_out\(2) & (!\debounce_ps2_data|Add0~3\ & VCC))
-- \debounce_ps2_data|Add0~5\ = CARRY((\debounce_ps2_data|counter_out\(2) & !\debounce_ps2_data|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_data|counter_out\(2),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~3\,
	combout => \debounce_ps2_data|Add0~4_combout\,
	cout => \debounce_ps2_data|Add0~5\);

-- Location: LCCOMB_X23_Y22_N2
\debounce_ps2_data|counter_out[2]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[2]~7_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(2)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~4_combout\)))) # (!\debounce_ps2_data|result~1_combout\ 
-- & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(2),
	datad => \debounce_ps2_data|Add0~4_combout\,
	combout => \debounce_ps2_data|counter_out[2]~7_combout\);

-- Location: FF_X23_Y22_N3
\debounce_ps2_data|counter_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(2));

-- Location: LCCOMB_X23_Y22_N12
\debounce_ps2_data|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~6_combout\ = (\debounce_ps2_data|counter_out\(3) & (!\debounce_ps2_data|Add0~5\)) # (!\debounce_ps2_data|counter_out\(3) & ((\debounce_ps2_data|Add0~5\) # (GND)))
-- \debounce_ps2_data|Add0~7\ = CARRY((!\debounce_ps2_data|Add0~5\) # (!\debounce_ps2_data|counter_out\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_data|counter_out\(3),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~5\,
	combout => \debounce_ps2_data|Add0~6_combout\,
	cout => \debounce_ps2_data|Add0~7\);

-- Location: LCCOMB_X23_Y22_N28
\debounce_ps2_data|counter_out[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[3]~6_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(3)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~6_combout\)))) # (!\debounce_ps2_data|result~1_combout\ 
-- & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(3),
	datad => \debounce_ps2_data|Add0~6_combout\,
	combout => \debounce_ps2_data|counter_out[3]~6_combout\);

-- Location: FF_X23_Y22_N29
\debounce_ps2_data|counter_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(3));

-- Location: LCCOMB_X23_Y22_N14
\debounce_ps2_data|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~8_combout\ = (\debounce_ps2_data|counter_out\(4) & (\debounce_ps2_data|Add0~7\ $ (GND))) # (!\debounce_ps2_data|counter_out\(4) & (!\debounce_ps2_data|Add0~7\ & VCC))
-- \debounce_ps2_data|Add0~9\ = CARRY((\debounce_ps2_data|counter_out\(4) & !\debounce_ps2_data|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|counter_out\(4),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~7\,
	combout => \debounce_ps2_data|Add0~8_combout\,
	cout => \debounce_ps2_data|Add0~9\);

-- Location: LCCOMB_X22_Y22_N16
\debounce_ps2_data|counter_out[4]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[4]~5_combout\ = (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~8_combout\) # ((\debounce_ps2_data|result~1_combout\ & \debounce_ps2_data|counter_out\(4))))) # 
-- (!\debounce_ps2_data|counter_out[0]~1_combout\ & (\debounce_ps2_data|result~1_combout\ & (\debounce_ps2_data|counter_out\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|counter_out[0]~1_combout\,
	datab => \debounce_ps2_data|result~1_combout\,
	datac => \debounce_ps2_data|counter_out\(4),
	datad => \debounce_ps2_data|Add0~8_combout\,
	combout => \debounce_ps2_data|counter_out[4]~5_combout\);

-- Location: FF_X22_Y22_N17
\debounce_ps2_data|counter_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[4]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(4));

-- Location: LCCOMB_X23_Y22_N16
\debounce_ps2_data|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~10_combout\ = (\debounce_ps2_data|counter_out\(5) & (!\debounce_ps2_data|Add0~9\)) # (!\debounce_ps2_data|counter_out\(5) & ((\debounce_ps2_data|Add0~9\) # (GND)))
-- \debounce_ps2_data|Add0~11\ = CARRY((!\debounce_ps2_data|Add0~9\) # (!\debounce_ps2_data|counter_out\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_data|counter_out\(5),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~9\,
	combout => \debounce_ps2_data|Add0~10_combout\,
	cout => \debounce_ps2_data|Add0~11\);

-- Location: LCCOMB_X23_Y22_N24
\debounce_ps2_data|counter_out[5]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[5]~4_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(5)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~10_combout\)))) # 
-- (!\debounce_ps2_data|result~1_combout\ & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(5),
	datad => \debounce_ps2_data|Add0~10_combout\,
	combout => \debounce_ps2_data|counter_out[5]~4_combout\);

-- Location: FF_X23_Y22_N25
\debounce_ps2_data|counter_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(5));

-- Location: LCCOMB_X23_Y22_N18
\debounce_ps2_data|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~12_combout\ = (\debounce_ps2_data|counter_out\(6) & (\debounce_ps2_data|Add0~11\ $ (GND))) # (!\debounce_ps2_data|counter_out\(6) & (!\debounce_ps2_data|Add0~11\ & VCC))
-- \debounce_ps2_data|Add0~13\ = CARRY((\debounce_ps2_data|counter_out\(6) & !\debounce_ps2_data|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|counter_out\(6),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~11\,
	combout => \debounce_ps2_data|Add0~12_combout\,
	cout => \debounce_ps2_data|Add0~13\);

-- Location: LCCOMB_X23_Y22_N30
\debounce_ps2_data|counter_out[6]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[6]~3_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(6)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~12_combout\)))) # 
-- (!\debounce_ps2_data|result~1_combout\ & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(6),
	datad => \debounce_ps2_data|Add0~12_combout\,
	combout => \debounce_ps2_data|counter_out[6]~3_combout\);

-- Location: FF_X23_Y22_N31
\debounce_ps2_data|counter_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[6]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(6));

-- Location: LCCOMB_X23_Y22_N20
\debounce_ps2_data|Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~14_combout\ = (\debounce_ps2_data|counter_out\(7) & (!\debounce_ps2_data|Add0~13\)) # (!\debounce_ps2_data|counter_out\(7) & ((\debounce_ps2_data|Add0~13\) # (GND)))
-- \debounce_ps2_data|Add0~15\ = CARRY((!\debounce_ps2_data|Add0~13\) # (!\debounce_ps2_data|counter_out\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_ps2_data|counter_out\(7),
	datad => VCC,
	cin => \debounce_ps2_data|Add0~13\,
	combout => \debounce_ps2_data|Add0~14_combout\,
	cout => \debounce_ps2_data|Add0~15\);

-- Location: LCCOMB_X23_Y22_N4
\debounce_ps2_data|counter_out[7]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out[7]~2_combout\ = (\debounce_ps2_data|result~1_combout\ & ((\debounce_ps2_data|counter_out\(7)) # ((\debounce_ps2_data|counter_out[0]~1_combout\ & \debounce_ps2_data|Add0~14_combout\)))) # 
-- (!\debounce_ps2_data|result~1_combout\ & (\debounce_ps2_data|counter_out[0]~1_combout\ & ((\debounce_ps2_data|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|result~1_combout\,
	datab => \debounce_ps2_data|counter_out[0]~1_combout\,
	datac => \debounce_ps2_data|counter_out\(7),
	datad => \debounce_ps2_data|Add0~14_combout\,
	combout => \debounce_ps2_data|counter_out[7]~2_combout\);

-- Location: FF_X23_Y22_N5
\debounce_ps2_data|counter_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out[7]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(7));

-- Location: LCCOMB_X23_Y22_N22
\debounce_ps2_data|Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|Add0~16_combout\ = \debounce_ps2_data|Add0~15\ $ (!\debounce_ps2_data|counter_out\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debounce_ps2_data|counter_out\(8),
	cin => \debounce_ps2_data|Add0~15\,
	combout => \debounce_ps2_data|Add0~16_combout\);

-- Location: LCCOMB_X22_Y22_N24
\debounce_ps2_data|counter_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|counter_out~0_combout\ = (\debounce_ps2_data|counter_out\(8) & (\debounce_ps2_data|flipflops\(1) $ ((!\debounce_ps2_data|flipflops\(0))))) # (!\debounce_ps2_data|counter_out\(8) & (\debounce_ps2_data|Add0~16_combout\ & 
-- (\debounce_ps2_data|flipflops\(1) $ (!\debounce_ps2_data|flipflops\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|flipflops\(1),
	datab => \debounce_ps2_data|flipflops\(0),
	datac => \debounce_ps2_data|counter_out\(8),
	datad => \debounce_ps2_data|Add0~16_combout\,
	combout => \debounce_ps2_data|counter_out~0_combout\);

-- Location: FF_X22_Y22_N25
\debounce_ps2_data|counter_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|counter_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|counter_out\(8));

-- Location: LCCOMB_X22_Y23_N12
\debounce_ps2_data|result~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_ps2_data|result~0_combout\ = (\debounce_ps2_data|counter_out\(8) & ((\debounce_ps2_data|flipflops\(1) & ((\debounce_ps2_data|result~q\) # (\debounce_ps2_data|flipflops\(0)))) # (!\debounce_ps2_data|flipflops\(1) & (\debounce_ps2_data|result~q\ & 
-- \debounce_ps2_data|flipflops\(0))))) # (!\debounce_ps2_data|counter_out\(8) & (((\debounce_ps2_data|result~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_ps2_data|counter_out\(8),
	datab => \debounce_ps2_data|flipflops\(1),
	datac => \debounce_ps2_data|result~q\,
	datad => \debounce_ps2_data|flipflops\(0),
	combout => \debounce_ps2_data|result~0_combout\);

-- Location: FF_X22_Y23_N13
\debounce_ps2_data|result\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_ps2_data|result~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_ps2_data|result~q\);

-- Location: LCCOMB_X22_Y23_N2
\ps2_word[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[10]~feeder_combout\ = \debounce_ps2_data|result~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce_ps2_data|result~q\,
	combout => \ps2_word[10]~feeder_combout\);

-- Location: FF_X22_Y23_N3
\ps2_word[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(10));

-- Location: LCCOMB_X22_Y23_N26
\ps2_word[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[9]~feeder_combout\ = ps2_word(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(10),
	combout => \ps2_word[9]~feeder_combout\);

-- Location: FF_X22_Y23_N27
\ps2_word[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(9));

-- Location: LCCOMB_X22_Y23_N6
\ps2_word[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[8]~feeder_combout\ = ps2_word(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ps2_word(9),
	combout => \ps2_word[8]~feeder_combout\);

-- Location: FF_X22_Y23_N7
\ps2_word[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(8));

-- Location: LCCOMB_X22_Y23_N16
\ps2_word[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[7]~feeder_combout\ = ps2_word(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(8),
	combout => \ps2_word[7]~feeder_combout\);

-- Location: FF_X22_Y23_N17
\ps2_word[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(7));

-- Location: LCCOMB_X22_Y23_N14
\ps2_word[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[6]~feeder_combout\ = ps2_word(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(7),
	combout => \ps2_word[6]~feeder_combout\);

-- Location: FF_X22_Y23_N15
\ps2_word[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(6));

-- Location: LCCOMB_X22_Y23_N28
\ps2_word[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[5]~feeder_combout\ = ps2_word(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ps2_word(6),
	combout => \ps2_word[5]~feeder_combout\);

-- Location: FF_X22_Y23_N29
\ps2_word[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(5));

-- Location: LCCOMB_X22_Y23_N30
\ps2_word[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[4]~feeder_combout\ = ps2_word(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(5),
	combout => \ps2_word[4]~feeder_combout\);

-- Location: FF_X22_Y23_N31
\ps2_word[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(4));

-- Location: LCCOMB_X22_Y23_N0
\ps2_word[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[3]~feeder_combout\ = ps2_word(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(4),
	combout => \ps2_word[3]~feeder_combout\);

-- Location: FF_X22_Y23_N1
\ps2_word[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(3));

-- Location: LCCOMB_X22_Y23_N18
\ps2_word[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[2]~feeder_combout\ = ps2_word(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(3),
	combout => \ps2_word[2]~feeder_combout\);

-- Location: FF_X22_Y23_N19
\ps2_word[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(2));

-- Location: LCCOMB_X22_Y23_N8
\ps2_word[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_word[1]~feeder_combout\ = ps2_word(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_word(2),
	combout => \ps2_word[1]~feeder_combout\);

-- Location: FF_X22_Y23_N9
\ps2_word[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	d => \ps2_word[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(1));

-- Location: LCCOMB_X22_Y23_N20
\error~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \error~0_combout\ = ps2_word(4) $ (ps2_word(2) $ (ps2_word(1) $ (ps2_word(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_word(4),
	datab => ps2_word(2),
	datac => ps2_word(1),
	datad => ps2_word(3),
	combout => \error~0_combout\);

-- Location: FF_X22_Y23_N5
\ps2_word[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_ps2_clk|ALT_INV_result~clkctrl_outclk\,
	asdata => ps2_word(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_word(0));

-- Location: LCCOMB_X22_Y23_N4
\process_2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \process_2~0_combout\ = (!ps2_word(0) & ps2_word(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ps2_word(0),
	datad => ps2_word(10),
	combout => \process_2~0_combout\);

-- Location: LCCOMB_X22_Y23_N24
\error~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \error~1_combout\ = ps2_word(8) $ (ps2_word(5) $ (ps2_word(6) $ (ps2_word(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_word(8),
	datab => ps2_word(5),
	datac => ps2_word(6),
	datad => ps2_word(7),
	combout => \error~1_combout\);

-- Location: LCCOMB_X22_Y23_N22
\process_2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \process_2~1_combout\ = (\process_2~0_combout\ & (ps2_word(9) $ (\error~0_combout\ $ (\error~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_word(9),
	datab => \error~0_combout\,
	datac => \process_2~0_combout\,
	datad => \error~1_combout\,
	combout => \process_2~1_combout\);

-- Location: LCCOMB_X21_Y23_N30
\process_2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \process_2~2_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\Equal0~2_combout\ & \process_2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~2_combout\,
	datad => \process_2~1_combout\,
	combout => \process_2~2_combout\);

-- Location: FF_X21_Y23_N31
ps2_code_new : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2_code_new~q\);

-- Location: CLKCTRL_G11
\ps2_code_new~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ps2_code_new~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ps2_code_new~clkctrl_outclk\);

-- Location: FF_X21_Y23_N9
\ps2_code[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(2),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(1));

-- Location: LCCOMB_X19_Y23_N6
\ps2_code_old1[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old1[1]~feeder_combout\ = ps2_code(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code(1),
	combout => \ps2_code_old1[1]~feeder_combout\);

-- Location: FF_X19_Y23_N7
\ps2_code_old1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old1[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(1));

-- Location: FF_X21_Y23_N17
\ps2_code[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(1),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(0));

-- Location: LCCOMB_X19_Y23_N14
\ps2_code_old1[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old1[0]~feeder_combout\ = ps2_code(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code(0),
	combout => \ps2_code_old1[0]~feeder_combout\);

-- Location: FF_X19_Y23_N15
\ps2_code_old1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old1[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(0));

-- Location: FF_X21_Y23_N15
\ps2_code[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(3),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(2));

-- Location: FF_X19_Y23_N17
\ps2_code_old1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	asdata => ps2_code(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(2));

-- Location: FF_X21_Y23_N1
\ps2_code[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(8),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(7));

-- Location: LCCOMB_X19_Y23_N0
\ps2_code_old1[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old1[7]~feeder_combout\ = ps2_code(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ps2_code(7),
	combout => \ps2_code_old1[7]~feeder_combout\);

-- Location: FF_X19_Y23_N1
\ps2_code_old1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old1[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(7));

-- Location: FF_X21_Y23_N19
\ps2_code[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(4),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(3));

-- Location: LCCOMB_X19_Y23_N8
\ps2_code_old1[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old1[3]~feeder_combout\ = ps2_code(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ps2_code(3),
	combout => \ps2_code_old1[3]~feeder_combout\);

-- Location: FF_X19_Y23_N9
\ps2_code_old1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old1[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(3));

-- Location: FF_X21_Y23_N21
\ps2_code[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(7),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(6));

-- Location: FF_X19_Y23_N31
\ps2_code_old1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	asdata => ps2_code(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(6));

-- Location: FF_X21_Y23_N11
\ps2_code[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(6),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(5));

-- Location: LCCOMB_X19_Y23_N2
\ps2_code_old1[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old1[5]~feeder_combout\ = ps2_code(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code(5),
	combout => \ps2_code_old1[5]~feeder_combout\);

-- Location: FF_X19_Y23_N3
\ps2_code_old1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old1[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(5));

-- Location: LCCOMB_X19_Y23_N12
\Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (ps2_code_old1(7) & (!ps2_code_old1(3) & (ps2_code_old1(6) & ps2_code_old1(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code_old1(7),
	datab => ps2_code_old1(3),
	datac => ps2_code_old1(6),
	datad => ps2_code_old1(5),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X19_Y23_N16
\Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!ps2_code_old1(1) & (!ps2_code_old1(0) & (!ps2_code_old1(2) & \Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code_old1(1),
	datab => ps2_code_old1(0),
	datac => ps2_code_old1(2),
	datad => \Equal1~0_combout\,
	combout => \Equal1~1_combout\);

-- Location: FF_X21_Y23_N7
\ps2_code[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => ps2_word(5),
	sload => VCC,
	ena => \process_2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code(4));

-- Location: FF_X19_Y23_N23
\ps2_code_old1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	asdata => ps2_code(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old1(4));

-- Location: LCCOMB_X19_Y23_N4
\ps2_code_old2[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old2[4]~feeder_combout\ = ps2_code_old1(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code_old1(4),
	combout => \ps2_code_old2[4]~feeder_combout\);

-- Location: FF_X19_Y23_N5
\ps2_code_old2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old2[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(4));

-- Location: FF_X19_Y23_N13
\ps2_code_old2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	asdata => ps2_code_old1(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(6));

-- Location: FF_X19_Y23_N11
\ps2_code_old2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	asdata => ps2_code_old1(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(5));

-- Location: LCCOMB_X19_Y23_N18
\ps2_code_old2[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old2[7]~feeder_combout\ = ps2_code_old1(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code_old1(7),
	combout => \ps2_code_old2[7]~feeder_combout\);

-- Location: FF_X19_Y23_N19
\ps2_code_old2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old2[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(7));

-- Location: LCCOMB_X19_Y23_N10
\Equal3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!ps2_code_old2(4) & (ps2_code_old2(6) & (ps2_code_old2(5) & ps2_code_old2(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code_old2(4),
	datab => ps2_code_old2(6),
	datac => ps2_code_old2(5),
	datad => ps2_code_old2(7),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X19_Y23_N26
\ps2_code_old2[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old2[3]~feeder_combout\ = ps2_code_old1(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code_old1(3),
	combout => \ps2_code_old2[3]~feeder_combout\);

-- Location: FF_X19_Y23_N27
\ps2_code_old2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old2[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(3));

-- Location: LCCOMB_X19_Y23_N20
\ps2_code_old2[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old2[2]~feeder_combout\ = ps2_code_old1(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code_old1(2),
	combout => \ps2_code_old2[2]~feeder_combout\);

-- Location: FF_X19_Y23_N21
\ps2_code_old2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old2[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(2));

-- Location: FF_X19_Y23_N29
\ps2_code_old2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	asdata => ps2_code_old1(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(0));

-- Location: LCCOMB_X19_Y23_N24
\ps2_code_old2[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ps2_code_old2[1]~feeder_combout\ = ps2_code_old1(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => ps2_code_old1(1),
	combout => \ps2_code_old2[1]~feeder_combout\);

-- Location: FF_X19_Y23_N25
\ps2_code_old2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \ps2_code_old2[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ps2_code_old2(1));

-- Location: LCCOMB_X19_Y23_N28
\Equal3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (!ps2_code_old2(3) & (!ps2_code_old2(2) & (!ps2_code_old2(0) & !ps2_code_old2(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code_old2(3),
	datab => ps2_code_old2(2),
	datac => ps2_code_old2(0),
	datad => ps2_code_old2(1),
	combout => \Equal3~1_combout\);

-- Location: LCCOMB_X21_Y23_N18
\snake1Left~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Left~2_combout\ = (ps2_code(3) & (!ps2_code(6) & ((!\Equal3~1_combout\) # (!\Equal3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \Equal3~1_combout\,
	datac => ps2_code(3),
	datad => ps2_code(6),
	combout => \snake1Left~2_combout\);

-- Location: LCCOMB_X21_Y23_N10
\snake1Left~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Left~3_combout\ = (ps2_code(4) & (!ps2_code(7) & (!ps2_code(5) & \snake1Left~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(4),
	datab => ps2_code(7),
	datac => ps2_code(5),
	datad => \snake1Left~2_combout\,
	combout => \snake1Left~3_combout\);

-- Location: LCCOMB_X21_Y23_N26
\snake1Up~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Up~3_combout\ = (!ps2_code(1) & (ps2_code(0) & (ps2_code(2) & \snake1Left~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(1),
	datab => ps2_code(0),
	datac => ps2_code(2),
	datad => \snake1Left~3_combout\,
	combout => \snake1Up~3_combout\);

-- Location: LCCOMB_X20_Y23_N24
\snake1Up~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Up~2_combout\ = (\snake1Up~3_combout\ & (((!ps2_code_old1(4) & \snake1Up~reg0_q\)) # (!\Equal1~1_combout\))) # (!\snake1Up~3_combout\ & (((\snake1Up~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => ps2_code_old1(4),
	datac => \snake1Up~reg0_q\,
	datad => \snake1Up~3_combout\,
	combout => \snake1Up~2_combout\);

-- Location: FF_X20_Y23_N25
\snake1Up~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake1Up~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake1Up~reg0_q\);

-- Location: LCCOMB_X21_Y23_N4
\snake1Down~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Down~4_combout\ = (ps2_code(1) & (ps2_code(0) & (!ps2_code(2) & \snake1Left~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(1),
	datab => ps2_code(0),
	datac => ps2_code(2),
	datad => \snake1Left~3_combout\,
	combout => \snake1Down~4_combout\);

-- Location: LCCOMB_X20_Y23_N6
\snake1Down~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Down~3_combout\ = (\snake1Down~4_combout\ & (((!ps2_code_old1(4) & \snake1Down~reg0_q\)) # (!\Equal1~1_combout\))) # (!\snake1Down~4_combout\ & (((\snake1Down~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => ps2_code_old1(4),
	datac => \snake1Down~reg0_q\,
	datad => \snake1Down~4_combout\,
	combout => \snake1Down~3_combout\);

-- Location: FF_X20_Y23_N7
\snake1Down~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake1Down~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake1Down~reg0_q\);

-- Location: LCCOMB_X21_Y23_N12
\snake1Left~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Left~5_combout\ = (!ps2_code(1) & (!ps2_code(0) & (ps2_code(2) & \snake1Left~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(1),
	datab => ps2_code(0),
	datac => ps2_code(2),
	datad => \snake1Left~3_combout\,
	combout => \snake1Left~5_combout\);

-- Location: LCCOMB_X20_Y23_N8
\snake1Left~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Left~4_combout\ = (\snake1Left~5_combout\ & (((!ps2_code_old1(4) & \snake1Left~reg0_q\)) # (!\Equal1~1_combout\))) # (!\snake1Left~5_combout\ & (((\snake1Left~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => ps2_code_old1(4),
	datac => \snake1Left~reg0_q\,
	datad => \snake1Left~5_combout\,
	combout => \snake1Left~4_combout\);

-- Location: FF_X20_Y23_N9
\snake1Left~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake1Left~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake1Left~reg0_q\);

-- Location: LCCOMB_X21_Y23_N20
\snake1Special~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Special~0_combout\ = (!ps2_code(6) & ((!\Equal3~1_combout\) # (!\Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datac => ps2_code(6),
	datad => \Equal3~1_combout\,
	combout => \snake1Special~0_combout\);

-- Location: LCCOMB_X21_Y23_N8
\snake1Down~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Down~2_combout\ = (!ps2_code(2) & ps2_code(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ps2_code(2),
	datad => ps2_code(0),
	combout => \snake1Down~2_combout\);

-- Location: LCCOMB_X21_Y23_N0
\snake1Special~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Special~1_combout\ = (!ps2_code(4) & (ps2_code(5) & (!ps2_code(7) & \snake1Down~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(4),
	datab => ps2_code(5),
	datac => ps2_code(7),
	datad => \snake1Down~2_combout\,
	combout => \snake1Special~1_combout\);

-- Location: LCCOMB_X21_Y23_N22
\snake1Right~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Right~0_combout\ = (ps2_code(1) & (!ps2_code(3) & (\snake1Special~0_combout\ & \snake1Special~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(1),
	datab => ps2_code(3),
	datac => \snake1Special~0_combout\,
	datad => \snake1Special~1_combout\,
	combout => \snake1Right~0_combout\);

-- Location: LCCOMB_X20_Y23_N10
\snake1Right~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Right~1_combout\ = (\snake1Right~0_combout\ & (((!ps2_code_old1(4) & \snake1Right~reg0_q\)) # (!\Equal1~1_combout\))) # (!\snake1Right~0_combout\ & (((\snake1Right~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => ps2_code_old1(4),
	datac => \snake1Right~reg0_q\,
	datad => \snake1Right~0_combout\,
	combout => \snake1Right~1_combout\);

-- Location: FF_X20_Y23_N11
\snake1Right~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake1Right~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake1Right~reg0_q\);

-- Location: LCCOMB_X21_Y23_N2
\snake1Special~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Special~2_combout\ = (!ps2_code(1) & (ps2_code(3) & (\snake1Special~0_combout\ & \snake1Special~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(1),
	datab => ps2_code(3),
	datac => \snake1Special~0_combout\,
	datad => \snake1Special~1_combout\,
	combout => \snake1Special~2_combout\);

-- Location: LCCOMB_X20_Y23_N0
\snake1Special~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake1Special~3_combout\ = (\snake1Special~2_combout\ & (((!ps2_code_old1(4) & \snake1Special~reg0_q\)) # (!\Equal1~1_combout\))) # (!\snake1Special~2_combout\ & (((\snake1Special~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => ps2_code_old1(4),
	datac => \snake1Special~reg0_q\,
	datad => \snake1Special~2_combout\,
	combout => \snake1Special~3_combout\);

-- Location: FF_X20_Y23_N1
\snake1Special~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake1Special~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake1Special~reg0_q\);

-- Location: LCCOMB_X20_Y23_N28
\snake2Up~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Up~1_combout\ = (ps2_code(6) & (ps2_code(5) & ps2_code(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(6),
	datac => ps2_code(5),
	datad => ps2_code(0),
	combout => \snake2Up~1_combout\);

-- Location: LCCOMB_X19_Y23_N30
\Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (\Equal1~1_combout\ & !ps2_code_old1(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datad => ps2_code_old1(4),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X19_Y23_N22
\snake2Up~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Up~0_combout\ = (\Equal1~1_combout\ & (((\Equal3~0_combout\ & \Equal3~1_combout\)) # (!ps2_code_old1(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \Equal3~1_combout\,
	datac => ps2_code_old1(4),
	datad => \Equal1~1_combout\,
	combout => \snake2Up~0_combout\);

-- Location: LCCOMB_X21_Y23_N24
\snake2Up~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Up~3_combout\ = (!ps2_code(7) & (ps2_code(2) & (!ps2_code(3) & \snake2Up~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(7),
	datab => ps2_code(2),
	datac => ps2_code(3),
	datad => \snake2Up~0_combout\,
	combout => \snake2Up~3_combout\);

-- Location: LCCOMB_X21_Y23_N6
\snake2Up~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Up~4_combout\ = (!ps2_code(7) & (!ps2_code(1) & (ps2_code(4) & \snake2Up~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(7),
	datab => ps2_code(1),
	datac => ps2_code(4),
	datad => \snake2Up~3_combout\,
	combout => \snake2Up~4_combout\);

-- Location: LCCOMB_X20_Y23_N26
\snake2Up~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Up~2_combout\ = (\snake2Up~1_combout\ & ((\snake2Up~4_combout\ & (\Equal2~0_combout\)) # (!\snake2Up~4_combout\ & ((\snake2Up~reg0_q\))))) # (!\snake2Up~1_combout\ & (((\snake2Up~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \snake2Up~1_combout\,
	datab => \Equal2~0_combout\,
	datac => \snake2Up~reg0_q\,
	datad => \snake2Up~4_combout\,
	combout => \snake2Up~2_combout\);

-- Location: FF_X20_Y23_N27
\snake2Up~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake2Up~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake2Up~reg0_q\);

-- Location: LCCOMB_X20_Y23_N2
\snake2Right~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Right~0_combout\ = (!ps2_code(0) & (ps2_code(5) & ps2_code(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ps2_code(0),
	datac => ps2_code(5),
	datad => ps2_code(6),
	combout => \snake2Right~0_combout\);

-- Location: LCCOMB_X21_Y23_N14
\snake2Down~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Down~6_combout\ = (ps2_code(4) & (ps2_code(1) & (!ps2_code(2) & !ps2_code(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(4),
	datab => ps2_code(1),
	datac => ps2_code(2),
	datad => ps2_code(7),
	combout => \snake2Down~6_combout\);

-- Location: LCCOMB_X20_Y23_N12
\snake2Down~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Down~4_combout\ = (!ps2_code(3) & (((\Equal3~1_combout\ & \Equal3~0_combout\)) # (!ps2_code_old1(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~1_combout\,
	datab => ps2_code_old1(4),
	datac => ps2_code(3),
	datad => \Equal3~0_combout\,
	combout => \snake2Down~4_combout\);

-- Location: LCCOMB_X20_Y23_N18
\snake2Down~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Down~5_combout\ = (\Equal1~1_combout\ & (\snake2Right~0_combout\ & (\snake2Down~6_combout\ & \snake2Down~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \snake2Right~0_combout\,
	datac => \snake2Down~6_combout\,
	datad => \snake2Down~4_combout\,
	combout => \snake2Down~5_combout\);

-- Location: LCCOMB_X20_Y23_N16
\snake2Down~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Down~7_combout\ = (\snake2Down~5_combout\ & (\Equal1~1_combout\ & (!ps2_code_old1(4)))) # (!\snake2Down~5_combout\ & (((\snake2Down~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => ps2_code_old1(4),
	datac => \snake2Down~reg0_q\,
	datad => \snake2Down~5_combout\,
	combout => \snake2Down~7_combout\);

-- Location: FF_X20_Y23_N17
\snake2Down~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake2Down~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake2Down~reg0_q\);

-- Location: LCCOMB_X21_Y23_N28
\snake2Left~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Left~0_combout\ = (ps2_code(1) & (ps2_code(6) & (ps2_code(3) & \snake1Special~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(1),
	datab => ps2_code(6),
	datac => ps2_code(3),
	datad => \snake1Special~1_combout\,
	combout => \snake2Left~0_combout\);

-- Location: LCCOMB_X20_Y23_N30
\snake2Left~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Left~1_combout\ = (\snake2Up~0_combout\ & ((\snake2Left~0_combout\ & (\Equal2~0_combout\)) # (!\snake2Left~0_combout\ & ((\snake2Left~reg0_q\))))) # (!\snake2Up~0_combout\ & (((\snake2Left~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \snake2Up~0_combout\,
	datab => \Equal2~0_combout\,
	datac => \snake2Left~reg0_q\,
	datad => \snake2Left~0_combout\,
	combout => \snake2Left~1_combout\);

-- Location: FF_X20_Y23_N31
\snake2Left~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake2Left~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake2Left~reg0_q\);

-- Location: LCCOMB_X20_Y23_N4
\snake2Right~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Right~1_combout\ = (\snake2Right~0_combout\ & ((\snake2Up~4_combout\ & (\Equal2~0_combout\)) # (!\snake2Up~4_combout\ & ((\snake2Right~reg0_q\))))) # (!\snake2Right~0_combout\ & (((\snake2Right~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \snake2Right~0_combout\,
	datab => \Equal2~0_combout\,
	datac => \snake2Right~reg0_q\,
	datad => \snake2Up~4_combout\,
	combout => \snake2Right~1_combout\);

-- Location: FF_X20_Y23_N5
\snake2Right~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake2Right~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake2Right~reg0_q\);

-- Location: LCCOMB_X21_Y23_N16
\snake2Special~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Special~0_combout\ = (!ps2_code(5) & (!ps2_code(0) & !ps2_code(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ps2_code(5),
	datac => ps2_code(0),
	datad => ps2_code(6),
	combout => \snake2Special~0_combout\);

-- Location: LCCOMB_X20_Y23_N22
\snake2Special~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \snake2Special~1_combout\ = (\snake2Special~0_combout\ & ((\snake2Up~4_combout\ & (\Equal2~0_combout\)) # (!\snake2Up~4_combout\ & ((\snake2Special~reg0_q\))))) # (!\snake2Special~0_combout\ & (((\snake2Special~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \snake2Special~0_combout\,
	datab => \Equal2~0_combout\,
	datac => \snake2Special~reg0_q\,
	datad => \snake2Up~4_combout\,
	combout => \snake2Special~1_combout\);

-- Location: FF_X20_Y23_N23
\snake2Special~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ps2_code_new~clkctrl_outclk\,
	d => \snake2Special~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \snake2Special~reg0_q\);

ww_snake1Up <= \snake1Up~output_o\;

ww_snake1Down <= \snake1Down~output_o\;

ww_snake1Left <= \snake1Left~output_o\;

ww_snake1Right <= \snake1Right~output_o\;

ww_snake1Special <= \snake1Special~output_o\;

ww_snake2Up <= \snake2Up~output_o\;

ww_snake2Down <= \snake2Down~output_o\;

ww_snake2Left <= \snake2Left~output_o\;

ww_snake2Right <= \snake2Right~output_o\;

ww_snake2Special <= \snake2Special~output_o\;
END structure;


