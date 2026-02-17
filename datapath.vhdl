library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.NUMERIC_STD.ALL ;

ENTITY datapath is
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
END ENTITY datapath ;

ARCHITECTURE structural of datapath is
    COMPONENT counter_1to6
        port (
            clk    : in  std_logic ;
            rst    : in  std_logic ;
            enable : in  std_logic ;
            count  : out unsigned(3 downto 0)
        );
    END COMPONENT ;
    COMPONENT seg7_driver
        port (
            digit : in  unsigned(3 downto 0) ;
            segs  : out std_logic_vector(6 downto 0)
        );
    END COMPONENT ;
    COMPONENT adder_4bit
        port (
            a   : in  unsigned(3 downto 0) ;
            b   : in  unsigned(3 downto 0) ;
            sum : out unsigned(3 downto 0)
        );
    END COMPONENT ;
    COMPONENT point_register
        port (
            clk      : in  std_logic ;
            rst      : in  std_logic ;
            sp       : in  std_logic ;
            data_in  : in  unsigned(3 downto 0) ;
            data_out : out unsigned(3 downto 0)
        );
    END COMPONENT ;
    COMPONENT comparator_4bit
        port (
            a     : in  unsigned(3 downto 0) ;
            b     : in  unsigned(3 downto 0) ;
            equal : out std_logic
        );
    END COMPONENT ;
    COMPONENT test_logic
        port (
            sum   : in  unsigned(3 downto 0) ;
            point : in  unsigned(3 downto 0) ;
            d7    : out std_logic ;
            d711  : out std_logic ;
            d2312 : out std_logic ;
            eq    : out std_logic
        );
    END COMPONENT ;
    SIGNAL die1_int  : unsigned(3 downto 0) ;
    SIGNAL die2_int  : unsigned(3 downto 0) ;
    SIGNAL sum_int   : unsigned(3 downto 0) ;
    SIGNAL point_int : unsigned(3 downto 0) ;
    SIGNAL eq_int    : std_logic ;
BEGIN
    counter1 : counter_1to6
        port map (
            clk    => clk,
            rst    => rst,
            enable => roll,
            count  => die1_int
        );
    counter2 : counter_1to6
        port map (
            clk    => clk,
            rst    => rst,
            enable => roll,
            count  => die2_int
        );
    seg7_1 : seg7_driver
        port map (
            digit => die1_int,
            segs  => seg1
        );
    seg7_2 : seg7_driver
        port map (
            digit => die2_int,
            segs  => seg2
        );
    adder : adder_4bit
        port map (
            a   => die1_int,
            b   => die2_int,
            sum => sum_int
        );
    point_reg : point_register
        port map (
            clk      => clk,
            rst      => rst,
            sp       => sp,
            data_in  => sum_int,
            data_out => point_int
        );
    comp : comparator_4bit
        port map (
            a     => sum_int,
            b     => point_int,
            equal => eq_int
        );
    test_lg : test_logic
        port map (
            sum   => sum_int,
            point => point_int,
            d7    => d7,
            d711  => d711,
            d2312 => d2312,
            eq    => eq_int
        );
    eq <= eq_int ;
END ARCHITECTURE structural ;
