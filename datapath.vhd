library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity datapath is
    port (
        INPT_A, INPT_B, INPT_C : in std_logic_vector(7 downto 0);
        CLK, LOAD, ELOAD, OUTEN, SEL1, SEL2 : in std_logic;
        ALTB, ELTC : out std_logic;
        OUTP: out std_logic_vector(7 downto 0)
    );
end datapath;

architecture Behavioral of datapath is
    component compar is
        port (
            INPT_A, INPT_B: in std_logic_vector(7 downto 0);
            OUTP : out std_logic
        );
    end component;

    component mux2 is
        port (
            INPT_A, INPT_B : in std_logic_vector(7 downto 0);
            SEL : in std_logic;
            OUTP : out std_logic_vector(7 downto 0)
        );
    end component;

    component reg is
        port (
            CLK, LOAD : in std_logic;
            D : in std_logic_vector(7 downto 0);
            Q : out std_logic_vector(7 downto 0)
        );
    end component;

    component tristatebuffer is
        port (
            INPT_A : in std_logic_vector(7 downto 0);
            OUTEN : in std_logic;
            OUTP : out std_logic_vector(7 downto 0)
        );
    end component;
    signal FROM_REG_A, FROM_REG_B, FROM_REG_C, FROM_REG_E, FROM_MUX_1, FROM_MUX_2 : std_logic_vector(7 downto 0);
begin

    reg_A : reg port map(
        CLK => CLK,
        LOAD => LOAD,
        D => INPT_A,
        Q => FROM_REG_A);
    reg_B : reg port map(
        CLK => CLK,
        LOAD => LOAD,
        D => INPT_B,
        Q => FROM_REG_B);
    reg_C : reg port map(
        CLK => CLK,
        LOAD => LOAD,
        D => INPT_C,
        Q => FROM_REG_C);
    reg_E : reg port map(
        CLK => CLK,
        LOAD => ELOAD,
        D => FROM_MUX_1,
        Q => FROM_REG_E);
    compar_1 : compar port map(
        INPT_A => FROM_REG_A,
        INPT_B => FROM_REG_B,
        OUTP => ALTB
    );
    compar_2 : compar port map(
        INPT_A => FROM_REG_E,
        INPT_B => FROM_REG_C,
        OUTP => ELTC
    );
    mux_1 : mux2 port map(
        INPT_A => FROM_REG_A,
        INPT_B => FROM_REG_B,
        SEL => SEL1,
        OUTP => FROM_MUX_1
    );
    mux_2 : mux2 port map(
        INPT_A => FROM_REG_E,
        INPT_B => FROM_REG_C,
        SEL => SEL2,
        OUTP => FROM_MUX_2
    );
    tribuffer_1 : tristatebuffer port map(
        INPT_A => FROM_MUX_2,
        OUTEN => OUTEN,
        OUTP => OUTP
    );

end Behavioral;