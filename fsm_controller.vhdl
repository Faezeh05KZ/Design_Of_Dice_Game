library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY fsm_controller is
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
END ENTITY fsm_controller ;

ARCHITECTURE behavioral of fsm_controller is
    type state_type is (
        IDLE,
        FIRST_ROLL,
        CHECK_FIRST,
        SAVE_POINT,
        WAIT_ROLL,
        NEXT_ROLL,
        CHECK_NEXT,
        WIN_STATE,
        LOSE_STATE
    );
    SIGNAL current_state : state_type ;
    SIGNAL next_state    : state_type ;
    SIGNAL roll_btn_prev : std_logic ;
    SIGNAL roll_btn_rise : std_logic ;
    SIGNAL roll_btn_fall : std_logic ;
BEGIN
    process(clk)
    BEGIN
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= IDLE ;
                roll_btn_prev <= '0' ;
            else
                current_state <= next_state ;
                roll_btn_prev <= roll_btn ;
            END if ;
        END if ;
    END process ;
    roll_btn_rise <= '1' when (roll_btn = '1' and roll_btn_prev = '0') else '0' ;
    roll_btn_fall <= '1' when (roll_btn = '0' and roll_btn_prev = '1') else '0' ;
    process(current_state, roll_btn, roll_btn_rise, roll_btn_fall, d7, d711, d2312, eq)
    BEGIN
        roll_en <= '0' ;
        sp <= '0' ;
        win <= '0' ;
        lose <= '0' ;
        next_state <= current_state ;
        case current_state is
            when IDLE =>
                if roll_btn_rise = '1' then
                    next_state <= FIRST_ROLL ;
                END if ;
            when FIRST_ROLL =>
                roll_en <= '1' ;
                if roll_btn_fall = '1' then
                    next_state <= CHECK_FIRST ;
                END if ;
            when CHECK_FIRST =>
                if d711 = '1' then
                    next_state <= WIN_STATE ;
                elsif d2312 = '1' then
                    next_state <= LOSE_STATE ;
                else
                    next_state <= SAVE_POINT ;
                END if ;
            when SAVE_POINT =>
                sp <= '1' ;
                next_state <= WAIT_ROLL ;
            when WAIT_ROLL =>
                if roll_btn_rise = '1' then
                    next_state <= NEXT_ROLL ;
                END if ;
            when NEXT_ROLL =>
                roll_en <= '1' ;
                if roll_btn_fall = '1' then
                    next_state <= CHECK_NEXT ;
                END if ;
            when CHECK_NEXT =>
                if eq = '1' then
                    next_state <= WIN_STATE ;
                elsif d7 = '1' then
                    next_state <= LOSE_STATE ;
                else
                    next_state <= WAIT_ROLL ;
                END if ;
            when WIN_STATE =>
                win <= '1' ;
            when LOSE_STATE =>
                lose <= '1' ;
            when others =>
                next_state <= IDLE ;
        END case ;
    END process ;
END ARCHITECTURE behavioral ;
