library ieee;
use ieee.std_logic_1164.all;

entity tb_fourbfulladder is
end tb_fourbfulladder;

architecture teste of tb_fourbfulladder is

	component fourbfulladder is

		port ( A : in std_logic_vector(3 downto 0);
			 B : in std_logic_vector(3 downto 0);
			 clk : in std_logic;
			 SUM : out std_logic_vector(3 downto 0)
		);
			 
	end component fourbfulladder;
	
	signal A : std_logic_vector(3 downto 0);
	signal B : std_logic_vector(3 downto 0);
	signal clk : std_logic;
	signal SUM : std_logic_vector(3 downto 0);
	
	begin
	
		fourbfulladder_instance : fourbfulladder port map (A => A, B => B, clk => clk, SUM => SUM);
		
		A <= x"0", x"2" after 2 ns, x"7" after 10 ns, x"4" after 17 ns, x"0" after 25 ns;
		
		B <= x"0", x"3" after 3 ns, x"2" after 10 ns, x"0" after 17 ns, x"0" after 25 ns;
		
		clk <= '0', '1' after 4 ns, '0' after 8 ns, '1' after 12 ns, '0' after 16 ns, '1' after 20 ns, '0' after 24 ns;	
		
end teste;