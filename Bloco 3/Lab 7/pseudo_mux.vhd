library ieee;
use ieee.std_logic_1164.all;

entity pseudo_mux is
    port (
        RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic; -- data output
		  Y 		 : out 	std_logic_vector(3 downto 0)
    );
end pseudo_mux;

architecture arch of pseudo_mux is
	type state_type is (ST0,ST1,ST2,ST3);
	
	--attribute ENUM_ENCODING: STRING;
	--attribute ENUM_ENCODING of state_type: type is "1000 0100 0010 0001";
	
	signal PS,NS : state_type;
	
begin
	sequential : process(CLOCK,NS,RESET)
	
	begin
		if (RESET = '1') then 
			PS <= ST0;
		elsif (rising_edge(CLOCK)) then 
			PS <= NS;
		end if;
		
	end process sequential;


	comb_proc: process(PS, S, A, B, C, D)
	begin						
		Q <= A;			
		case PS is
			when ST0 => 
				Q <= A; 
				if (S = '1') then NS <= ST1;
				else NS <= ST0;
				end if;
			when ST1 => 	
				Q <= B;	 	
				if (S = '1') then NS <= ST2; 
				else NS <= ST1; 
				end if;
			when ST2 => 
				Q <= C;	 	
				if (S = '1') then NS <= ST3; 
				else NS <= ST2; 
				end if;
			when ST3 => 
				Q <= D;	 	
				if (S = '1') then NS <= ST0;  
				else NS <= ST3;
				end if;
			when others => -- the catch all condition
				Q <= A; NS <= ST0;
			end case;
		end process comb_proc;
		
			-- one-hot encoded approach
	with PS select
		Y <= "1000" when ST0,
		"0100" when ST1,
		"0010" when ST2,
		"0001" when ST3,
		"1000" when others;
 
end arch;