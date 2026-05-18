-- TODO: copyright, license? --

library ieee;
use ieee.std_logic_1164.all;

library neorv32;
use neorv32.neorv32_package.all;

library neorv32;
use neorv32.neorv32_flatten_pkg.all;

entity neorv32_bus_gateway_wrap is
  generic (
    TMO_INT : natural; -- internal bus timeout cycles (0 = timeout disabled)
    TMO_EXT : natural; -- external bus timeout cycles (0 = timeout disabled)
    -- port A --
    A_EN    : boolean; -- port enable
    A_BASE  : std_ulogic_vector(31 downto 0); -- port address space base address
    A_SIZE  : natural; -- port address space size in bytes (power of two), aligned to size
    -- port B --
    B_EN    : boolean;
    B_BASE  : std_ulogic_vector(31 downto 0);
    B_SIZE  : natural;
    -- port C --
    C_EN    : boolean;
    C_BASE  : std_ulogic_vector(31 downto 0);
    C_SIZE  : natural;
    -- port X (the void) --
    X_EN    : boolean
  );
  port (
    -- global control --
    clk_i        : in  std_ulogic; -- global clock, rising edge
    rstn_i       : in  std_ulogic; -- global reset, low-active, async
    term_o       : out std_ulogic; -- terminate current bus access
    -- host port --
    host_req_flat_i   : in  std_ulogic_vector(81 downto 0);  -- host request
    host_rsp_flat_o   : out std_ulogic_vector(33 downto 0);  -- host response
    -- section ports --
    a_req_flat_o : out std_ulogic_vector(81 downto 0);
    a_rsp_flat_i : in  std_ulogic_vector(33 downto 0);
    b_req_flat_o : out std_ulogic_vector(81 downto 0);
    b_rsp_flat_i : in  std_ulogic_vector(33 downto 0);
    c_req_flat_o : out std_ulogic_vector(81 downto 0);
    c_rsp_flat_i : in  std_ulogic_vector(33 downto 0);
    x_req_flat_o : out std_ulogic_vector(81 downto 0);
    x_rsp_flat_i : in  std_ulogic_vector(33 downto 0)
  );
end neorv32_bus_gateway_wrap;

architecture neorv32_bus_gateway_wrap_rtl of neorv32_bus_gateway_wrap is

  signal host_req : bus_req_t;
  signal host_rsp : bus_rsp_t;
  signal a_req : bus_req_t;
  signal a_rsp : bus_rsp_t;
  signal b_req : bus_req_t;
  signal b_rsp : bus_rsp_t;
  signal c_req : bus_req_t;
  signal c_rsp : bus_rsp_t;
  signal x_req : bus_req_t;
  signal x_rsp : bus_rsp_t;

begin
  neorv32_bus_gateway_inst: entity neorv32.neorv32_bus_gateway
  generic map (
    TMO_INT => TMO_INT, -- internal bus timeout cycles (0 = timeout disabled)
    TMO_EXT => TMO_EXT, -- external bus timeout cycles (0 = timeout disabled)
    -- port A --
    A_EN    => A_EN, -- port enable
    A_BASE  => A_BASE, -- port address space base address
    A_SIZE  => A_SIZE, -- port address space size in bytes (power of two), aligned to size
    -- port B --
    B_EN    => B_EN,
    B_BASE  => B_BASE,
    B_SIZE  => B_SIZE,
    -- port C --
    C_EN    => C_EN,
    C_BASE  => C_BASE,
    C_SIZE  => C_SIZE,
    -- port X (the void) --
    X_EN    => X_EN
  )
  port map (
    -- global control --
    clk_i   => clk_i,
    rstn_i  => rstn_i,
    term_o  => term_o,
    -- host port --
    req_i   => host_req,
    rsp_o   => host_rsp,
    -- section ports --
    a_req_o => a_req,
    a_rsp_i => a_rsp,
    b_req_o => b_req,
    b_rsp_i => b_rsp,
    c_req_o => c_req,
    c_rsp_i => c_rsp,
    x_req_o => x_req,
    x_rsp_i => x_rsp
  );

  -- flatten the signals for compatibility with SystemVerilog --
  host_req <= unpack_bus_req(host_req_flat_i);
  host_rsp_flat_o <= pack_bus_rsp(host_rsp); 
  a_req_flat_o <= pack_bus_req(a_req);
  a_rsp <= unpack_bus_rsp(a_rsp_flat_i);
  b_req_flat_o <= pack_bus_req(b_req);
  b_rsp <= unpack_bus_rsp(b_rsp_flat_i);
  c_req_flat_o <= pack_bus_req(c_req);
  c_rsp <= unpack_bus_rsp(c_rsp_flat_i);
  x_req_flat_o <= pack_bus_req(x_req);
  x_rsp <= unpack_bus_rsp(x_rsp_flat_i);

end neorv32_bus_gateway_wrap_rtl;