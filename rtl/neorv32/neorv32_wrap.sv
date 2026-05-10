//TODO: copyright, license

module neorv32_wrap import croc_pkg::*; #(
  // General
  parameter int unsigned HART_ID             = 0,     // : natural range 0 to 1;           -- hardware thread ID
  parameter logic [31:0] VENDOR_ID           = 32'd0, // : std_ulogic_vector(31 downto 0); -- vendor ID
  parameter logic [31:0] BOOT_ADDR           = 32'd0, // : std_ulogic_vector(31 downto 0); -- CPU boot address
  parameter logic [31:0] DEBUG_PARK_ADDR     = 32'd0, // : std_ulogic_vector(31 downto 0); -- CPU debug mode parking loop entry address
  parameter logic [31:0] DEBUG_EXC_ADDR      = 32'd0, // : std_ulogic_vector(31 downto 0); -- CPU debug mode exception entry address
  //  RISC-V ISA Extensions TODO check which ones can be really used
  parameter bit RISCV_ISA_C                  = 0, // : boolean;                        -- compressed extension
  parameter bit RISCV_ISA_E                  = 0, // : boolean;                        -- embedded RF extension
  parameter bit RISCV_ISA_M                  = 0, // : boolean;                        -- mul/div extension
  parameter bit RISCV_ISA_U                  = 0, // : boolean;                        -- user mode extension
  // parameter bit RISCV_ISA_Zaamo              = 0, // : boolean;                        -- atomic read-modify-write operations extension
  // parameter bit RISCV_ISA_Zalrsc             = 0, // : boolean;                        -- atomic reservation-set operations extension
  parameter bit RISCV_ISA_Zba                = 0, // : boolean;                        -- shifted-add bit-manipulation extension
  parameter bit RISCV_ISA_Zbb                = 0, // : boolean;                        -- basic bit-manipulation extension
  parameter bit RISCV_ISA_Zbkb               = 0, // : boolean;                        -- bit-manipulation instructions for cryptography
  parameter bit RISCV_ISA_Zbkc               = 0, // : boolean;                        -- carry-less multiplication instructions
  parameter bit RISCV_ISA_Zbkx               = 0, // : boolean;                        -- cryptography crossbar permutation extension
  parameter bit RISCV_ISA_Zbs                = 0, // : boolean;                        -- single-bit bit-manipulation extension
  parameter bit RISCV_ISA_Zcb                = 0, // : boolean;                        -- additional code size reduction instructions
  parameter bit RISCV_ISA_Zfinx              = 0, // : boolean;                        -- 32-bit floating-point extension
  parameter bit RISCV_ISA_Zibi               = 0, // : boolean;                        -- branch with immediate
  parameter bit RISCV_ISA_Zicntr             = 0, // : boolean;                        -- base counters
  parameter bit RISCV_ISA_Zicond             = 0, // : boolean;                        -- integer conditional operations
  parameter bit RISCV_ISA_Zihpm              = 0, // : boolean;                        -- hardware performance monitors
  parameter bit RISCV_ISA_Zimop              = 0, // : boolean;                        -- may-be-operations
  parameter bit RISCV_ISA_Zknd               = 0, // : boolean;                        -- cryptography NIST AES decryption extension
  parameter bit RISCV_ISA_Zkne               = 0, // : boolean;                        -- cryptography NIST AES encryption extension
  parameter bit RISCV_ISA_Zknh               = 0, // : boolean;                        -- cryptography NIST hash extension
  parameter bit RISCV_ISA_Zksed              = 0, // : boolean;                        -- ShangMi hash extension
  parameter bit RISCV_ISA_Zksh               = 0, // : boolean;                        -- ShangMi block cipher extension
  parameter bit RISCV_ISA_Zmmul              = 0, // : boolean;                        -- multiply-only M sub-extension
  parameter bit RISCV_ISA_Sdext              = 0, // : boolean;                        -- external debug mode extension
  parameter bit RISCV_ISA_Sdtrig             = 0, // : boolean;                        -- trigger module extension
  parameter bit RISCV_ISA_Smcntrpmf          = 0, // : boolean;                        -- counter privilege-mode filtering
  parameter bit RISCV_ISA_Smpmp              = 0, // : boolean;                        -- physical memory protection
  parameter bit RISCV_ISA_Xcfu               = 0, // : boolean;                        -- custom (instr.) functions unit
  //  Tuning Options
  parameter bit CPU_TRACE_EN                 = 0, // : boolean;                        -- enable CPU execution trace generator
  parameter bit CPU_CONSTT_BR_EN             = 0, // : boolean;                        -- constant-time branches
  parameter bit CPU_FAST_MUL_EN              = 0, // : boolean;                        -- use DSPs for M extension's multiplier
  parameter bit CPU_FAST_SHIFT_EN            = 0, // : boolean;                        -- use barrel shifter for shift operations
  parameter int unsigned CPU_RF_ARCH_SEL     = 0, // : natural range 0 to 3;           -- register file implementation style select
  //  Physical Memory Protection (PMP)
  parameter int unsigned PMP_NUM_REGIONS     = 0, // : natural range 0 to 16;          -- number of regions (0..16)
  parameter int unsigned PMP_MIN_GRANULARITY = 0, // : natural;                        -- minimal region granularity in bytes, has to be a power of 2, min 4 bytes
  parameter bit PMP_TOR_MODE_EN              = 0, // : boolean;                        -- enable TOR mode
  parameter bit PMP_NAP_MODE_EN              = 0, // : boolean;                        -- enable NAPOT/NA4 modes
  //  Hardware Performance Monitors (HPM)
  parameter int unsigned HPM_NUM_CNTS        = 0, // : natural range 0 to 13;          -- number of implemented HPM counters (0..13)
  parameter int unsigned HPM_CNT_WIDTH       = 0, // : natural range 0 to 64;          -- total size of HPM counters (0..64)
  //  Trigger Module (TM)
  parameter int unsigned NUM_HW_TRIGGERS     = 0 // : natural range 0 to 16           -- number of hardware triggers
) (
  // Global control
  input  logic clk_i,
  input  logic rst_ni,
  input  logic test_enable_i,

  // Status
  // output trace_port_t trace_o,   // execution trace port (enabled when CPU_TRACE_EN = true)
  output logic        sleep_o,   // CPU is in sleep mode

  // Interrupts
  input  logic         msi_i,      // RISC-V machine software interrupt
  input  logic         mei_i,      // RISC-V machine external interrupt
  input  logic         mti_i,      // RISC-V machine timer interrupt
  input  logic [15:0 ] firq_i,     // custom fast interrupts

  // Debug interface
  input  logic        dbi_i,      // RISC-V debug halt request interrupt

  // Instruction memory interface (OBI)
  output logic        instr_req_o,
  input  logic        instr_gnt_i,
  input  logic        instr_rvalid_i,
  output logic [31:0] instr_addr_o,
  input  logic [31:0] instr_rdata_i,
  input  logic        instr_err_i,

  // Data memory interface (OBI)
  output logic        data_req_o,
  input  logic        data_gnt_i,
  input  logic        data_rvalid_i,
  output logic        data_we_o,
  output logic [3:0]  data_be_o,
  output logic [31:0] data_addr_o,
  output logic [31:0] data_wdata_o,
  input  logic [31:0] data_rdata_i,
  input  logic        data_err_i
);

