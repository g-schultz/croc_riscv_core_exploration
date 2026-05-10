//TODO: copyright, license

`include "apb/typedef.svh"
`include "axi/typedef.svh"

module xbus_to_obi import croc_pkg::*; #() (
  input logic rst_ni,
  input logic clk_i,
  input logic test_i,

  // XBUS device interface
  input  logic [31:0] xbus_adr_i,
  input  logic [31:0] xbus_dat_i,
  input  logic [2:0]  xbus_cti_i,
  input  logic [2:0]  xbus_tag_i,
  input  logic        xbus_we_i,
  input  logic [3:0]  xbus_sel_i,
  input  logic        xbus_stb_i,
  output logic [31:0] xbus_dat_o,
  output logic        xbus_ack_o,
  output logic        xbus_err_o,

  // OBI device interface
  output mgr_obi_req_t obi_req_o,
  input  mgr_obi_rsp_t obi_rsp_i
);


  typedef logic [31:0]   addr_t;
  typedef logic [31:0]   data_t;
  typedef logic [0:0]    id_t;
  typedef logic [3:0]    strb_t;
  typedef logic [0:0]    user_t;

`AXI_TYPEDEF_AW_CHAN_T(axi_aw_chan_t, addr_t, id_t, user_t)
`AXI_TYPEDEF_W_CHAN_T(axi_w_chan_t, data_t, strb_t, user_t)
`AXI_TYPEDEF_B_CHAN_T(axi_b_chan_t, id_t, user_t)
`AXI_TYPEDEF_AR_CHAN_T(axi_ar_chan_t, addr_t, id_t, user_t)
`AXI_TYPEDEF_R_CHAN_T(axi_r_chan_t, data_t, id_t, user_t)
`AXI_TYPEDEF_REQ_T(axi_req_t, axi_aw_chan_t, axi_w_chan_t, axi_ar_chan_t)
`AXI_TYPEDEF_RESP_T(axi_resp_t, axi_b_chan_t, axi_r_chan_t)

  axi_req_t axi_req;
  axi_resp_t axi_resp;

  assign axi_req.aw.id     = 1'b0; 
  assign axi_req.aw.lock   = 1'b0; 
  assign axi_req.aw.qos    = 4'd0; 
  assign axi_req.aw.region = 4'd0; 
  assign axi_req.aw.atop   = 6'd0; 
  assign axi_req.aw.user   = 1'b0; // no default value in spec
  assign axi_req.w.user    = 1'b0; // no default value in spec
  assign axi_req.ar.id     = 1'b0;
  assign axi_req.ar.lock   = 1'b0;
  assign axi_req.ar.qos    = 4'd0;
  assign axi_req.ar.region = 4'd0;
  assign axi_req.ar.user   = 1'b0; // no default value in spec

`AXI_LITE_TYPEDEF_AW_CHAN_T(axi_lite_aw_chan_t, addr_t)
`AXI_LITE_TYPEDEF_W_CHAN_T(axi_lite_w_chan_t, data_t, strb_t)
`AXI_LITE_TYPEDEF_B_CHAN_T(axi_lite_b_chan_t)
`AXI_LITE_TYPEDEF_AR_CHAN_T(axi_lite_ar_chan_t, addr_t)
`AXI_LITE_TYPEDEF_R_CHAN_T(axi_lite_r_chan_t, data_t)
`AXI_LITE_TYPEDEF_REQ_T(axi_lite_req_t, axi_lite_aw_chan_t, axi_lite_w_chan_t, axi_lite_ar_chan_t)
`AXI_LITE_TYPEDEF_RESP_T(axi_lite_resp_t, axi_lite_b_chan_t, axi_lite_r_chan_t)

  axi_lite_req_t  axi_lite_req;
  axi_lite_resp_t axi_lite_resp;

`APB_TYPEDEF_REQ_T(apb_req_t, addr_t, data_t, strb_t)
`APB_TYPEDEF_RESP_T (apb_resp_t, data_t)

  apb_req_t apb_req;
  apb_resp_t apb_resp;

  // AXI lite to APB bridge should be transparent
  localparam addr_map_rule_t addr_map_lite2apb ='{idx: 1'b0, start_addr: 32'h0000_0000, end_addr: 32'hffff_ffff};

