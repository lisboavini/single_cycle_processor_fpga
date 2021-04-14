library verilog;
use verilog.vl_types.all;
entity ARQ_Lab1_vlg_check_tst is
    port(
        CLK0            : in     vl_logic;
        CLK1            : in     vl_logic;
        CLK2            : in     vl_logic;
        CLK3            : in     vl_logic;
        Cout            : in     vl_logic;
        Enderecoteste   : in     vl_logic_vector(4 downto 0);
        Instrucao       : in     vl_logic_vector(9 downto 0);
        N               : in     vl_logic;
        Q0              : in     vl_logic;
        Q1              : in     vl_logic;
        Q2              : in     vl_logic;
        Q3              : in     vl_logic;
        R0              : in     vl_logic_vector(3 downto 0);
        R1              : in     vl_logic_vector(3 downto 0);
        R2              : in     vl_logic_vector(3 downto 0);
        R3              : in     vl_logic_vector(3 downto 0);
        Write_Enable    : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ARQ_Lab1_vlg_check_tst;
