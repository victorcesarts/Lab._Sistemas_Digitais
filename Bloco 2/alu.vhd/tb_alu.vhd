library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
end tb_alu;

architecture teste of tb_alu is

	component alu is
    generic (
        W       :       integer := 32
    );
    port (
        CONTROL : in    std_logic_vector(3 downto 0);
        SRC1    : in    std_logic_vector(W - 1 downto 0);
        SRC2    : in    std_logic_vector(W - 1 downto 0);
        RESULT  : out   std_logic_vector(W - 1 downto 0);
        ZERO    : out   std_logic
    );
	end component;

	signal SRC1, SRC2, RESULT : std_logic_vector(32-1 downto 0);
	signal CONTROL : std_logic_vector(3 downto 0);
	signal ZERO : std_logic;

	begin
		alu_instance : alu port map(SRC1=>SRC1, SRC2=>SRC2, RESULT=>RESULT, CONTROL=>CONTROL, ZERO=>ZERO);
		
		CONTROL <= "0000", "0001" after 1 ns, "0010" after 2 ns, "0110" after 3 ns, "0111" after 4 ns, "1100" after 5 ns, "0011" after 6 ns, "0000" after 7 ns, "0100" after 8 ns, "0001" after 9 ns, "0001" after 10 ns, "0001" after 11 ns, "0111" after 12 ns, "1100" after 13 ns, "1101" after 14 ns;
		SRC1 <= x"00000000", x"00000002" after 1 ns, x"00000003" after 2 ns, x"00000004" after 3 ns, x"00000000" after 4 ns, x"00000006" after 5 ns, x"00000007" after 6 ns, x"00000008" after 7 ns, x"00000009" after 8 ns, x"0000000A" after 9 ns, x"0000000B" after 10 ns, x"0000000C" after 11 ns, x"0000000D" after 12 ns, x"0000000E" after 13 ns, x"0000000F" after 14 ns;
		SRC2 <= x"00000000", x"00000001" after 1 ns, x"00000004" after 2 ns, x"00000005" after 3 ns, x"00000000" after 4 ns, x"00000007" after 5 ns, x"00000005" after 6 ns, x"00000001" after 7 ns, x"00000003" after 8 ns, x"0000000A" after 9 ns, x"0000000B" after 10 ns, x"0000000C" after 11 ns, x"0000000D" after 12 ns, x"0000000E" after 13 ns, x"0000000F" after 14 ns;
	end teste;