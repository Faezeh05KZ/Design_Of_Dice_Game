library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY datapath_tb is
END ENTITY datapath_tb ;

ARCHITECTURE behavior of datapath_tb is
    COMPONENT datapath is
        port (
            clk   : in  std_logic ;
            rst   : in  std_logic ;
            roll  : in  std_logic ;
            sp    : in  std_logic ;
            seg1  : out std_logic_vector(6 downto 0) ;
            seg2  : out std_logic_vector(6 downto 0) ;
            d7    : out std_logic ;
            d711  : out std_logic ;
            d2312 : out std_logic ;
            eq    : out std_logic
        );
    END COMPONENT ;
    SIGNAL clk_tb   : std_logic := '0' ;
    SIGNAL rst_tb   : std_logic := '0' ;
    SIGNAL roll_tb  : std_logic := '0' ;
    SIGNAL sp_tb    : std_logic := '0' ;
    SIGNAL seg1_tb  : std_logic_vector(6 downto 0) ;
    SIGNAL seg2_tb  : std_logic_vector(6 downto 0) ;
    SIGNAL d7_tb    : std_logic ;
    SIGNAL d711_tb  : std_logic ;
    SIGNAL d2312_tb : std_logic ;
    SIGNAL eq_tb    : std_logic ;
    constant clk_period : time := 10 ns ;
BEGIN
    uut : datapath
        port map (
            clk   => clk_tb,
            rst   => rst_tb,
            roll  => roll_tb,
            sp    => sp_tb,
            seg1  => seg1_tb,
            seg2  => seg2_tb,
            d7    => d7_tb,
            d711  => d711_tb,
            d2312 => d2312_tb,
            eq    => eq_tb
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
        roll_tb <= '0' ;
        sp_tb <= '0' ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period ;
        roll_tb <= '1' ;
        wait for clk_period * 10 ;
        roll_tb <= '0' ;
        wait for clk_period * 2 ;
        if d711_tb = '1' then
            wait for clk_period * 5 ;
        elsif d2312_tb = '1' then
            wait for clk_period * 5 ;
        else
            sp_tb <= '1' ;
            wait for clk_period ;
            sp_tb <= '0' ;
            wait for clk_period * 3 ;
            roll_tb <= '1' ;
            wait for clk_period * 10 ;
            roll_tb <= '0' ;
            wait for clk_period * 2 ;
        END if ;
        wait for clk_period * 10 ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
