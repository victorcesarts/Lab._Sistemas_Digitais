library IEEE;
use ieee.std_logic_1164.all;

entity fourbfulladder is

	port ( A : in std_logic_vector(3 downto 0);
			 B : in std_logic_vector(3 downto 0);
			 clk : in std_logic;
			 SUM : out std_logic_vector(3 downto 0)
			 );
end fourbfulladder;


architecture structural of fourbfulladder is

	-- Componente Full Adder de 1 bit --
	component fulladder is
	
		port ( Cin : in std_logic;
           x   : in std_logic;
           y   : in std_logic;
           s   : out std_logic;
           Cout : out std_logic
       );
		 
	end component fulladder;

	-- Componente Flip-Flop-D de 1 bit --
	component FlipFlopD is
	
		port( clock: in std_logic;
		  D: in std_logic;
	     Q: out std_logic
		);
		
	end component FlipFlopD;

	--Sinais internos --
	signal c0, c01, c02, c03, s0, s1, s2, s3, D, Q : std_logic;

	begin
	-- Instanciando 4 somadores de 1 bit --
		x0 : fulladder port map(Cin => '0', x => A(0), y => B(0), Cout => c01, s => s0);
		
		x1 : fulladder port map(Cin => c01, x => A(1), y => B(1), Cout => c02, s => s1);
		
		x2 : fulladder port map(Cin => c02, x => A(2), y => B(2), Cout => c03, s => s2);
		
		x3 : fulladder port map(Cin => c03, x => A(3), y => B(3), Cout => c0, s => s3);
										
										
	--Instanciando 4 Flip-Flops D de 1 bit --
		F0 : FlipFlopD port map(clock => clk, D => s0, Q => SUM(0));
		
		F1 : FlipFlopD port map(clock => clk, D => s1, Q => SUM(1));
		
		F2 : FlipFlopD port map(clock => clk, D => s2, Q => SUM(2));
		
		F3 : FlipFlopD port map(clock => clk, D => s3, Q => SUM(3));
		
end structural;