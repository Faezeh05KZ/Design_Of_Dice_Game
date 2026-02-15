library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY point_register_tb is
END ENTITY point_register_tb ;

ARCHITECTURE behavior of point_register_tb is
    COMPONENT point_register is
        port (
            clk      : in  std_logic ;
            rst      : in  std_logic ;
            sp       : in  std_logic ;
            data_in  : in  unsigned(3 downto 0) ;
            data_out : out unsigned(3 downto 0)
        );
    END COMPONENT ;
    SIGNAL clk_tb      : std_logic := '0' ;
    SIGNAL rst_tb      : std_logic := '0' ;
    SIGNAL sp_tb       : std_logic := '0' ;
    SIGNAL data_in_tb  : unsigned(3 downto 0) := (others => '0') ;
    SIGNAL data_out_tb : unsigned(3 downto 0) ;
    constant clk_period : time := 10 ns ;
BEGIN
    uut : point_register
        port map (
            clk      => clk_tb,
            rst      => rst_tb,
            sp       => sp_tb,
            data_in  => data_in_tb,
            data_out => data_out_tb
        );
    clk_process : process
    BEGIN
        clk_tb <= '0' ;
        wait for clk_period/2 ;
        clk_tb <= '1' ;
        wait for clk_period/2 ;
    END process ;
    stim_process : process
    BEGIN
        rst_tb <= '1' ;
        sp_tb <= '0' ;
        data_in_tb <= to_unsigned(0, 4) ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period ;
        data_in_tb <= to_unsigned(5, 4) ;
        sp_tb <= '1' ;
        wait for clk_period ;
        sp_tb <= '0' ;
        wait for clk_period * 2 ;
        data_in_tb <= to_unsigned(8, 4) ;
        sp_tb <= '1' ;
        wait for clk_period ;
        sp_tb <= '0' ;
        wait for clk_period * 2 ;
        rst_tb <= '1' ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period * 5 ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
