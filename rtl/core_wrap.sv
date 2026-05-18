// Copyright 2024 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Authors:
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>
//
// This module wraps the processor core and adapts it to the Croc SoC interface.
// The default core is CVE2 (https://github.com/openhwgroup/cve2).
// For other cores, modify the internal instantiation and the port connections as needed.
//
// Replacing the core:
// The SoC provides two separate OBI master ports (instruction fetch and data access).
// Cores with a single shared memory bus can tie off one of the two and only use the other.
//
// Key interface signals to adapt for other cores:
//   fetch_enable_i - Allows the SoC to gate instruction fetch (e.g. hold core until 
//                    software is loaded). Cores without this signal should ignore it.
//   core_busy_o    - Activity hint; drive 1'b0 if the core does not expose it.
//   irqs_i [15:0]  - Fast interrupts (RISC-V IRQ 16..31). Mapping to a core's interrupt
//                    input depends on the core:
//                      CVE2/Ibex: irq_fast_i[15:0] directly
//                      cv32e40p:  irq_i[31:16]
//                    timer_irq_i and software_irq_i correspond to the standard RISC-V
//                    CLINT timer (IRQ 7) and software (IRQ 3) interrupts.
//   debug_req_i    - Debug module request. Cores without a debug interface should leave
//                    this unconnected and remove the debug module from the address map.
//                    Attention! Think carefully how it will be programmed and started.
//                    CVE2 receives the debug halt/exception addresses as runtime inputs
//                    (dm_halt_addr_i / dm_exception_addr_i). Some cores hardcode these
//                    addresses instead; in that case adjust PeriphDebug's start_addr in
//                    croc_pkg.sv so the debug module ROM base matches what the core
//                    expects to jump to on halt.
// CV-X-IF co-processors: CVE2 supports instruction offloading via the Core-V Extension Interface. 
//   If you want to attach a custom accelerator using CV-X-IF,
//   instantiate it directly inside this wrapper (enable XInterface and connect x_* ports here).
//   Do not route CV-X-IF through the SoC hierarchy; the types are CVE2-specific and the tight
//   coupling belongs at the core boundary, not in user_domain.

module core_wrap import croc_pkg::*; #() (
  input  logic clk_i,
  input  logic rst_ni,
  input  logic test_enable_i,

  // Interrupts
  // irqs_i maps to RISC-V fast interrupts (IRQ 16..31); see header comment for remapping
  input logic [15:0] irqs_i,
  input logic timer_irq_i,
  input logic software_irq_i,

  input  logic [31:0] boot_addr_i,

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
  input  logic        data_err_i,

  // Debug Interface
  input  logic        debug_req_i,

  // CPU Control Signals
  // fetch_enable_i: gates instruction fetch; ignore if core has no such signal
  input  logic        fetch_enable_i,

  // core_busy_o: power-management hint to the SoC; drive 1'b0 if not available
  output logic        core_busy_o
);

generate
  if (Sel_core == Cve2) begin : gen_cve2
    // CVE2: debug halt/exception vectors are provided as runtime inputs.
    // Cores that hardcode these addresses internally do not need these params.
    // Remove the localparams and connections below when replacing with such a core.
    // Make sure to check PeriphDebug's start_addr in croc_pkg and adjust if necesary.
    localparam bit [31:0] DebugAddrOffset       = get_periph_start_addr(PeriphDebug);
    localparam bit [31:0] DebugHaltAddress      = DebugAddrOffset + dm::HaltAddress[31:0];
    localparam bit [31:0] DebugExceptionAddress = DebugAddrOffset + dm::ExceptionAddress[31:0];

    // CVE2 ignores the lowest 8 bits of boot_addr internally; mask here to avoid confusion.
    // You may want to remove this masking when using a core that uses the full boot address.
    logic [31:0] boot_addr_masked;
    assign boot_addr_masked = boot_addr_i & 32'hFFFFFF00;

    // CV-X-IF tie-offs: CVE2-specific co-processor extension interface, disabled here.
    // Remove this block entirely when replacing CVE2 with another core.
    // If you want to use CV-X-IF, instantiate your accelerator here and connect the x_* signals.
    cve2_pkg::x_issue_resp_t x_issue_resp;
    cve2_pkg::x_result_t     x_result;
    always_comb begin
      x_issue_resp = '0;
      x_result     = '0;
    end

