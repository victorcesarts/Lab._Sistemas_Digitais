library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Comparador is

port (A, B : in std_logic_vector(3 downto 0);
		CLK : in std_logic;
		gt, lt, eq : out std_logic);

end Comparador;



architecture behavioral of Comparador is	
	begin	
	my_comp : process(CLK) is
	begin
		if (rising_edge (CLK)) then
			if (A > B) then
				gt <= '1';
			else
				gt <= '0';
			end if;
			if (A < B) then
				lt <= '1';
			else
				lt <= '0';
			end if;
			if (A = B) then
				eq <= '1';
			else
				eq <= '0';
			end if;
		end if;
	end process my_comp;
	
end behavioral;
	