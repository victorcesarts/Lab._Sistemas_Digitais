library ieee;
use ieee.std_logic_1164.all;

entity fsmx is
	Port ( BUM1,BUM2 : in std_logic;
	CLK : in std_logic;
	TOUT,CTA : out std_logic);
end fsmx;

architecture my_fsmx of fsmx is
	type state_type is (S1,S2,S3);
	signal PS,NS : state_type;
		begin
			sync_p: process (CLK,NS)
			begin
			if (rising_edge(CLK)) then
				PS <= NS;
			end if;
	end process sync_p;
	comb_p: process (CLK,BUM1,BUM2)
		begin
			case PS is
				when S1 => 
				CTA <= '0';
					if (BUM1 = '0') then
						TOUT <= '0';
						NS <= S1; 
						
						--NS DEFINES WHERE THE STATE GO
						
					elsif (BUM1 = '1') then
						TOUT <= '1';
						NS <= S2;
					end if;
				when S2 =>
					CTA <= '0';
					TOUT <= '0';
					NS <= S3;
				when S3 =>
					CTA <= '1';
					TOUT <= '0';
					if (BUM2 = '1') then
						NS <= S1;
					elsif (BUM2 = '0') then
						NS <= S2;
					end if;
				when others => CTA <= '0'; TOUT <= '0';
					NS <= S1;
			end case;
	end process comb_p;
end my_fsmx;