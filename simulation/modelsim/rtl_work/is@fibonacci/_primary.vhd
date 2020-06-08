library verilog;
use verilog.vl_types.all;
entity isFibonacci is
    port(
        result          : out    vl_logic;
        stuckState      : out    vl_logic_vector(3 downto 0);
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        go_i            : in     vl_logic;
        number          : in     vl_logic_vector(31 downto 0)
    );
end isFibonacci;