// typedef struct packed {
//   logic [4:0]  meta;  // access meta data: core_ID[2], debug[1], priv[1], instr/data[1]
//   logic [31:0] addr;  // access address
//   logic [31:0] data;  // write data
//   logic [3:0]  ben;   // byte enable
//   logic        stb;   // request strobe, single-shot
//   logic        rw;    // 0 = read, 1 = write
//   logic        amo;   // set if atomic memory operation
//   logic [3:0]  amoop; // type of atomic memory operation
//   logic        burst; // set if part of burst access
//   logic        lock;  // set if exclusive access request
//   // out-of-band signals
//   logic        fence; // set if fence(.i) operation, single-shot
// } bus_req_t;

// typedef struct packed {
//   logic        ack;  // set if access acknowledge, single-shot
//   logic        err;  // set if access error, valid if ack = 1
//   logic [31:0] data; // read data, valid if ack = 1
// } bus_rsp_t;

logic [82:0] instr_bus_req;
logic [33:0] instr_bus_rsp;

logic [82:0] data_bus_req;
logic [33:0] data_bus_rsp;

logic [82:0] data_xbus_req;
logic [33:0] data_xbus_rsp;

logic [82:0] instr_xbus_req;
logic [33:0] instr_xbus_rsp;

logic     instr_xbus_terminate;
logic     data_xbus_terminate;

