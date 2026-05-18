-- TODO copyright license? --

library ieee;
use ieee.std_logic_1164.all;

library neorv32;
use neorv32.neorv32_package.all;

library neorv32;
use neorv32.neorv32_flatten_pkg.all;

entity neorv32_cpu_wrap is
  generic (
    -- General --
    HART_ID             : natural range 0 to 1;           -- hardware thread ID
    VENDOR_ID           : std_ulogic_vector(31 downto 0); -- vendor ID
    BOOT_ADDR           : std_ulogic_vector(31 downto 0); -- CPU boot address
    DEBUG_PARK_ADDR     : std_ulogic_vector(31 downto 0); -- CPU debug mode parking loop entry address
    DEBUG_EXC_ADDR      : std_ulogic_vector(31 downto 0); -- CPU debug mode exception entry address
    -- RISC-V ISA Extensions --
    RISCV_ISA_C         : boolean;                        -- compressed extension
    RISCV_ISA_E         : boolean;                        -- embedded RF extension
    RISCV_ISA_M         : boolean;                        -- mul/div extension
    RISCV_ISA_U         : boolean;                        -- user mode extension
    RISCV_ISA_Zaamo     : boolean;                        -- atomic read-modify-write operations extension
    RISCV_ISA_Zalrsc    : boolean;                        -- atomic reservation-set operations extension
    RISCV_ISA_Zba       : boolean;                        -- shifted-add bit-manipulation extension
    RISCV_ISA_Zbb       : boolean;                        -- basic bit-manipulation extension
    RISCV_ISA_Zbc       : boolean;                        -- carry-less multiplication instructions
    RISCV_ISA_Zbkb      : boolean;                        -- bit-manipulation instructions for cryptography
    RISCV_ISA_Zbkc      : boolean;                        -- carry-less multiplication instructions
    RISCV_ISA_Zbkx      : boolean;                        -- cryptography crossbar permutation extension
    RISCV_ISA_Zbs       : boolean;                        -- single-bit bit-manipulation extension
    RISCV_ISA_Zcb       : boolean;                        -- additional code size reduction instructions
    RISCV_ISA_Zfinx     : boolean;                        -- 32-bit floating-point extension
    RISCV_ISA_Zibi      : boolean;                        -- branch with immediate
    RISCV_ISA_Zicntr    : boolean;                        -- base counters
    RISCV_ISA_Zicond    : boolean;                        -- integer conditional operations
    RISCV_ISA_Zihpm     : boolean;                        -- hardware performance monitors
    RISCV_ISA_Zimop     : boolean;                        -- may-be-operations
    RISCV_ISA_Zknd      : boolean;                        -- cryptography NIST AES decryption extension
    RISCV_ISA_Zkne      : boolean;                        -- cryptography NIST AES encryption extension
    RISCV_ISA_Zknh      : boolean;                        -- cryptography NIST hash extension
    RISCV_ISA_Zksed     : boolean;                        -- ShangMi hash extension
    RISCV_ISA_Zksh      : boolean;                        -- ShangMi block cipher extension
    RISCV_ISA_Zmmul     : boolean;                        -- multiply-only M sub-extension
    RISCV_ISA_Sdext     : boolean;                        -- external debug mode extension
    RISCV_ISA_Sdtrig    : boolean;                        -- trigger module extension
    RISCV_ISA_Smcntrpmf : boolean;                        -- counter privilege-mode filtering
    RISCV_ISA_Smpmp     : boolean;                        -- physical memory protection
    RISCV_ISA_Xcfu      : boolean;                        -- custom (instr.) functions unit
    -- Tuning Options --
    CPU_TRACE_EN        : boolean;                        -- enable CPU execution trace generator
    CPU_CONSTT_BR_EN    : boolean;                        -- constant-time branches
    CPU_FAST_MUL_EN     : boolean;                        -- use DSPs for M extension's multiplier
    CPU_FAST_SHIFT_EN   : boolean;                        -- use barrel shifter for shift operations
    CPU_RF_ARCH_SEL     : natural range 0 to 3;           -- register file implementation style select
    -- Physical Memory Protection (PMP) --
    PMP_NUM_REGIONS     : natural range 0 to 16;          -- number of regions (0..16)
    PMP_MIN_GRANULARITY : natural;                        -- minimal region granularity in bytes, has to be a power of 2, min 4 bytes
    PMP_TOR_MODE_EN     : boolean;                        -- enable TOR mode
    PMP_NAP_MODE_EN     : boolean;                        -- enable NAPOT/NA4 modes
    -- Hardware Performance Monitors (HPM) --
    HPM_NUM_CNTS        : natural range 0 to 13;          -- number of implemented HPM counters (0..13)
    HPM_CNT_WIDTH       : natural range 0 to 64;          -- total size of HPM counters (0..64)
    -- Trigger Module (TM) --
    NUM_HW_TRIGGERS     : natural range 0 to 16           -- number of hardware triggers
  );
  port (
    -- global control --
    clk_i      : in  std_ulogic;                     -- global clock, rising edge
    rstn_i     : in  std_ulogic;                     -- global reset, low-active, async
    -- status --
    mtime_i    : in  std_ulogic_vector(63 downto 0); -- system time input from CLINT/MTIME
    trace_o    : out trace_port_t;                   -- execution trace port (enabled when CPU_TRACE_EN = true)
    sleep_o    : out std_ulogic;                     -- CPU is in sleep mode
    fence_o    : out std_ulogic_vector(1 downto 0);  --
    -- interrupts --
    msi_i      : in  std_ulogic;                     -- RISC-V machine software interrupt
    mei_i      : in  std_ulogic;                     -- RISC-V machine external interrupt
    mti_i      : in  std_ulogic;                     -- RISC-V machine timer interrupt
    firq_i     : in  std_ulogic_vector(15 downto 0); -- custom fast interrupts
    dbi_i      : in  std_ulogic;                     -- RISC-V debug halt request interrupt
    -- instruction bus interface --
    ibus_req_flat_o : out std_ulogic_vector(81 downto 0);                      -- request bus
    ibus_rsp_flat_i : in  std_ulogic_vector(33 downto 0);                      -- response bus
    -- data bus interface --
    dbus_req_flat_o : out std_ulogic_vector(81 downto 0);                      -- request bus
    dbus_rsp_flat_i : in  std_ulogic_vector(33 downto 0)                       -- response bus
  );
