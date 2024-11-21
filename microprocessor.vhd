library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity microprocessor is
	port(
			CLK, RST: in std_logic;
			INPT_A, INPT_B, INPT_C: in std_logic_vector(7 downto 0);
			OUTP: out std_logic_vector(7 downto 0)
		);
		
end microprocessor;

architecture Behavioral of microprocessor is
	component control_unit
		port(
			CLK, RST, ALTB, ELTC: in std_logic;
			LOAD, ELOAD, SEL1, SEL2, OUTEN: out std_logic
		);
	end component;
	
	component datapath 
		 port (
			  INPT_A, INPT_B, INPT_C : in std_logic_vector(7 downto 0);
			  CLK, LOAD, ELOAD, OUTEN, SEL1, SEL2 : in std_logic;
			  ALTB, ELTC : out std_logic;
			  OUTP : out std_logic_vector(7 downto 0)
		 );
	end component;
	
	signal LOAD_SIGNAL, ELOAD_SIGNAL, MUXSEL1, MUXSEL2, OUTPUT_ENABLE, ALB, ELC: std_logic;

begin
	DP: datapath port map(
								CLK => CLK,
								LOAD => LOAD_SIGNAL,
								ELOAD => ELOAD_SIGNAL,
								SEL1 => MUXSEL1,
								SEL2 => MUXSEL2,
								OUTEN => OUTPUT_ENABLE,
								INPT_A => INPT_A,
								INPT_B => INPT_B,
								INPT_C => INPT_C,
								ALTB => ALB,
								ELTC => ELC,
								OUTP => OUTP
							);
	CU: control_unit port map(
										CLK => CLK,
										RST => RST, 
										ALTB => ALB, 
										ELTC => ELC,
										LOAD => LOAD_SIGNAL,
										ELOAD => ELOAD_SIGNAL,
										SEL1 => MUXSEL1,
										SEL2 => MUXSEL2,
										OUTEN => OUTPUT_ENABLE
									);	
end Behavioral;

