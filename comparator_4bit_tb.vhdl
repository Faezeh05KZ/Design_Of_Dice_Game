library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY comparator_4bit_tb is
END ENTITY comparator_4bit_tb ;

ARCHITECTURE behavior of comparator_4bit_tb is
    COMPONENT comparator_4bit is
        port (
            a     : in  unsigned(3 downto 0) ;
            b     : in  unsigned(3 downto 0) ;
            equal : out std_logic
        );
    END COMPONENT ;
    SIGNAL a_tb     : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL b_tb     : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL equal_tb : std_logic ;
BEGIN
    uut : comparator_4bit
        port map (
            a     => a_tb,
            b     => b_tb,
            equal => equal_tb
        );
    stim_process : process
    BEGIN
        a_tb <= to_unsigned(5, 4) ;
        b_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(3, 4) ;
        b_tb <= to_unsigned(7, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(8, 4) ;
        b_tb <= to_unsigned(8, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(2, 4) ;
        b_tb <= to_unsigned(4, 4) ;
        wait for 10 ns ;
        a_tb <= to_unsigned(6, 4) ;
        b_tb <= to_unsigned(6, 4) ;
        wait for 10 ns ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
