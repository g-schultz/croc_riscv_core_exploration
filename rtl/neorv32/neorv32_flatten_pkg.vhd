library ieee;
use ieee.std_logic_1164.all;

library neorv32;
use neorv32.neorv32_package.all;

package neorv32_flatten_pkg is

  function pack_bus_req   (rec : bus_req_t                      ) return std_ulogic_vector;
  function unpack_bus_req (flat : std_ulogic_vector(81 downto 0)) return bus_req_t;
  function pack_bus_rsp   (rec : bus_rsp_t                      ) return std_ulogic_vector;
  function unpack_bus_rsp (flat : std_ulogic_vector(33 downto 0)) return bus_rsp_t;

end neorv32_flatten_pkg;

package body neorv32_flatten_pkg is


  function pack_bus_req(rec : bus_req_t) return std_ulogic_vector is
    variable flat : std_ulogic_vector(81 downto 0); 
  begin
    flat(81 downto 77) := rec.meta;
    flat(76 downto 45) := rec.addr;
    flat(44 downto 13) := rec.data;
    flat(12 downto 9) := rec.ben;
    flat(8)            := rec.stb;
    flat(7)            := rec.rw;
    flat(6)            := rec.amo;
    flat(5 downto 2)   := rec.amoop;
    flat(1)            := rec.burst;
    flat(0)            := rec.lock;
    return flat;
  end function;

  function unpack_bus_req(flat : std_ulogic_vector(81 downto 0)) return bus_req_t is
    variable rec : bus_req_t;
  begin
    rec.meta  := flat(81 downto 77);
    rec.addr  := flat(76 downto 45);
    rec.data  := flat(44 downto 13);
    rec.ben   := flat(12 downto 9);
    rec.stb   := flat(8);
    rec.rw    := flat(7);
    rec.amo   := flat(6);
    rec.amoop := flat(5 downto 2);
    rec.burst := flat(1);
    rec.lock  := flat(0);
    return rec;
  end function;

  function pack_bus_rsp(rec : bus_rsp_t) return std_ulogic_vector is
    variable flat : std_ulogic_vector(33 downto 0);
  begin
    flat(33)          := rec.ack;
    flat(32)          := rec.err;
    flat(31 downto 0) := rec.data;
    return flat;
  end function;

  function unpack_bus_rsp(flat : std_ulogic_vector(33 downto 0)) return bus_rsp_t is
    variable rec : bus_rsp_t;
  begin
    rec.ack  := flat(33);
    rec.err  := flat(32);
    rec.data := flat(31 downto 0);
    return rec;
  end function;

end neorv32_flatten_pkg;