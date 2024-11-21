library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compar is
	port(
		INPT_A, INPT_B: in std_logic_vector(7 downto 0);
		OUTP: out std_logic
	);
end compar;

architecture Behavioral of compar is
begin
	OUTP <= '1' when (INPT_A < INPT_B) else
					'0' when (INPT_A > INPT_B) else
					'0';
end Behavioral;

