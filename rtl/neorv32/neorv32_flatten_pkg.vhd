library ieee;
use ieee.std_logic_1164.all;

library neorv32;
use neorv32.neorv32_package.all;

package neorv32_flatten_pkg is

  function pack_bus_req   (rec : bus_req_t                      ) return std_ulogic_vector;
  function unpack_bus_req (flat : std_ulogic_vector(82 downto 0)) return bus_req_t;
  function pack_bus_rsp   (rec : bus_rsp_t                      ) return std_ulogic_vector;
  function unpack_bus_rsp (flat : std_ulogic_vector(33 downto 0)) return bus_rsp_t;

end neorv32_flatten_pkg;

package body neorv32_flatten_pkg is


  function pack_bus_req(rec : bus_req_t) return std_ulogic_vector is
    variable flat : std_ulogic_vector(82 downto 0); 
  begin
    flat(82 downto 78) := rec.meta;
    flat(77 downto 46) := rec.addr;
    flat(45 downto 14) := rec.data;
    flat(13 downto 10) := rec.ben;
    flat(9)            := rec.stb;
    flat(8)            := rec.rw;
    flat(7)            := rec.amo;
    flat(6 downto 3)   := rec.amoop;
    flat(2)            := rec.burst;
    flat(1)            := rec.lock;
    flat(0)            := rec.fence;
    return flat;
  end function;

  function unpack_bus_req(flat : std_ulogic_vector(82 downto 0)) return bus_req_t is
    variable rec : bus_req_t;
  begin
    rec.meta  := flat(82 downto 78);
    rec.addr  := flat(77 downto 46);
    rec.data  := flat(45 downto 14);
    rec.ben   := flat(13 downto 10);
    rec.stb   := flat(9);
    rec.rw    := flat(8);
    rec.amo   := flat(7);
    rec.amoop := flat(6 downto 3);
    rec.burst := flat(2);
    rec.lock  := flat(1);
    rec.fence := flat(0);
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