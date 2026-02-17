library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY fsm_controller_tb is
END ENTITY fsm_controller_tb ;

ARCHITECTURE behavior of fsm_controller_tb is
    COMPONENT fsm_controller is
        port (
            clk      : in  std_logic ;
            rst      : in  std_logic ;
            roll_btn : in  std_logic ;
            d7       : in  std_logic ;
            d711     : in  std_logic ;
            d2312    : in  std_logic ;
            eq       : in  std_logic ;
            roll_en  : out std_logic ;
            sp       : out std_logic ;
            win      : out std_logic ;
            lose     : out std_logic
        );
    END COMPONENT ;
    SIGNAL clk_tb      : std_logic := '0' ;
    SIGNAL rst_tb      : std_logic := '0' ;
    SIGNAL roll_btn_tb : std_logic := '0' ;
    SIGNAL d7_tb       : std_logic := '0' ;
    SIGNAL d711_tb     : std_logic := '0' ;
    SIGNAL d2312_tb    : std_logic := '0' ;
    SIGNAL eq_tb       : std_logic := '0' ;
    SIGNAL roll_en_tb  : std_logic ;
    SIGNAL sp_tb       : std_logic ;
    SIGNAL win_tb      : std_logic ;
    SIGNAL lose_tb     : std_logic ;
    constant clk_period : time := 10 ns ;
BEGIN
    uut : fsm_controller
        port map (
            clk      => clk_tb,
            rst      => rst_tb,
            roll_btn => roll_btn_tb,
            d7       => d7_tb,
            d711     => d711_tb,
            d2312    => d2312_tb,
            eq       => eq_tb,
            roll_en  => roll_en_tb,
            sp       => sp_tb,
            win      => win_tb,
            lose     => lose_tb
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
        roll_btn_tb <= '0' ;
        d7_tb <= '0' ;
        d711_tb <= '0' ;
        d2312_tb <= '0' ;
        eq_tb <= '0' ;
        wait for clk_period * 3 ;
        rst_tb <= '0' ;
        wait for clk_period * 2 ;
        roll_btn_tb <= '1' ;
        wait for clk_period * 5 ;
        roll_btn_tb <= '0' ;
        wait for clk_period * 2 ;
        d711_tb <= '1' ;
        wait for clk_period ;
        d711_tb <= '0' ;
        wait for clk_period * 5 ;
        rst_tb <= '1' ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period * 2 ;
        roll_btn_tb <= '1' ;
        wait for clk_period * 5 ;
        roll_btn_tb <= '0' ;
        wait for clk_period * 2 ;
        d2312_tb <= '1' ;
        wait for clk_period ;
        d2312_tb <= '0' ;
        wait for clk_period * 5 ;
        rst_tb <= '1' ;
        wait for clk_period * 2 ;
        rst_tb <= '0' ;
        wait for clk_period * 2 ;
        roll_btn_tb <= '1' ;
        wait for clk_period * 5 ;
        roll_btn_tb <= '0' ;
        wait for clk_period * 2 ;
        wait for clk_period * 2 ;
        roll_btn_tb <= '1' ;
        wait for clk_period * 5 ;
        roll_btn_tb <= '0' ;
        wait for clk_period * 2 ;
        eq_tb <= '1' ;
        wait for clk_period ;
        eq_tb <= '0' ;
        wait for clk_period * 10 ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