neorv32_cpu_wrap #(
  // General
  .HART_ID             ( HART_ID         ), // hardware thread ID
  .VENDOR_ID           ( VENDOR_ID       ), // vendor ID
  .BOOT_ADDR           ( BOOT_ADDR       ), // CPU boot address
  .DEBUG_PARK_ADDR     ( DEBUG_PARK_ADDR ), // CPU debug mode parking loop entry address
  .DEBUG_EXC_ADDR      ( DEBUG_EXC_ADDR  ), // CPU debug mode exception entry address

  // RISC-V ISA Extensions
  .RISCV_ISA_C         ( RISCV_ISA_C         ), // compressed extension
  .RISCV_ISA_E         ( RISCV_ISA_E         ), // embedded RF extension
  .RISCV_ISA_M         ( RISCV_ISA_M         ), // mul/div extension
  .RISCV_ISA_U         ( RISCV_ISA_U         ), // user mode extension
  .RISCV_ISA_Zaamo     ( 0                   ), // atomic read-modify-write operations extension
  .RISCV_ISA_Zalrsc    ( 0                   ), // atomic reservation-set operations extension
  .RISCV_ISA_Zba       ( RISCV_ISA_Zba       ), // shifted-add bit-manipulation extension
  .RISCV_ISA_Zbb       ( RISCV_ISA_Zbb       ), // basic bit-manipulation extension
  .RISCV_ISA_Zbkb      ( RISCV_ISA_Zbkb      ), // bit-manipulation instructions for cryptography
  .RISCV_ISA_Zbkc      ( RISCV_ISA_Zbkc      ), // carry-less multiplication instructions
  .RISCV_ISA_Zbkx      ( RISCV_ISA_Zbkx      ), // cryptography crossbar permutation extension
  .RISCV_ISA_Zbs       ( RISCV_ISA_Zbs       ), // single-bit bit-manipulation extension
  .RISCV_ISA_Zcb       ( RISCV_ISA_Zcb       ), // additional code size reduction instructions
  .RISCV_ISA_Zfinx     ( RISCV_ISA_Zfinx     ), // 32-bit floating-point extension
  .RISCV_ISA_Zibi      ( RISCV_ISA_Zibi      ), // branch with immediate
  .RISCV_ISA_Zicntr    ( RISCV_ISA_Zicntr    ), // base counters
  .RISCV_ISA_Zicond    ( RISCV_ISA_Zicond    ), // integer conditional operations
  .RISCV_ISA_Zihpm     ( RISCV_ISA_Zihpm     ), // hardware performance monitors
  .RISCV_ISA_Zimop     ( RISCV_ISA_Zimop     ), // may-be-operations
  .RISCV_ISA_Zknd      ( RISCV_ISA_Zknd      ), // cryptography NIST AES decryption extension
  .RISCV_ISA_Zkne      ( RISCV_ISA_Zkne      ), // cryptography NIST AES encryption extension
  .RISCV_ISA_Zknh      ( RISCV_ISA_Zknh      ), // cryptography NIST hash extension
  .RISCV_ISA_Zksed     ( RISCV_ISA_Zksed     ), // ShangMi hash extension
  .RISCV_ISA_Zksh      ( RISCV_ISA_Zksh      ), // ShangMi block cipher extension
  .RISCV_ISA_Zmmul     ( RISCV_ISA_Zmmul     ), // multiply-only M sub-extension
  .RISCV_ISA_Sdext     ( RISCV_ISA_Sdext     ), // external debug mode extension
  .RISCV_ISA_Sdtrig    ( RISCV_ISA_Sdtrig    ), // trigger module extension
  .RISCV_ISA_Smcntrpmf ( RISCV_ISA_Smcntrpmf ), // counter privilege-mode filtering
  .RISCV_ISA_Smpmp     ( RISCV_ISA_Smpmp     ), // physical memory protection
  .RISCV_ISA_Xcfu      ( RISCV_ISA_Xcfu      ), // custom (instr.) functions unit

  // Tuning Options
  .CPU_TRACE_EN        ( CPU_TRACE_EN      ), // enable CPU execution trace generator
  .CPU_CONSTT_BR_EN    ( CPU_CONSTT_BR_EN  ), // constant-time branches
  .CPU_FAST_MUL_EN     ( CPU_FAST_MUL_EN   ), // use DSPs for M extension's multiplier
  .CPU_FAST_SHIFT_EN   ( CPU_FAST_SHIFT_EN ), // use barrel shifter for shift operations
  .CPU_RF_ARCH_SEL     ( CPU_RF_ARCH_SEL   ), // register file implementation style select

  // Physical Memory Protection (PMP)
  .PMP_NUM_REGIONS     ( PMP_NUM_REGIONS     ), // number of regions (0..16)
  .PMP_MIN_GRANULARITY ( PMP_MIN_GRANULARITY ), // minimal region granularity in bytes, has to be a power of 2, min 4 bytes
  .PMP_TOR_MODE_EN     ( PMP_TOR_MODE_EN     ), // enable TOR mode
  .PMP_NAP_MODE_EN     ( PMP_NAP_MODE_EN     ), // enable NAPOT/NA4 modes

  // Hardware Performance Monitors (HPM)
  .HPM_NUM_CNTS        ( HPM_NUM_CNTS  ), // number of implemented HPM counters (0..13)
  .HPM_CNT_WIDTH       ( HPM_CNT_WIDTH ), // total size of HPM counters (0..64)

  // Trigger Module (TM)
  .NUM_HW_TRIGGERS     ( NUM_HW_TRIGGERS )  // number of hardware triggers
) i_neorv32_cpu (
  //global control
  .clk_i,   // global clock, rising edge
  .rstn_i (rst_ni),  // global reset, low-active, async

  //status
  .trace_o (), // execution trace port (enabled when CPU_TRACE_EN = true)
  .sleep_o, // CPU is in sleep mode

  //interrupts
  .msi_i,  // RISC-V machine software interrupt
  .mei_i,  // RISC-V machine external interrupt
  .mti_i,  // RISC-V machine timer interrupt
  .firq_i, // custom fast interrupts
  .dbi_i,  // RISC-V debug halt request interrupt

  // instruction bus interface
  .ibus_req_flat_o ( instr_bus_req ), // request bus
  .ibus_rsp_flat_i ( instr_bus_rsp ), // response bus

  // data bus interface
  .dbus_req_flat_o ( data_bus_req ), // request bus
  .dbus_rsp_flat_i ( data_bus_rsp )  // response bus
);

