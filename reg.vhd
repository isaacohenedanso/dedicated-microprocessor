library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
	port(
		CLK, LOAD: in std_logic;
		D: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0)
		);
end reg;

architecture Behavioral of reg is

begin
	process(CLK, LOAD, D) is
		begin
			if(rising_edge(CLK) and LOAD = '1') then
				Q <= D;
			end if;
	end process;
end Behavioral;

