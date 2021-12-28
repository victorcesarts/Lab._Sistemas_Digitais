library ieee;
use ieee.std_logic_1164.all;

entity tb_FlipFlopD is
end tb_FlipFlopD;

architecture teste of tb_FlipFlopD is

	component FlipFlopD is
	port( clock: in std_logic;
		  D: in std_logic;
	      Q: out std_logic
	    );
	end component;
	
	signal clock : std_logic;
	signal D : std_logic;
	signal Q : std_logic;
	
	begin
	
	FlipFlopD_instance : FlipFlopD port map(clock => clock, D => D, Q => Q);
	
	clock <= '0', '1' after 2 ns, '0' after 5 ns, '1' after 8 ns, '0' after 11 ns, '1' after 14 ns, '0' after 17 ns, '1' after 20 ns, '0' after 23 ns;
	D <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 16 ns, '0' after 20 ns;

end teste;