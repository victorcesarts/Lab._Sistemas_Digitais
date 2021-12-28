library ieee;
use ieee.std_logic_1164.all;

entity tb_Comparador is
end tb_Comparador;

architecture teste of tb_Comparador is

	component Comparador is

		port (A, B : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			gt, lt, eq : out std_logic);

	end component;

	signal A, B : std_logic_vector(3 downto 0);
	signal gt, lt, eq : std_logic;
	signal CLK : std_logic;

	begin
		comparador_instance : Comparador port map(A=>A, B=>B, gt=>gt, lt=>lt, eq=>eq, CLK=>CLK);
		A <= x"0", x"1" after 2 ns, x"9" after 4 ns, x"8" after 6 ns, x"A" after 8 ns, x"B" after 10 nS, x"5" after 12 ns, x"C" after 14 ns;
		B <= x"0", x"2" after 2 ns, x"7" after 4 ns, x"F" after 6 ns, x"A" after 8 ns, x"2" after 10 ns, x"F" after 12 ns, x"c" after 14 ns;
		clk <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns, '1' after 5 ns, '0' after 6 ns, '1' after 7 ns, '0' after 8 ns, '1' after 9 ns, '0' after 10 ns, '1' after 11 ns, '0' after 12 ns, '1' after 13 ns, '0' after 14 ns;
	
end teste;