library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY seg7_driver_tb is
END ENTITY seg7_driver_tb ;

ARCHITECTURE behavior of seg7_driver_tb is
    COMPONENT seg7_driver is
        port (
            digit : in  unsigned(3 downto 0) ;
            segs  : out std_logic_vector(6 downto 0)
        );
    END COMPONENT ;
    SIGNAL digit_tb : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL segs_tb  : std_logic_vector(6 downto 0) ;
BEGIN
    uut : seg7_driver
        port map (
            digit => digit_tb,
            segs  => segs_tb
        );
    stim_process : process
    BEGIN
        digit_tb <= to_unsigned(1, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(2, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(3, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(4, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(5, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(6, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(0, 4) ;
        wait for 10 ns ;
        digit_tb <= to_unsigned(7, 4) ;
        wait for 10 ns ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