`ifdef TRACE_EXECUTION
    cve2_core_tracing #(
`else
    cve2_core #(
`endif
      .PMPEnable        ( CorePMPEnable       ),
      .PMPGranularity   ( 0                   ),
      .PMPNumRegions    ( 4                   ),
      .MHPMCounterNum   ( 0                   ),
      .MHPMCounterWidth ( 40                  ),
      .RV32E            ( 0                   ),
      .RV32M            ( cve2_pkg::RV32MNone ),
      .RV32B            ( cve2_pkg::RV32BNone ),
      .DbgTriggerEn     ( 1'b1                ),
      .DbgHwBreakNum    ( 1                   ),
      .XInterface       ( 1'b0                )
    ) i_core (
      .clk_i,
      .rst_ni,
      .test_en_i        ( test_enable_i    ),
      .hart_id_i        ( 32'd0            ),
      .boot_addr_i      ( boot_addr_masked ),

      // Instruction Memory Interface (OBI):
      .instr_req_o,
      .instr_gnt_i,
      .instr_rdata_i,
      .instr_rvalid_i,
      .instr_addr_o,
      .instr_err_i,

      // Data memory interface (OBI):
      .data_req_o,
      .data_gnt_i,
      .data_rvalid_i,
      .data_we_o,
      .data_be_o,
      .data_addr_o,
      .data_wdata_o,
      .data_rdata_i,
      .data_err_i,

      // Core-V Extension Interface (CV-X-IF):
      .x_issue_valid_o     (),
      .x_issue_ready_i     ( 1'b1 ),
      .x_issue_req_o       (),
      .x_issue_resp_i      ( x_issue_resp ),
      .x_register_o        (),
      .x_commit_valid_o    (),
      .x_commit_o          (),
      .x_result_valid_i    ( 1'b0 ),
      .x_result_ready_o    (),
      .x_result_i          ( x_result ),

      // Interrupts
      .irq_software_i      ( software_irq_i ),
      .irq_timer_i         ( timer_irq_i    ),
      .irq_external_i      ( 1'b0           ),
      .irq_fast_i          ( irqs_i         ),
      .irq_nm_i            ( 1'b0           ),
      .irq_pending_o       (),

      // Debug Interface
      .debug_req_i,
      .debug_halted_o      (),
      .dm_halt_addr_i      ( DebugHaltAddress      ),
      .dm_exception_addr_i ( DebugExceptionAddress ),
      .crash_dump_o        (),

      // CPU Control Signals
      .fetch_enable_i,
      .core_busy_o
    );

  end else if (Sel_core == Cv32e40p) begin : gen_cv32e40p

    localparam bit [31:0] DebugAddrOffset       = get_periph_start_addr(PeriphDebug);
    localparam bit [31:0] DebugHaltAddress      = DebugAddrOffset + dm::HaltAddress[31:0];
    localparam bit [31:0] DebugExceptionAddress = DebugAddrOffset + dm::ExceptionAddress[31:0];

    logic core_sleep_o;
    assign core_busy_o = ~core_sleep_o;

`ifdef CV32E40P_TRACE_EXECUTION
    cv32e40p_tb_wrapper #(
