library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY adder_4bit_tb is
END ENTITY adder_4bit_tb ;

ARCHITECTURE behavior of adder_4bit_tb is
    COMPONENT adder_4bit is
        port (
            a   : in  unsigned(3 downto 0) ;
            b   : in  unsigned(3 downto 0) ;
            sum : out unsigned(3 downto 0)
        );
    END COMPONENT ;
    SIGNAL a_tb   : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL b_tb   : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL sum_tb : unsigned(3 downto 0) ;
BEGIN
    uut : adder_4bit
        port map (
            a   => a_tb,
            b   => b_tb,
            sum => sum_tb
        );
    stim_process : process
    BEGIN
        a_tb <= to_unsigned(1, 4) ;
        b_tb <= to_unsigned(1, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(3, 4) ;
        b_tb <= to_unsigned(4, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(5, 4) ;
        b_tb <= to_unsigned(6, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(6, 4) ;
        b_tb <= to_unsigned(6, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(1, 4) ;
        b_tb <= to_unsigned(1, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(2, 4) ;
        b_tb <= to_unsigned(3, 4) ;
        wait for 10 ns ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
