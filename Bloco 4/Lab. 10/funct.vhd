library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity funct is 
	port( 	x : in unsigned (3 downto 0);
			f : out unsigned (7 downto 0)
		);	
end funct;
			
architecture flow of funct is
	signal nx : unsigned(3 downto 0);
	begin	
		nx <= not(x);
		f <= shift_left(x*nx, 1);
end flow;