library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY seg7_driver is
    port (
        digit : in  unsigned(3 downto 0) ;
        segs  : out std_logic_vector(6 downto 0)
    );
END ENTITY seg7_driver ;

ARCHITECTURE behavioral of seg7_driver is
BEGIN
    process(digit)
    BEGIN
        case to_integer(digit) is
            when 1 =>
                segs <= "0000110" ;
            when 2 =>
                segs <= "1011011" ;
            when 3 =>
                segs <= "1001111" ;
            when 4 =>
                segs <= "1100110" ;
            when 5 =>
                segs <= "1101101" ;
            when 6 =>
                segs <= "1111101" ;
            when others =>
                segs <= "0000000" ;
        END case ;
    END process ;
END ARCHITECTURE behavioral ;
