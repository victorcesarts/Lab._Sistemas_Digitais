library ieee;
use ieee.std_logic_1164.all;

entity tb_fsmx is
end tb_fsmx;

architecture teste of tb_fsmx is

component fsmx is
	Port ( BUM1,BUM2 : in std_logic;
	CLK : in std_logic;
	TOUT,CTA : out std_logic);
end component;

signal BUM1, BUM2, TOUT, CTA, CLK: std_logic;
begin
instancia_fsmx: fsmx port map(BUM1=>BUM1,BUM2=>BUM2,TOUT=>TOUT, CTA=>CTA, CLK=>CLK);
BUM1 <= '0', '1' after 7 ns, '0' after 12 ns, '1' after 13 ns, '0' after 15 ns, '1' after 36 ns, '0' after 42 ns, '1' after 49 ns, '0' after 56 ns, '1' after 63 ns, '0' after 70 ns;
BUM2 <= '0', '1' after 15  ns, '0' after 21 ns, '1' after 24 ns, '0' after 25 ns, '1' after 27 nS, '0' after 45 ns, '1' after 50 ns;
CLK <= '0', '1' after 2 ns, '0' after 5 ns, '1' after 8 ns, '0' after 11 ns, '1' after 14 ns, '0' after 17 ns, '1' after 20 ns, '0' after 23 ns, '1' after 26 ns, '0' after 29 ns, '1' after 32 ns, '0' after 35 ns, '1' after 37 ns, '0' after 39 ns, '1' after 42 ns, '0' after 45 ns, '1' after 48 ns, '0' after 51 ns, '1' after 54 ns, '0' after 57 ns, '1' after 60 ns, '0' after 63 ns, '1' after 66 ns, '0' after 69 ns;
end teste;