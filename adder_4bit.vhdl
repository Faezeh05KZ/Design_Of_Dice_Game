library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY adder_4bit is
    port (
        a   : in  unsigned(3 downto 0) ;
        b   : in  unsigned(3 downto 0) ;
        sum : out unsigned(3 downto 0)
    );
END ENTITY adder_4bit ;

ARCHITECTURE rtl of adder_4bit is
BEGIN
    sum <= a + b ;
END ARCHITECTURE rtl ;