neorv32_bus_gateway_wrap #(
  .TMO_INT ( 0     ), // int unsigned // internal bus timeout cycles (0 = timeout disabled)
  .TMO_EXT ( 0     ), // int unsigned // external bus timeout cycles (0 = timeout disabled)
  // port A
  .A_EN    ( 0     ), // bit       // port enable
  .A_BASE  ( 32'd0 ), // logic [31:0] // port address space base address
  .A_SIZE  ( 0     ), // int unsigned // port address space size in bytes (power of two), aligned to size
  // port B
  .B_EN    ( 0     ), // bit
  .B_BASE  ( 32'd0 ), // logic [31:0]
  .B_SIZE  ( 0     ), // int unsigned
  // port C
  .C_EN    ( 0     ), // bit
  .C_BASE  ( 32'd0 ), // logic [31:0]
  .C_SIZE  ( 0     ), // int unsigned
  // port X (the void)
  .X_EN    ( 1     ) // bit
) i_data_bus_gateway (
  // global control
  .clk_i,  // logic;      // global clock, rising edge
  .rstn_i ( rst_ni ), // logic;      // global reset, low-active, async
  .term_o ( data_xbus_terminate ), // logic;      // terminate current bus access

  // host port
  .host_req_flat_i   ( data_bus_req ), // bus_req_t;  // host request
  .host_rsp_flat_o   ( data_bus_rsp ), // bus_rsp_t;  // host response

  // section ports
  .a_req_flat_o (), // bus_req_t;
  .a_rsp_flat_i (), // bus_rsp_t;
  .b_req_flat_o (), // bus_req_t;
  .b_rsp_flat_i (), // bus_rsp_t;
  .c_req_flat_o (), // bus_req_t;
  .c_rsp_flat_i (), // bus_rsp_t;
  .x_req_flat_o ( data_xbus_req ), // bus_req_t;
  .x_rsp_flat_i ( data_xbus_rsp ) // bus_rsp_t
);

neorv32_bus_gateway_wrap #(
  .TMO_INT ( 0     ), // int unsigned // internal bus timeout cycles (0 = timeout disabled)
  .TMO_EXT ( 0     ), // int unsigned // external bus timeout cycles (0 = timeout disabled)
  // port A
  .A_EN    ( 0     ), // bit       // port enable
  .A_BASE  ( 32'd0 ), // logic [31:0] // port address space base address
  .A_SIZE  ( 0     ), // int unsigned // port address space size in bytes (power of two), aligned to size
  // port B
  .B_EN    ( 0     ), // bit
  .B_BASE  ( 32'd0 ), // logic [31:0]
  .B_SIZE  ( 0     ), // int unsigned
  // port C
  .C_EN    ( 0     ), // bit
  .C_BASE  ( 32'd0 ), // logic [31:0]
  .C_SIZE  ( 0     ), // int unsigned
  // port X (the void)
  .X_EN    ( 1     ) // bit
) i_instr_bus_gateway (
  // global control
  .clk_i, // logic;      // global clock, rising edge
  .rstn_i (rst_ni ), // logic;      // global reset, low-active, async
  .term_o ( instr_xbus_terminate ), // logic;      // terminate current bus access

  // host port
  .host_req_flat_i   ( instr_bus_req ), // bus_req_t;  // host request
  .host_rsp_flat_o   ( instr_bus_rsp ), // bus_rsp_t;  // host response

  // section ports
  .a_req_flat_o (), // bus_req_t;
  .a_rsp_flat_i (), // bus_rsp_t;
  .b_req_flat_o (), // bus_req_t;
  .b_rsp_flat_i (), // bus_rsp_t;
  .c_req_flat_o (), // bus_req_t;
  .c_rsp_flat_i (), // bus_rsp_t;
  .x_req_flat_o ( instr_xbus_req ), // bus_req_t;
  .x_rsp_flat_i ( instr_xbus_rsp ) // bus_rsp_t
);

logic [31:0] data_xbus_adr;
logic [31:0] data_xbus_dat_o;
logic [31:0] data_xbus_dat_i;
logic [2:0]  data_xbus_cti;
logic [2:0]  data_xbus_tag;
logic        data_xbus_we;   
logic [3:0]  data_xbus_sel;
logic        data_xbus_stb;  
logic        data_xbus_cyc;  
logic        data_xbus_ack;  
logic        data_xbus_err;  

logic [31:0] instr_xbus_adr;
logic [31:0] instr_xbus_dat_o;
logic [31:0] instr_xbus_dat_i;
logic [2:0]  instr_xbus_cti;
logic [2:0]  instr_xbus_tag;
logic        instr_xbus_we;             
logic [3:0]  instr_xbus_sel;
logic        instr_xbus_stb;             
logic        instr_xbus_cyc;             
logic        instr_xbus_ack;             
logic        instr_xbus_err;   

neorv32_xbus_wrap #(
  .REGSTAGE_EN ( 0 ) //TODO add to module parameters?
) i_neorv32_data_xbus (
  .clk_i,         // global clock line
  .rstn_i ( rst_ni ),        // global reset line, low-active
  .bus_term_i ( data_xbus_terminate ), // : in  std_ulogic;                     -- terminate current bus access
  .bus_req_flat_i  ( data_xbus_req   ), // : in  bus_req_t;                      -- bus request
  .bus_rsp_flat_o  ( data_xbus_rsp   ), // : out bus_rsp_t;                      -- bus response
  .xbus_adr_o ( data_xbus_adr   ), // : out std_ulogic_vector(31 downto 0); -- address
  .xbus_dat_o ( data_xbus_dat_o ), // : out std_ulogic_vector(31 downto 0); -- write data
  .xbus_cti_o ( data_xbus_cti   ), // : out std_ulogic_vector(2 downto 0);  -- cycle type
  .xbus_tag_o ( data_xbus_tag   ), // : out std_ulogic_vector(2 downto 0);  -- access tag
  .xbus_we_o  ( data_xbus_we    ), // : out std_ulogic;                     -- read/write
  .xbus_sel_o ( data_xbus_sel   ), // : out std_ulogic_vector(3 downto 0);  -- byte enable
  .xbus_stb_o ( data_xbus_stb   ), // : out std_ulogic;                     -- strobe
  .xbus_cyc_o ( data_xbus_cyc   ), // : out std_ulogic;                     -- valid cycle
  .xbus_dat_i ( data_xbus_dat_i ), // : in  std_ulogic_vector(31 downto 0); -- read data
  .xbus_ack_i ( data_xbus_ack   ), // : in  std_ulogic;                     -- transfer acknowledge
  .xbus_err_i ( data_xbus_err   ) // : in  std_ulogic                      -- transfer error
);

neorv32_xbus_wrap #(
  .REGSTAGE_EN ( 0 ) //TODO add to module parameters?
) i_neorv32_instr_xbus (
  .clk_i,         // global clock line
  .rstn_i (rst_ni ),        // global reset line, low-active
  .bus_term_i ( instr_xbus_terminate ), // : in  std_ulogic;                     -- terminate current bus access
  .bus_req_flat_i  ( instr_xbus_req       ), // : in  bus_req_t;                      -- bus request
  .bus_rsp_flat_o  ( instr_xbus_rsp       ), // : out bus_rsp_t;                      -- bus response
  .xbus_adr_o ( instr_xbus_adr       ), // : out std_ulogic_vector(31 downto 0); -- address
  .xbus_dat_o ( instr_xbus_dat_o     ), // : out std_ulogic_vector(31 downto 0); -- write data
  .xbus_cti_o ( instr_xbus_cti       ), // : out std_ulogic_vector(2 downto 0);  -- cycle type
  .xbus_tag_o ( instr_xbus_tag       ), // : out std_ulogic_vector(2 downto 0);  -- access tag
  .xbus_we_o  ( instr_xbus_we        ), // : out std_ulogic;                     -- read/write
  .xbus_sel_o ( instr_xbus_sel       ), // : out std_ulogic_vector(3 downto 0);  -- byte enable
  .xbus_stb_o ( instr_xbus_stb       ), // : out std_ulogic;                     -- strobe
  .xbus_cyc_o ( instr_xbus_cyc       ), // : out std_ulogic;                     -- valid cycle
  .xbus_dat_i ( instr_xbus_dat_i     ), // : in  std_ulogic_vector(31 downto 0); -- read data
  .xbus_ack_i ( instr_xbus_ack       ), // : in  std_ulogic;                     -- transfer acknowledge
  .xbus_err_i ( instr_xbus_err       ) // : in  std_ulogic                      -- transfer error
);

mgr_obi_req_t instr_req;
mgr_obi_rsp_t instr_rsp;
mgr_obi_req_t data_req;
mgr_obi_rsp_t data_rsp;

xbus_to_obi #() i_data_xbus_to_obi (
  .rst_ni,
  .clk_i,
  .test_i ( test_enable_i ),

  // XBUS device interface
  .xbus_adr_i ( data_xbus_adr   ),
  .xbus_dat_i ( data_xbus_dat_o ),
  .xbus_cti_i ( data_xbus_cti   ),
  .xbus_tag_i ( data_xbus_tag   ),
  .xbus_we_i  ( data_xbus_we    ),
  .xbus_sel_i ( data_xbus_sel   ),
  .xbus_stb_i ( data_xbus_stb   ),
  .xbus_dat_o ( data_xbus_dat_i ),
  .xbus_ack_o ( data_xbus_ack   ),
  .xbus_err_o ( data_xbus_err   ),

  // OBI device interface
  .obi_req_o (data_req),
  .obi_rsp_i (data_rsp)
);

xbus_to_obi #() i_instr_xbus_to_obi (
  .rst_ni,
  .clk_i,
  .test_i ( test_enable_i ),

  // XBUS device interface
  .xbus_adr_i ( instr_xbus_adr   ),
  .xbus_dat_i ( instr_xbus_dat_o ),
  .xbus_cti_i ( instr_xbus_cti   ),
  .xbus_tag_i ( instr_xbus_tag   ),
  .xbus_we_i  ( instr_xbus_we    ),
  .xbus_sel_i ( instr_xbus_sel   ),
  .xbus_stb_i ( instr_xbus_stb   ),
  .xbus_dat_o ( instr_xbus_dat_i ),
  .xbus_ack_o ( instr_xbus_ack   ),
  .xbus_err_o ( instr_xbus_err   ),

  // OBI device interface
  .obi_req_o ( instr_req ),
  .obi_rsp_i ( instr_rsp )
);

assign data_req_o     = data_req.req;
assign data_gnt_i     = data_rsp.gnt;
assign data_rvalid_i  = data_rsp.rvalid;
assign data_we_o      = data_req.a.we;
assign data_be_o      = data_req.a.be;
assign data_addr_o    = data_req.a.addr;
assign data_wdata_o   = data_req.a.wdata;
assign data_rdata_i   = data_rsp.r.rdata;
assign data_err_i     = data_rsp.r.err;

assign instr_req_o    = instr_req.req;
assign instr_gnt_i    = instr_rsp.gnt;
assign instr_rvalid_i = instr_rsp.rvalid;
assign instr_addr_o   = instr_req.a.addr;
assign instr_rdata_i  = instr_rsp.r.rdata;
assign instr_err_i    = instr_rsp.r.err;

endmodule