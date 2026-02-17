library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY craps_game_tb is
END ENTITY craps_game_tb ;

ARCHITECTURE behavior of craps_game_tb is
    COMPONENT craps_game is
        port (
            clk      : in  std_logic ;
            reset    : in  std_logic ;
            roll     : in  std_logic ;
            seg1     : out std_logic_vector(6 downto 0) ;
            seg2     : out std_logic_vector(6 downto 0) ;
            win_led  : out std_logic ;
            lose_led : out std_logic
        );
    END COMPONENT ;
    SIGNAL clk_tb      : std_logic := '0' ;
    SIGNAL reset_tb    : std_logic := '0' ;
    SIGNAL roll_tb     : std_logic := '0' ;
    SIGNAL seg1_tb     : std_logic_vector(6 downto 0) ;
    SIGNAL seg2_tb     : std_logic_vector(6 downto 0) ;
    SIGNAL win_led_tb  : std_logic ;
    SIGNAL lose_led_tb : std_logic ;
    constant clk_period : time := 10 ns ;
    procedure press_roll(signal roll_sig : out std_logic ; duration : time) is
    BEGIN
        roll_sig <= '1' ;
        wait for duration ;
        roll_sig <= '0' ;
        wait for clk_period * 3 ;
    END procedure ;
BEGIN
    uut : craps_game
        port map (
            clk      => clk_tb,
            reset    => reset_tb,
            roll     => roll_tb,
            seg1     => seg1_tb,
            seg2     => seg2_tb,
            win_led  => win_led_tb,
            lose_led => lose_led_tb
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
        reset_tb <= '1' ;
        roll_tb <= '0' ;
        wait for clk_period * 5 ;
        reset_tb <= '0' ;
        wait for clk_period * 3 ;
        press_roll(roll_tb, clk_period * 20) ;
        wait for clk_period * 5 ;
        for i in 1 to 5 loop
            press_roll(roll_tb, clk_period * 15) ;
            wait for clk_period * 5 ;
        END loop ;
        press_roll(roll_tb, clk_period * 30) ;
        wait for clk_period * 10 ;
        for i in 1 to 10 loop
            press_roll(roll_tb, clk_period * 12) ;
            if win_led_tb = '1' then
                exit ;
            elsif lose_led_tb = '1' then
                exit ;
            END if ;
            wait for clk_period * 3 ;
        END loop ;
        wait for clk_period * 10 ;
        reset_tb <= '1' ;
        wait for clk_period * 5 ;
        reset_tb <= '0' ;
        wait for clk_period * 5 ;
        for i in 1 to 8 loop
            press_roll(roll_tb, clk_period * 10) ;
            if win_led_tb = '1' then
                exit ;
            elsif lose_led_tb = '1' then
                exit ;
            END if ;
            wait for clk_period * 3 ;
        END loop ;
        wait for clk_period * 20 ;
        reset_tb <= '1' ;
        wait for clk_period * 5 ;
        reset_tb <= '0' ;
        wait for clk_period * 5 ;
        for i in 1 to 20 loop
            press_roll(roll_tb, clk_period * 8) ;
            if win_led_tb = '1' or lose_led_tb = '1' then
                exit ;
            END if ;
        END loop ;
        wait for clk_period * 20 ;
        wait ;
    END process ;
END ARCHITECTURE behavior ;
