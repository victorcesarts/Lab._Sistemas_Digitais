library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

entity tb_funct is 
end tb_funct;

architecture test of tb_funct is

	component funct is
		port(	x : in unsigned (3 downto 0);
				f : out unsigned (7 downto 0)
			);		
	end component;
	
	constant mim_value	: natural := 1;
	constant max_value	: natural := 16;

	signal read_data_in	: std_logic:='0';
	signal flag_write	: std_logic:='0';
	signal data_in		: unsigned(3 downto 0);
	signal data_output	: unsigned(7 downto 0);
	
	file	inputs_data_in	: text open read_mode  is "arquivo.txt";
	file 	inputcomp 		: text open read_mode is "expected.txt";
	file	saida1			: text open write_mode is "saida1.txt";
	file 	saida2 			: text open write_mode is "saida2.txt";
	
	-- Clock period definitions
   	constant PERIOD     : time := 15 ns;
   	constant DUTY_CYCLE : real := 0.5;
   	constant OFFSET     : time := 5 ns;

	begin 
	--The device under test--	
	DUT : funct port map(x => data_in, f => data_output);

------------------------------------------------------------------------------------
----------------- processo para ler os dados do arquivo data_in.txt
------------------------------------------------------------------------------------
	read_inputs_data_in:process
		variable linea : line;
		variable input : std_logic_vector(3 downto 0);
	begin
		while not endfile(inputs_data_in) loop
		    if read_data_in = '1' then
				readline(inputs_data_in,linea);
				read(linea,input);
				data_in <= unsigned(input);
			end if;
			wait for PERIOD;
		end loop;
		wait;
	end process read_inputs_data_in;	
------------------------------------------------------------------------------------
----------------- processo para gerar os estimulos de entrada
------------------------------------------------------------------------------------
	tb_stimulus : PROCESS
   	begin
		wait for (OFFSET + 0.5*PERIOD);
        	read_data_in <= '1';		
			for i in mim_value to max_value loop --para leitura do n° de valores de entrada
		    	wait for PERIOD;
			end loop;
        	read_data_in <= '0';		
		wait; --suspend process
	end process tb_stimulus;	
------------------------------------------------------------------------------------
------ processo para gerar os estimulos de escrita do arquivo de saida
------------------------------------------------------------------------------------   
    tb_outputs : PROCESS
    begin
        wait for PERIOD;
            flag_write <= '1';
			for i in mim_value to max_value loop
		        wait for PERIOD;
		    end loop;
            flag_write <= '0';			
		wait; 
   END PROCESS tb_outputs;   
-- ------------------------------------------------------------------------------------
-- ------ processo para escrever os dados de saida no arquivo .txt
-- ------------------------------------------------------------------------------------   
	write_outputs:process
		variable linea  : line;
		variable lineb : line;
		variable linec : line;
		variable leituraC :std_logic_vector(7 downto 0);
		variable output : std_logic_vector(7 downto 0);
		begin
			while true loop
				if (flag_write ='1')then
					output := std_logic_vector(data_output);
					write(linea,output);
					writeline(saida1, linea);
					readline(inputcomp,lineb);
					read(lineb,leituraC);
					assert leituraC = output report "Error" severity warning;
					if (leituraC /= output) then
						write(linec, string'("Error"));
						writeline(saida2, linec);
					else
						write(linec, string'("Good"));
						writeline(saida2, linec);
				  	end if;	
				end if;
				wait for PERIOD;
		 	end loop; 
	end process write_outputs;   		


end test;