end neorv32_cpu_wrap;

architecture neorv32_cpu_wrap_rtl of neorv32_cpu_wrap is

  signal ibus_req : bus_req_t;
  signal ibus_rsp : bus_rsp_t;

  signal dbus_req : bus_req_t;
  signal dbus_rsp : bus_rsp_t;

begin

  neorv32_cpu_inst: entity neorv32.neorv32_cpu
  generic map (
    -- General --
    HART_ID             => HART_ID,             -- hardware thread ID
    VENDOR_ID           => VENDOR_ID,           -- vendor ID
    BOOT_ADDR           => BOOT_ADDR,           -- CPU boot address
    DEBUG_PARK_ADDR     => DEBUG_PARK_ADDR,     -- CPU debug mode parking loop entry address
    DEBUG_EXC_ADDR      => DEBUG_EXC_ADDR,      -- CPU debug mode exception entry address
    -- RISC-V ISA Extensions --
    RISCV_ISA_C         => RISCV_ISA_C,         -- compressed extension
    RISCV_ISA_E         => RISCV_ISA_E,         -- embedded RF extension
    RISCV_ISA_M         => RISCV_ISA_M,         -- mul/div extension
    RISCV_ISA_U         => RISCV_ISA_U,         -- user mode extension
    RISCV_ISA_Zaamo     => RISCV_ISA_Zaamo,     -- atomic read-modify-write operations extension
    RISCV_ISA_Zalrsc    => RISCV_ISA_Zalrsc,    -- atomic reservation-set operations extension
    RISCV_ISA_Zba       => RISCV_ISA_Zba,       -- shifted-add bit-manipulation extension
    RISCV_ISA_Zbb       => RISCV_ISA_Zbb,       -- basic bit-manipulation extension
    RISCV_ISA_Zbc       => RISCV_ISA_Zbc,       -- carry-less multiplication instructions
    RISCV_ISA_Zbkb      => RISCV_ISA_Zbkb,      -- bit-manipulation instructions for cryptography
    RISCV_ISA_Zbkc      => RISCV_ISA_Zbkc,      -- carry-less multiplication instructions
    RISCV_ISA_Zbkx      => RISCV_ISA_Zbkx,      -- cryptography crossbar permutation extension
    RISCV_ISA_Zbs       => RISCV_ISA_Zbs,       -- single-bit bit-manipulation extension
    RISCV_ISA_Zcb       => RISCV_ISA_Zcb,       -- additional code size reduction instructions
    RISCV_ISA_Zfinx     => RISCV_ISA_Zfinx,     -- 32-bit floating-point extension
    RISCV_ISA_Zibi      => RISCV_ISA_Zibi,      -- branch with immediate
    RISCV_ISA_Zicntr    => RISCV_ISA_Zicntr,    -- base counters
    RISCV_ISA_Zicond    => RISCV_ISA_Zicond,    -- integer conditional operations
    RISCV_ISA_Zihpm     => RISCV_ISA_Zihpm,     -- hardware performance monitors
    RISCV_ISA_Zimop     => RISCV_ISA_Zimop,     -- may-be-operations
    RISCV_ISA_Zknd      => RISCV_ISA_Zknd,      -- cryptography NIST AES decryption extension
    RISCV_ISA_Zkne      => RISCV_ISA_Zkne,      -- cryptography NIST AES encryption extension
    RISCV_ISA_Zknh      => RISCV_ISA_Zknh,      -- cryptography NIST hash extension
    RISCV_ISA_Zksed     => RISCV_ISA_Zksed,     -- ShangMi hash extension
    RISCV_ISA_Zksh      => RISCV_ISA_Zksh,      -- ShangMi block cipher extension
    RISCV_ISA_Zmmul     => RISCV_ISA_Zmmul,     -- multiply-only M sub-extension
    RISCV_ISA_Sdext     => RISCV_ISA_Sdext,     -- external debug mode extension
    RISCV_ISA_Sdtrig    => RISCV_ISA_Sdtrig,    -- trigger module extension
    RISCV_ISA_Smcntrpmf => RISCV_ISA_Smcntrpmf, -- counter privilege-mode filtering
    RISCV_ISA_Smpmp     => RISCV_ISA_Smpmp,     -- physical memory protection
    RISCV_ISA_Xcfu      => RISCV_ISA_Xcfu,      -- custom (instr.) functions unit
    -- Tuning Options --
    CPU_TRACE_EN        => CPU_TRACE_EN,        -- enable CPU execution trace generator
    CPU_CONSTT_BR_EN    => CPU_CONSTT_BR_EN,    -- constant-time branches
    CPU_FAST_MUL_EN     => CPU_FAST_MUL_EN,     -- use DSPs for M extension's multiplier
    CPU_FAST_SHIFT_EN   => CPU_FAST_SHIFT_EN,   -- use barrel shifter for shift operations
    CPU_RF_ARCH_SEL     => CPU_RF_ARCH_SEL,     -- register file implementation style select
    -- Physical Memory Protection (PMP) --
    PMP_NUM_REGIONS     => PMP_NUM_REGIONS,     -- number of regions (0..16)
    PMP_MIN_GRANULARITY => PMP_MIN_GRANULARITY, -- minimal region granularity in bytes, has to be a power of 2, min 4 bytes
    PMP_TOR_MODE_EN     => PMP_TOR_MODE_EN,     -- enable TOR mode
    PMP_NAP_MODE_EN     => PMP_NAP_MODE_EN,     -- enable NAPOT/NA4 modes
    -- Hardware Performance Monitors (HPM) --
    HPM_NUM_CNTS        => HPM_NUM_CNTS,        -- number of implemented HPM counters (0..13)
    HPM_CNT_WIDTH       => HPM_CNT_WIDTH,       -- total size of HPM counters (0..64)
    -- Trigger Module (TM) --
    NUM_HW_TRIGGERS     => NUM_HW_TRIGGERS      -- number of hardware triggers
  )
  port map (
    -- global control --
    clk_i      => clk_i,    -- global clock, rising edge
    rstn_i     => rstn_i,   -- global reset, low-active, async
    -- status --
    mtime_i    => mtime_i,  -- system time input from CLINT/MTIME
    trace_o    => trace_o,  -- execution trace port (enabled when CPU_TRACE_EN = true)
    sleep_o    => sleep_o,  -- CPU is in sleep mode
    fence_o    => fence_o,  --    
    -- interrupts --
    msi_i      => msi_i,    -- RISC-V machine software interrupt
    mei_i      => mei_i,    -- RISC-V machine external interrupt
    mti_i      => mti_i,    -- RISC-V machine timer interrupt
    firq_i     => firq_i,   -- custom fast interrupts
    dbi_i      => dbi_i,    -- RISC-V debug halt request interrupt
    -- instruction bus interface --
    ibus_req_o => ibus_req, -- request bus
    ibus_rsp_i => ibus_rsp, -- response bus
    -- data bus interface --
    dbus_req_o => dbus_req, -- request bus
    dbus_rsp_i => dbus_rsp  -- response bus
  );

  -- flatten the signals for compatibility with SystemVerilog --
  ibus_req_flat_o <= pack_bus_req(ibus_req);
  ibus_rsp <= unpack_bus_rsp(ibus_rsp_flat_i);

  dbus_req_flat_o <= pack_bus_req(dbus_req);
  dbus_rsp <= unpack_bus_rsp(dbus_rsp_flat_i);

end neorv32_cpu_wrap_rtl;