`else
    cv32e40p_top #(
`endif
        .FPU                      ( 0 ),
        .FPU_ADDMUL_LAT           ( 0 ),
        .FPU_OTHERS_LAT           ( 0 ),
        .ZFINX                    ( 0 ),
        .COREV_PULP               ( 0 ),
        .COREV_CLUSTER            ( 0 ),
        .NUM_MHPMCOUNTERS         ( 0 )
    ) i_cv32e40p (
        // Clock and Reset
        .rst_ni,
        .clk_i,

        // Special Control Signals
        .scan_cg_en_i             ( 1'b0 ), 
        .pulp_clock_en_i          ( 1'b0 ), //not used if COREV_PULP = 0

        // Configuration
        .boot_addr_i              ( {boot_addr_i[31:1], 1'b0}  ), //is halfword aligned (core doc)
        .mtvec_addr_i             ( {boot_addr_i[31:2], 2'b00} ), //is 4-byte aligned (RV priv specs)
        .dm_halt_addr_i           ( DebugHaltAddress           ),
        .dm_exception_addr_i      ( DebugExceptionAddress      ),
        .hart_id_i                ( 32'd0                      ),

        // Instruction memory interface (OBI)
        .instr_req_o,
        .instr_gnt_i,
        .instr_rdata_i,
        .instr_rvalid_i,
        .instr_addr_o,

        // Data memory interface (OBI)
        .data_req_o,
        .data_gnt_i,
        .data_rvalid_i,
        .data_we_o,
        .data_be_o,
        .data_addr_o,
        .data_wdata_o,
        .data_rdata_i,

        // Interrupt Interface
        .irq_i                    ( {irqs_i, 8'd0, timer_irq_i, 3'd0, software_irq_i, 3'd0} ),
        .irq_ack_o                (), 
        .irq_id_o                 (),

        // Debug Interface
        .debug_req_i,
        .debug_havereset_o        (),
        .debug_running_o          (),
        .debug_halted_o           (),

        //CPU Control Signals
        .fetch_enable_i,
        .core_sleep_o
    );

  end else if (Sel_core == Neorv32) begin : gen_neorv32
    
    localparam bit [31:0] DebugAddrOffset       = get_periph_start_addr(PeriphDebug);
    localparam bit [31:0] DebugHaltAddress      = DebugAddrOffset + dm::HaltAddress[31:0];
    localparam bit [31:0] DebugExceptionAddress = DebugAddrOffset + dm::ExceptionAddress[31:0];

    assign core_busy_o = 1'b0;

    neorv32_wrap #(
      // General
      .HART_ID         ( 0                     ), // hardware thread ID
      .VENDOR_ID       ( 32'd0                 ), // vendor ID
      .BOOT_ADDR       ( BootromAddr           ), // CPU boot address
      .DEBUG_PARK_ADDR ( DebugHaltAddress      ), // CPU debug mode parking loop entry address
      .DEBUG_EXC_ADDR  ( DebugExceptionAddress ), // CPU debug mode exception entry address
      //  RISC-V ISA Extensions TODO check which ones can be really used
      .RISCV_ISA_C                  ( 0 ), // : boolean;                        -- compressed extension
      .RISCV_ISA_E                  ( 0 ), // : boolean;                        -- embedded RF extension
      .RISCV_ISA_M                  ( 0 ), // : boolean;                        -- mul/div extension
      .RISCV_ISA_U                  ( 0 ), // : boolean;                        -- user mode extension
      .RISCV_ISA_Zba                ( 0 ), // : boolean;                        -- shifted-add bit-manipulation extension
      .RISCV_ISA_Zbb                ( 0 ), // : boolean;                        -- basic bit-manipulation extension
      .RISCV_ISA_Zbc                ( 0 ), // : boolean;                        -- carry-less multiplication instructions
      .RISCV_ISA_Zbkb               ( 0 ), // : boolean;                        -- bit-manipulation instructions for cryptography
      .RISCV_ISA_Zbkc               ( 0 ), // : boolean;                        -- carry-less multiplication instructions
      .RISCV_ISA_Zbkx               ( 0 ), // : boolean;                        -- cryptography crossbar permutation extension
      .RISCV_ISA_Zbs                ( 0 ), // : boolean;                        -- single-bit bit-manipulation extension
      .RISCV_ISA_Zcb                ( 0 ), // : boolean;                        -- additional code size reduction instructions
      .RISCV_ISA_Zfinx              ( 0 ), // : boolean;                        -- 32-bit floating-point extension
      .RISCV_ISA_Zibi               ( 0 ), // : boolean;                        -- branch with immediate
      .RISCV_ISA_Zicntr             ( 0 ), // : boolean;                        -- base counters
      .RISCV_ISA_Zicond             ( 0 ), // : boolean;                        -- integer conditional operations
      .RISCV_ISA_Zihpm              ( 0 ), // : boolean;                        -- hardware performance monitors
      .RISCV_ISA_Zimop              ( 0 ), // : boolean;                        -- may-be-operations
      .RISCV_ISA_Zknd               ( 0 ), // : boolean;                        -- cryptography NIST AES decryption extension
      .RISCV_ISA_Zkne               ( 0 ), // : boolean;                        -- cryptography NIST AES encryption extension
      .RISCV_ISA_Zknh               ( 0 ), // : boolean;                        -- cryptography NIST hash extension
      .RISCV_ISA_Zksed              ( 0 ), // : boolean;                        -- ShangMi hash extension
      .RISCV_ISA_Zksh               ( 0 ), // : boolean;                        -- ShangMi block cipher extension
      .RISCV_ISA_Zmmul              ( 0 ), // : boolean;                        -- multiply-only M sub-extension
      .RISCV_ISA_Sdext              ( 1 ), // : boolean;                        -- external debug mode extension
      .RISCV_ISA_Sdtrig             ( 0 ), // : boolean;                        -- trigger module extension
      .RISCV_ISA_Smcntrpmf          ( 0 ), // : boolean;                        -- counter privilege-mode filtering
      .RISCV_ISA_Smpmp              ( 0 ), // : boolean;                        -- physical memory protection
      .RISCV_ISA_Xcfu               ( 0 ), // : boolean;                        -- custom (instr.) functions unit
      //  Tuning Options
      .CPU_TRACE_EN                 ( 0 ), // : boolean;                        -- enable CPU execution trace generator
      .CPU_CONSTT_BR_EN             ( 0 ), // : boolean;                        -- constant-time branches
      .CPU_FAST_MUL_EN              ( 0 ), // : boolean;                        -- use DSPs for M extension's multiplier
      .CPU_FAST_SHIFT_EN            ( 0 ), // : boolean;                        -- use barrel shifter for shift operations
      .CPU_RF_ARCH_SEL              ( 2 ), // : natural range 0 to 3;           -- register file implementation style select
      //  Physical Memory Protection (PMP)
      .PMP_NUM_REGIONS     ( 0 ), // : natural range 0 to 16;          -- number of regions (0..16)
      .PMP_MIN_GRANULARITY ( 0 ), // : natural;                        -- minimal region granularity in bytes, has to be a power of 2, min 4 bytes
      .PMP_TOR_MODE_EN     ( 0 ), // : boolean;                        -- enable TOR mode
      .PMP_NAP_MODE_EN     ( 0 ), // : boolean;                        -- enable NAPOT/NA4 modes
      //  Hardware Performance Monitors (HPM)
      .HPM_NUM_CNTS        ( 0 ), // : natural range 0 to 13;          -- number of implemented HPM counters (0..13)
      .HPM_CNT_WIDTH       ( 0 ), // : natural range 0 to 64;          -- total size of HPM counters (0..64)
      //  Trigger Module (TM)
      .NUM_HW_TRIGGERS     ( 0 ) // : natural range 0 to 16           -- number of hardware triggers
    ) i_neorv32_wrap (
      // Global control
      .clk_i,
      .rst_ni,
      .test_enable_i,

      // Status
      .mtime_i ( 64'd0 ),
      // .trace_o (),   // execution trace port (enabled when CPU_TRACE_EN = true)
      .sleep_o (),   // CPU is in sleep mode
      .fence_o (),

      // Interrupts
      .msi_i ( software_irq_i ),     // RISC-V machine software interrupt
      .mei_i ( 1'b0           ),     // RISC-V machine external interrupt
      .mti_i ( timer_irq_i    ),     // RISC-V machine timer interrupt
      .firq_i ( irqs_i        ),     // custom fast interrupts

      // Debug interface
      .dbi_i ( debug_req_i ),      // RISC-V debug halt request interrupt

      // Instruction memory interface (OBI)
      .instr_req_o,
      .instr_gnt_i,
      .instr_rvalid_i,
      .instr_addr_o,
      .instr_rdata_i,
      .instr_err_i,

      // Data memory interface (OBI)
      .data_req_o,
      .data_gnt_i,
      .data_rvalid_i,
      .data_we_o,
      .data_be_o,
      .data_addr_o,
      .data_wdata_o,
      .data_rdata_i,
      .data_err_i
    );

  end else begin : gen_err
    $error("The desired core does not exist! Please select a valid core in croc_pkg.sv");
  end
endgenerate

endmodule
