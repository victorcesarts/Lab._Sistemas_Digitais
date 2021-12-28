library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mean_4_clocks is
    generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );
end mean_4_clocks;

-- Implement the testbench and find the errors in this model.
-- Consider the following expected behavior:
--      Every rising edge of CLK input, the content of INPUT
--      is added to a register chain and used to calculate the
--      mean value over 4 clock periods

architecture arch of mean_4_clocks is
begin
    process(INPUT) is
        variable var1 : unsigned(W - 1 downto 0);
        variable var2 : unsigned(W - 1 downto 0);
        variable var3 : unsigned(W - 1 downto 0);
        variable var4 : unsigned(W - 1 downto 0);
		  variable result : unsigned(W - 1 downto 0);
		  variable sum : unsigned(W - 1 downto 0);
    begin
        if (RESET = '1') then
            var1 := to_unsigned(0,W);
            var2 := to_unsigned(0,W);
            var3 := to_unsigned(0,W);
            var4 := to_unsigned(0,W);	
				result := to_unsigned(0,W);
				
         elsif (rising_edge(CLK)) then
				var4 := var3;
				var3 := var2;			
				var2 := var1;
				var1 := unsigned(INPUT(W-1 downto 0)); 
				
				result := (var1 + var2 + var3 + var4);  
				result := ("00" & result(W-1 downto 2));
        end if;
        OUTPUT <= std_logic_vector(result);
    end process;
    
end arch;