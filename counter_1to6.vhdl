library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY counter_1to6 is
    port (
        clk    : in  std_logic ;
        rst    : in  std_logic ;
        enable : in  std_logic ;
        count  : out unsigned(3 downto 0)
    );
END ENTITY counter_1to6 ;

ARCHITECTURE rtl of counter_1to6 is
    SIGNAL count_reg : unsigned(3 downto 0) ;
BEGIN
    process(clk)
    BEGIN
        if rising_edge(clk) then
            if rst = '1' then
                count_reg <= to_unsigned(1, 4) ;
            elsif enable = '1' then
                if count_reg = 6 then
                    count_reg <= to_unsigned(1, 4) ;
                else
                    count_reg <= count_reg + 1 ;
                END if ;
            END if ;
        END if ;
    END process ;
    count <= count_reg ;
END ARCHITECTURE rtl ;

