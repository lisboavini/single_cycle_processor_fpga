library verilog;
use verilog.vl_types.all;
entity ARQ_Lab1_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        Clock14         : in     vl_logic;
        Externo0        : in     vl_logic;
        Externo1        : in     vl_logic;
        Externo2        : in     vl_logic;
        Externo3        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ARQ_Lab1_vlg_sample_tst;
