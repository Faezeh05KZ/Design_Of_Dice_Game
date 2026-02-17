library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY craps_game is
    port (
        clk      : in  std_logic ;
        reset    : in  std_logic ;
        roll     : in  std_logic ;
        seg1     : out std_logic_vector(6 downto 0) ;
        seg2     : out std_logic_vector(6 downto 0) ;
        win_led  : out std_logic ;
        lose_led : out std_logic
    );
END ENTITY craps_game ;

ARCHITECTURE structural of craps_game is
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
    SIGNAL roll_enable : std_logic ;
    SIGNAL sp_enable   : std_logic ;
    SIGNAL d7_sig      : std_logic ;
    SIGNAL d711_sig    : std_logic ;
    SIGNAL d2312_sig   : std_logic ;
    SIGNAL eq_sig      : std_logic ;
BEGIN
    datapath_inst : datapath
        port map (
            clk   => clk,
            rst   => reset,
            roll  => roll_enable,
            sp    => sp_enable,
            seg1  => seg1,
            seg2  => seg2,
            d7    => d7_sig,
            d711  => d711_sig,
            d2312 => d2312_sig,
            eq    => eq_sig
        );
    controller_inst : fsm_controller
        port map (
            clk      => clk,
            rst      => reset,
            roll_btn => roll,
            d7       => d7_sig,
            d711     => d711_sig,
            d2312    => d2312_sig,
            eq       => eq_sig,
            roll_en  => roll_enable,
            sp       => sp_enable,
            win      => win_led,
            lose     => lose_led
        );
END ARCHITECTURE structural ;
