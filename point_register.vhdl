library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY point_register is
    port (
        clk      : in  std_logic ;
        rst      : in  std_logic ;
        sp       : in  std_logic ;
        data_in  : in  unsigned(3 downto 0) ;
        data_out : out unsigned(3 downto 0)
    );
END ENTITY point_register ;

ARCHITECTURE rtl of point_register is
    SIGNAL point_reg : unsigned(3 downto 0) ;
BEGIN
    process(clk)
    BEGIN
        if rising_edge(clk) then
            if rst = '1' then
                point_reg <= (others => '0') ;
            elsif sp = '1' then
                point_reg <= data_in ;
            END if ;
        END if ;
    END process ;
    data_out <= point_reg ;
END ARCHITECTURE rtl ;
