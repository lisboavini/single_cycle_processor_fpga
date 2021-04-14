library verilog;
use verilog.vl_types.all;
entity \4_bits_demux\ is
    port(
        Q0              : out    vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        Q1              : out    vl_logic;
        Q2              : out    vl_logic;
        Q3              : out    vl_logic
    );
end \4_bits_demux\;
