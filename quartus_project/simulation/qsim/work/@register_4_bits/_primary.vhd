library verilog;
use verilog.vl_types.all;
entity Register_4_bits is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        clock           : in     vl_logic;
        Clear           : in     vl_logic;
        O               : out    vl_logic_vector(3 downto 0)
    );
end Register_4_bits;
