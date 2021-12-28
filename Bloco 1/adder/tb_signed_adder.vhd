library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_signed_adder is
end tb_signed_adder;

architecture teste of tb_signed_adder is

component signed_adder is

	generic
	(DATA_WIDTH : natural := 4);
	port 
	(a : in signed	((DATA_WIDTH-1) downto 0); b : in signed	((DATA_WIDTH-1) downto 0);
	result : out signed ((DATA_WIDTH-1) downto 0));
	
end component;

signal A, B, S: signed(3 downto 0);
begin
instancia_signed_adder: signed_adder port map(a=>A,b=>B,result=>S);
A <= x"0", x"F" after 20 ns, x"5" after 40 ns, x"4" after 60 ns;
B <= x"0", x"4" after 10 ns, x"3" after 30 ns, x"1" after 50 ns;
end teste;