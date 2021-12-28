library ieee;
use ieee.std_logic_1164.all;

entity tb_pseudo_mux is
end tb_pseudo_mux;

architecture teste of tb_pseudo_mux is

	component pseudo_mux is
	
	port (
        RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic; -- data output
		  Y 		 : out 	std_logic_vector(3 downto 0)
    );

	end component;
	
	signal CLOCK   : std_logic;
   signal RESET   : std_logic;
	signal S       : std_logic;
	signal Q       : std_logic;
   signal Y   		: std_logic_vector(3 downto 0);
	signal A, B, C, D : std_logic; 

	begin
		pseudo_mux_instance : pseudo_mux port map(CLOCK=>CLOCK, RESET=>RESET, S=>S, Q=>Q, A=>A, B=>B, C=>C, D=>D, Y=>Y);
		S <= '0', '1' after 2 ns, '0' after 3.5 ns, '1' after 4.5 ns, '0' after 7.5 ns, '1' after 8 nS, '0' after 9 ns, '1' after 10 ns;
		A <= '0', '1' after 1 ns, '0' after 3 ns, '0' after 6 ns, '0' after 8 ns, '0' after 10 nS, '0' after 12 ns, '0' after 14 ns;
		B <= '0', '0' after 2 ns, '1' after 3.5 ns, '0' after 4.5 ns, '1' after 13.5 nS, '0' after 14 ns;
		C <= '0', '0' after 2 ns, '1' after 5.5 ns, '0' after 6.5 ns;
		D <= '0', '0' after 2 ns, '1' after 7.5 ns, '0' after 8 ns;
		RESET <= '0', '1' after 12 ns, '0' after 12.5 ns;
		CLOCK <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns, '1' after 5 ns, '0' after 6 ns, '1' after 7 ns, '0' after 8 ns, '1' after 9 ns, '0' after 10 ns, '1' after 11 ns, '0' after 12 ns, '1' after 13 ns, '0' after 14 ns;
	
end teste;