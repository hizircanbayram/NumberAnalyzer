library verilog;
use verilog.vl_types.all;
entity numberAnalyzer is
    port(
        isEven          : out    vl_logic;
        isFibonacci     : out    vl_logic;
        isPalindrome    : out    vl_logic;
        stuckStateEven  : out    vl_logic_vector(1 downto 0);
        stuckStateFibonacci: out    vl_logic_vector(3 downto 0);
        stuckStatePalindrome: out    vl_logic_vector(3 downto 0);
        inp             : in     vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        go_i            : in     vl_logic;
        clk             : in     vl_logic
    );
end numberAnalyzer;
