library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY test_logic is
    port (
        sum   : in  unsigned(3 downto 0) ;
        point : in  unsigned(3 downto 0) ;
        d7    : out std_logic ;
        d711  : out std_logic ;
        d2312 : out std_logic ;
        eq    : out std_logic
    );
END ENTITY test_logic ;

ARCHITECTURE rtl of test_logic is
BEGIN
    process(sum, point)
    BEGIN
        if sum = 7 then
            d7 <= '1' ;
        else
            d7 <= '0' ;
        END if ;
        if (sum = 7) or (sum = 11) then
            d711 <= '1' ;
        else
            d711 <= '0' ;
        END if ;
        if (sum = 2) or (sum = 3) or (sum = 12) then
            d2312 <= '1' ;
        else
            d2312 <= '0' ;
        END if ;
        if sum = point then
            eq <= '1' ;
        else
            eq <= '0' ;
        END if ;
    END process ;
END ARCHITECTURE rtl ;