xbus2axi4_bridge #(
  .BURST_EN ( 1'b0 ),
  .BURST_LEN ( 4 )
) i_xbus2axi4_bridge (    
  // Global control
  .clk           ( clk_i  ),          
  .resetn        ( rst_ni ),       
  // XBUS device interface
  .xbus_adr_i,
  .xbus_dat_i, 
  .xbus_cti_i, 
  .xbus_tag_i, 
  .xbus_we_i, 
  .xbus_sel_i,
  .xbus_stb_i, 
  .xbus_dat_o,
  .xbus_ack_o, 
  .xbus_err_o, 
  // AXI4 host write address channel
  .m_axi_awaddr  ( axi_req.aw.addr   ),
  .m_axi_awlen   ( axi_req.aw.len    ),
  .m_axi_awsize  ( axi_req.aw.size   ),
  .m_axi_awburst ( axi_req.aw.burst  ),
  .m_axi_awcache ( axi_req.aw.cache  ),
  .m_axi_awprot  ( axi_req.aw.prot   ),
  .m_axi_awvalid ( axi_req.aw_valid  ),
  .m_axi_awready ( axi_resp.aw_ready ),
  // AXI4 host write data channel 
  .m_axi_wdata   ( axi_req.w.data    ),
  .m_axi_wstrb   ( axi_req.w.strb    ),
  .m_axi_wlast   ( axi_req.w.last    ),
  .m_axi_wvalid  ( axi_req.w_valid   ),
  .m_axi_wready  ( axi_resp.w_ready  ),
  // AXI4 host read address channel
  .m_axi_araddr  ( axi_req.ar.addr   ),
  .m_axi_arlen   ( axi_req.ar.len    ),
  .m_axi_arsize  ( axi_req.ar.size   ),
  .m_axi_arburst ( axi_req.ar.burst  ),
  .m_axi_arcache ( axi_req.ar.cache  ),
  .m_axi_arprot  ( axi_req.ar.prot   ),
  .m_axi_arvalid ( axi_req.ar_valid  ),
  .m_axi_arready ( axi_resp.ar_ready ),
  // AXI4 host read data channel
  .m_axi_rdata   ( axi_resp.r.data   ),
  .m_axi_rresp   ( axi_resp.r.resp   ),
  .m_axi_rlast   ( axi_resp.r.last   ),
  .m_axi_rvalid  ( axi_resp.r_valid  ),
  .m_axi_rready  ( axi_req.r_ready   ),
  // AXI4 host write response channel
  .m_axi_bresp   ( axi_resp.b.resp   ),
  .m_axi_bvalid  ( axi_resp.b_valid  ),
  .m_axi_bready  ( axi_req.b_ready   )
);


axi_to_axi_lite #(
  .AxiAddrWidth    ( 32'd32 ),
  .AxiDataWidth    ( 32'd32 ),
  .AxiIdWidth      ( 32'd1 ),
  .AxiUserWidth    ( 32'd1 ),
  .AxiMaxWriteTxns ( 32'd1 ),
  .AxiMaxReadTxns  ( 32'd1 ),
  .FullBW          ( 0 ),
  .FallThrough     ( 1'b1 ),
  .full_req_t      ( axi_req_t       ),
  .full_resp_t     ( axi_resp_t      ),
  .lite_req_t      ( axi_lite_req_t  ),
  .lite_resp_t     ( axi_lite_resp_t )
) i_axi_to_axi_lite (
  .clk_i,
  .rst_ni,
  .test_i,
  // slave port full AXI4+ATOP
  .slv_req_i  ( axi_req       ),
  .slv_resp_o ( axi_resp      ),
  // master port AXI4-Lite
  .mst_req_o  ( axi_lite_req  ),
  .mst_resp_i ( axi_lite_resp )
);


axi_lite_to_apb #(
  .NoApbSlaves      ( 32'd1           ), // Number of connected APB slaves
  .NoRules          ( 32'd1           ), // Number of APB address rules
  .AddrWidth        ( 32'd32          ), // Address width
  .DataWidth        ( 32'd32          ), // Data width
  .PipelineRequest  ( 1'b0            ), // Pipeline request path    
  .PipelineResponse ( 1'b0            ), // Pipeline response path   
  .axi_lite_req_t   ( axi_lite_req_t  ), // AXI4-Lite request struct
  .axi_lite_resp_t  ( axi_lite_resp_t ), // AXI4-Lite response sruct
  .apb_req_t        ( apb_req_t       ), // APB4 request struct
  .apb_resp_t       ( apb_resp_t      ), // APB4 response struct
  .rule_t           ( addr_map_rule_t )  // Address Decoder rule from `common_cells`
) i_axi_lite_to_apb (
  .clk_i,
  .rst_ni,
  // AXI LITE slave port
  .axi_lite_req_i  ( axi_lite_req      ),
  .axi_lite_resp_o ( axi_lite_resp     ),
  // APB master port
  .apb_req_o       ( apb_req           ),
  .apb_resp_i      ( apb_resp          ),
  // APB Slave Address Map
  .addr_map_i      ( addr_map_lite2apb )
);

apb_to_obi #(
  // The configuration of the manager port (output port)
  .ObiCfg    ( MgrObiCfg ),
  // The APB request/response struct for the subordinate port (input port)
  .apb_req_t ( apb_req_t          ),
  .apb_rsp_t ( apb_resp_t         ),
  // The OBI request/response struct for the manager port (output port)
  .obi_req_t ( mgr_obi_req_t      ),
  .obi_rsp_t ( mgr_obi_rsp_t      )
) i_apb_to_obi (
  .clk_i,
  .rst_ni,
  // Subordinate APB port.
  .apb_req_i ( apb_req  ),
  .apb_rsp_o ( apb_resp ),
  // Manager OBI port.
  .obi_req_o,
  .obi_rsp_i
);

endmodule