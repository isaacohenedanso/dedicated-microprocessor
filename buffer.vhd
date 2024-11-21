library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buffer is
	port(in_a: in std_logic_vector(7 downto 0);
			outEn: in std_logic;
			buff_out: out std_logic_vector(7 downto 0)
	);		
end buffer;

architecture Behavioral of buffer is
begin
	buff_out <= in_a when (outEn = '1') else
					0;
end Behavioral;

