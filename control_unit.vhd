library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
	port(
		CLK, RST, ALTB, ELTC: in std_logic;
		LOAD, ELOAD, SEL1, SEL2, OUTEN: out std_logic
	);
end control_unit;

architecture Behavioral of control_unit is
	type state_type is (ST0,ST1, ST2, ST3, ST4, ST5, ST6);
	signal PS, NS: state_type;
	
begin
	sync_proc: process(CLK, NS, RST) is
		begin
			if(RST = '1') then 
				PS <= ST0;
			elsif(rising_edge(CLK)) then
				PS <= NS;
			end if;
	end process;

	comb_proc: process(PS, ALTB, ELTC) is
		begin
			case PS is 
				when ST0 => 
					LOAD <= '1';
					ELOAD <= '0';
					SEL1 <= '0';
					SEL2 <= '0';
					OUTEN <= '0';
					NS <= ST1;
				when ST1 => 
					LOAD <= '0';
					ELOAD <= '0';
					SEL1 <= '0';
					SEL2 <= '0';
					OUTEN <= '0';
					if(ALTB = '1') then
						NS <= ST2;
					else
						NS <= ST3;
					end if;
				when ST2 => 
					LOAD <= '0';
					ELOAD <= '1';
					SEL1 <= '0';
					SEL2 <= '0';
					OUTEN <= '0';
					NS <= ST4;
				when ST3 => 
					LOAD <= '0';
					ELOAD <= '1';
					SEL1 <= '1';
					SEL2 <= '0';
					OUTEN <= '0';
					NS <= ST4;
				when ST4 =>
					LOAD <= '0';
					ELOAD <= '0';
					SEL1 <= '0';
					SEL2 <= '0';
					OUTEN <= '0';
					if(ELTC = '1')then
						NS <= ST5;
					else
						NS <= ST6;
					end if;
				when ST5 => 
					LOAD <= '0';
					ELOAD <= '0';
					SEL1 <= '0';
					SEL2 <= '0';
					OUTEN <= '1';
					NS <= ST5;
				when ST6 => 
					LOAD <= '0';
					ELOAD <= '0';
					SEL1 <= '0';
					SEL2 <= '1';
					OUTEN <= '1';
					NS <= ST6;
--				when ST7 => 
--					LOAD <= '0';
--					ELOAD <= '0';
--					SEL1 <= '0';
--					SEL2 <= not ELTC;
--					OUTEN <= '1';
--					NS <= ST7;
				when others => 
					LOAD <= '1';
					ELOAD <= '0';
					SEL1 <= '0';
					SEL2 <= '0';
					OUTEN <= '0';					
					NS <= ST0;
		end case;
	end process;
end Behavioral;
