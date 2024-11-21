library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristatebuffer is
	port(INPT_A: in std_logic_vector(7 downto 0);
			OUTEN: in std_logic;
			OUTP: out std_logic_vector(7 downto 0)
	);		
end tristatebuffer;

architecture Behavioral of tristatebuffer is
begin
	OUTP <= INPT_A when (OUTEN = '1') else
					"00000000";
end Behavioral;

