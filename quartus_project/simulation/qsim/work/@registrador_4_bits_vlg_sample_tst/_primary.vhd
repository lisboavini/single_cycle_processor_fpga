library verilog;
use verilog.vl_types.all;
entity Registrador_4_bits_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        Clear           : in     vl_logic;
        Clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Registrador_4_bits_vlg_sample_tst;
