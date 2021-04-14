library verilog;
use verilog.vl_types.all;
entity ARQ_Lab1 is
    port(
        CLK0            : out    vl_logic;
        Clock14         : in     vl_logic;
        Externo0        : in     vl_logic;
        Externo1        : in     vl_logic;
        Externo2        : in     vl_logic;
        Externo3        : in     vl_logic;
        Clock           : in     vl_logic;
        CLK1            : out    vl_logic;
        CLK2            : out    vl_logic;
        CLK3            : out    vl_logic;
        Q0              : out    vl_logic;
        Q1              : out    vl_logic;
        Q2              : out    vl_logic;
        Q3              : out    vl_logic;
        Write_Enable    : out    vl_logic;
        Cout            : out    vl_logic;
        N               : out    vl_logic;
        Z               : out    vl_logic;
        Enderecoteste   : out    vl_logic_vector(4 downto 0);
        Instrucao       : out    vl_logic_vector(9 downto 0);
        R0              : out    vl_logic_vector(3 downto 0);
        R1              : out    vl_logic_vector(3 downto 0);
        R2              : out    vl_logic_vector(3 downto 0);
        R3              : out    vl_logic_vector(3 downto 0)
    );
end ARQ_Lab1;
