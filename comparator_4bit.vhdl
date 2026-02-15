library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY comparator_4bit is
    port (
        a     : in  unsigned(3 downto 0) ;
        b     : in  unsigned(3 downto 0) ;
        equal : out std_logic
    );
END ENTITY comparator_4bit ;

ARCHITECTURE rtl of comparator_4bit is
BEGIN
    process(a, b)
    BEGIN
        if a = b then
            equal <= '1' ;
        else
            equal <= '0' ;
        END if ;
    END process ;
END ARCHITECTURE rtl ;
