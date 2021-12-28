library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_funct is 
end tb_funct;

architecture test of tb_funct is

	component funct is
		port(	x : in unsigned (3 downto 0);
				f : out unsigned (7 downto 0)
			);
	end component;
	
	signal x : unsigned(3 downto 0);
	signal f : unsigned(7 downto 0);
	
	begin 
	funct_instance : funct port map(x => x, f => f);
	
	x <= "0000", "0001" after 2 ns, "0011" after 4 ns, "0010" after 6 ns, "0000" after 8 ns;

	end test;