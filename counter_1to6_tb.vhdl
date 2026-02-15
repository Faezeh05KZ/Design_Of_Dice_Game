library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY counter_1to6_tb is
END ENTITY counter_1to6_tb ;

ARCHITECTURE behavior of counter_1to6_tb is
    COMPONENT counter_1to6 is
        port (
            clk    : in  std_logic ;
            rst    : in  std_logic ;
            enable : in  std_logic ;
            count  : out unsigned(3 downto 0)
        );
    END COMPONENT ;
    SIGNAL clk_tb    : std_logic := '0' ;
    SIGNAL rst_tb    : std_logic := '0' ;
    SIGNAL enable_tb : std_logic := '0' ;
    SIGNAL count_tb  : unsigned(3 downto 0) ;
    constant clk_period : time := 10 ns ;
BEGIN
    uut : counter_1to6
        port map (
            clk    => clk_tb,
            rst    => rst_tb,
            enable => enable_tb,
            count  => count_tb
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
        enable_tb <= '0' ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period ;
        enable_tb <= '1' ;
        wait for clk_period * 8 ;
        enable_tb <= '0' ;
        wait for clk_period * 3 ;
        enable_tb <= '1' ;
        wait for clk_period * 5 ;
        rst_tb <= '1' ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period * 10 ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
