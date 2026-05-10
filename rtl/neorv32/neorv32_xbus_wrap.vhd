library ieee;
use ieee.std_logic_1164.all;

library neorv32;
use neorv32.neorv32_package.all;

library neorv32;
use neorv32.neorv32_flatten_pkg.all;

entity neorv32_xbus_wrap is
  generic (
    REGSTAGE_EN : boolean -- add XBUS register stages
  );
  port (
    clk_i           : in  std_ulogic;                     -- global clock line
    rstn_i          : in  std_ulogic;                     -- global reset line, low-active
    bus_term_i      : in  std_ulogic;                     -- terminate current bus access
    bus_req_flat_i  : in  std_ulogic_vector(82 downto 0); -- bus request
    bus_rsp_flat_o  : out std_ulogic_vector(33 downto 0); -- bus response
    xbus_adr_o      : out std_ulogic_vector(31 downto 0); -- address
    xbus_dat_i      : in  std_ulogic_vector(31 downto 0); -- read data
    xbus_dat_o      : out std_ulogic_vector(31 downto 0); -- write data
    xbus_cti_o      : out std_ulogic_vector(2 downto 0);  -- cycle type
    xbus_tag_o      : out std_ulogic_vector(2 downto 0);  -- access tag
    xbus_we_o       : out std_ulogic;                     -- read/write
    xbus_sel_o      : out std_ulogic_vector(3 downto 0);  -- byte enable
    xbus_stb_o      : out std_ulogic;                     -- strobe
    xbus_cyc_o      : out std_ulogic;                     -- valid cycle
    xbus_ack_i      : in  std_ulogic;                     -- transfer acknowledge
    xbus_err_i      : in  std_ulogic                      -- transfer error
  );
end neorv32_xbus_wrap;

architecture neorv32_xbus_wrap_rtl of neorv32_xbus_wrap is

  signal bus_req : bus_req_t;
  signal bus_rsp : bus_rsp_t;

begin

  neorv_xbus_inst: entity neorv32.neorv32_xbus
  generic map (
    REGSTAGE_EN => REGSTAGE_EN
  )
  port map (
    clk_i      => clk_i,
    rstn_i     => rstn_i,
    bus_term_i => bus_term_i,
    bus_req_i  => bus_req,
    bus_rsp_o  => bus_rsp,
    xbus_adr_o => xbus_adr_o,
    xbus_dat_i => xbus_dat_i,
    xbus_dat_o => xbus_dat_o,
    xbus_cti_o => xbus_cti_o,
    xbus_tag_o => xbus_tag_o,
    xbus_we_o  => xbus_we_o,
    xbus_sel_o => xbus_sel_o,
    xbus_stb_o => xbus_stb_o,
    xbus_cyc_o => xbus_cyc_o,
    xbus_ack_i => xbus_ack_i,
    xbus_err_i => xbus_err_i
  );

  -- flatten the signals for compatibility with SystemVerilog --
  bus_rsp_flat_o <= pack_bus_rsp(bus_rsp);
  bus_req <= unpack_bus_req(bus_req_flat_i);  

end neorv32_xbus_wrap_rtl;