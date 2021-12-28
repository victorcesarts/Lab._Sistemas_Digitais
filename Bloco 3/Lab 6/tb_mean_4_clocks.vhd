library ieee;
use ieee.std_logic_1164.all;

entity tb_mean_4_clocks is
end tb_mean_4_clocks;

architecture teste of tb_mean_4_clocks is

	component mean_4_clocks is

		generic (W : integer := 32);
		
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );

	end component;
	
	signal CLK     : std_logic;
   signal RESET   : std_logic;
   signal INPUT   : std_logic_vector(32 - 1 downto 0);
   signal OUTPUT  : std_logic_vector(32 - 1 downto 0);

	begin
		mean_4_clocks_instance : mean_4_clocks port map(INPUT=>INPUT, RESET=>RESET, CLK=>CLK, OUTPUT=>OUTPUT);
		INPUT <= x"00000000", x"00000001" after 2 ns, x"00000009" after 4 ns, x"00000008" after 6 ns, x"0000000A" after 8 ns, x"0000000B" after 10 nS, x"00000005" after 12 ns, x"0000000C" after 14 ns;
		RESET <= '0', '1' after 8 ns, '0' after 10 ns;
		CLK <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns, '1' after 5 ns, '0' after 6 ns, '1' after 7 ns, '0' after 8 ns, '1' after 9 ns, '0' after 10 ns, '1' after 11 ns, '0' after 12 ns, '1' after 13 ns, '0' after 14 ns;
	
end teste;