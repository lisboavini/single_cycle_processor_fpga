library verilog;
use verilog.vl_types.all;
entity Registrador_4_bits is
    port(
        O               : out    vl_logic_vector(3 downto 0);
        Clear           : in     vl_logic;
        Clock           : in     vl_logic;
        A               : in     vl_logic_vector(3 downto 0)
    );
end Registrador_4_bits;
