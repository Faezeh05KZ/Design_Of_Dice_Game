library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY test_logic_tb is
END ENTITY test_logic_tb ;

ARCHITECTURE behavior of test_logic_tb is
    COMPONENT test_logic is
        port (
            sum   : in  unsigned(3 downto 0) ;
            point : in  unsigned(3 downto 0) ;
            d7    : out std_logic ;
            d711  : out std_logic ;
            d2312 : out std_logic ;
            eq    : out std_logic
        );
    END COMPONENT ;
    SIGNAL sum_tb   : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL point_tb : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL d7_tb    : std_logic ;
    SIGNAL d711_tb  : std_logic ;
    SIGNAL d2312_tb : std_logic ;
    SIGNAL eq_tb    : std_logic ;
BEGIN
    uut : test_logic
        port map (
            sum   => sum_tb,
            point => point_tb,
            d7    => d7_tb,
            d711  => d711_tb,
            d2312 => d2312_tb,
            eq    => eq_tb
        );
    stim_process : process
    BEGIN
        sum_tb <= to_unsigned(7, 4) ;
        point_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(11, 4) ;
        point_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(2, 4) ;
        point_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(3, 4) ;
        point_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(12, 4) ;
        point_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(5, 4) ;
        point_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(6, 4) ;
        point_tb <= to_unsigned(8, 4) ;
        wait for 10 ns ;
        sum_tb <= to_unsigned(8, 4) ;
        point_tb <= to_unsigned(8, 4) ;
        wait for 10 ns ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
