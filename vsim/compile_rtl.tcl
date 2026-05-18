# This script was generated automatically by bender.
set ROOT ".."

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/clk_rst_gen.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/sim_timeout.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/stream_watchdog.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/signal_highlighter.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/rand_id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/rand_stream_mst.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/rand_synch_holdable_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/rand_verif_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/rand_synch_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/src/rand_stream_slv.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "$ROOT/.bender/git/checkouts/common_verification-9c658e5d2b0ba5b1/test/tb_clk_rst_gen.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "$ROOT/rtl/tech_cells_generic/tc_sram.sv" \
    "$ROOT/rtl/tech_cells_generic/tc_sram_impl.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "$ROOT/rtl/tech_cells_generic/tc_clk.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/binary_to_gray.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cb_filter_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cc_onehot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cf_math_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/clk_int_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/credit_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/delta_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/edge_propagator_tx.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/exp_backoff.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/fifo_v3.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/gray_to_binary.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/heaviside.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/isochronous_4phase_handshake.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/isochronous_spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/lfsr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/lfsr_16bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/lfsr_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/lossy_valid_to_stream.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/mv_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/onehot_to_bin.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/plru_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/passthrough_stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/popcount.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/ring_buffer.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/rr_arb_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/rstgen_bypass.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/serial_deglitch.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/shift_reg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/shift_reg_gated.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/spill_register_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_demux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_fork.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_join_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_mux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_throttle.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/sub_per_hash.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/unread.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/read.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/addr_decode_dync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/boxcar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_4phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/clk_int_div_static.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/trip_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/addr_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/addr_decode_napot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/multiaddr_decode.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cb_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_fifo_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/clk_mux_glitch_free.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/ecc_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/ecc_encode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/edge_detect.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/lzc.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/max_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/rstgen.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_delay.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_fork_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_join.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_reset_ctrlr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_fifo_gray.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/fall_through_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_arbiter_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_fifo_optimal_wrap.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_xbar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_fifo_gray_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/cdc_2phase_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/mem_to_banks_detailed.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/stream_omega_net.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/mem_to_banks.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/addr_decode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/cb_filter_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/cdc_2phase_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/cdc_2phase_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/cdc_fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/cdc_fifo_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/graycode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/id_queue_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/passthrough_stream_fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/popcount_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/rr_arb_tree_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/stream_test.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/stream_register_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/stream_to_mem_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/sub_per_hash_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/isochronous_crossing_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/stream_omega_net_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/stream_xbar_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/clk_int_div_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/clk_int_div_static_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/clk_mux_glitch_free_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/test/lossy_valid_to_stream_tb.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/clock_divider_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/clk_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/find_first_one.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/generic_LFSR_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/generic_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/prioarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/pulp_sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/pulp_sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/rrarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/clock_divider.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/fifo_v2.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/deprecated/fifo_v1.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/edge_propagator_ack.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/edge_propagator.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/src/edge_propagator_rx.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/defs_div_sqrt_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/iteration_div_sqrt_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/control_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/norm_div_sqrt_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/preprocess_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/nrbd_nrsc_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/div_sqrt_top_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/div_sqrt_mvp_wrapper.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_pkg.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_cast_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_classifier.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/clk/rtl/gated_clk_cell.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_ctrl.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_ff1.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_pack_single.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_prepare.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_round_single.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_special.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_srt_single.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_top.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_dp.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_frbus.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_src_type.v" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_divsqrt_th_32.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_divsqrt_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_fma.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_fma_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_noncomp.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_opgroup_block.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_opgroup_fmt_slice.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_opgroup_multifmt_slice.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_rounding.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-8b11fdb1c7bb48bb/src/fpnew_top.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/obi/obi_pkg.sv" \
    "$ROOT/rtl/obi/obi_intf.sv" \
    "$ROOT/rtl/obi/obi_rready_converter.sv" \
    "$ROOT/rtl/obi/apb_to_obi.sv" \
    "$ROOT/rtl/obi/obi_to_apb.sv" \
    "$ROOT/rtl/obi/obi_atop_resolver.sv" \
    "$ROOT/rtl/obi/obi_cut.sv" \
    "$ROOT/rtl/obi/obi_demux.sv" \
    "$ROOT/rtl/obi/obi_err_sbr.sv" \
    "$ROOT/rtl/obi/obi_mux.sv" \
    "$ROOT/rtl/obi/obi_sram_shim.sv" \
    "$ROOT/rtl/obi/obi_xbar.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "$ROOT/rtl/apb/apb_pkg.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_burst_splitter_gran.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_burst_unwrap.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_bus_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_demux_simple.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_fifo_delay_dyn.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_inval_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_rw_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_rw_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_slave_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_throttle.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_detailed_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_zero_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_interleaved_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_xbar_unmuxed.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem_interleaved.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_xp.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_chan_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dumper.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_test.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_dw_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_xbar_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_addr_test.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_bus_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_lite_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_slave_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/test/tb_axi_xbar.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/sva" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/include/cv32e40p_apu_core_pkg.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/include/cv32e40p_fpu_pkg.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/include/cv32e40p_pkg.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_aligner.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_alu_div.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_alu.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_apu_disp.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_compressed_decoder.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_controller.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_core.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_cs_registers.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_decoder.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_ex_stage.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_ff_one.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_fifo.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_fp_wrapper.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_hwloop_regs.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_id_stage.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_if_stage.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_int_controller.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_load_store_unit.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_mult.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_obi_interface.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_popcnt.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_prefetch_buffer.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_prefetch_controller.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_sleep_unit.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_top.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/cv32e40p_sim_clock_gate.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/include/cv32e40p_tracer_pkg.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/cv32e40p_tb_wrapper.sv" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/cv32e40p_rvfi.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/sva" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/cv32e40p_register_file_ff.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/rtl/include" \
    "+incdir+$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/sva" \
    "$ROOT/.bender/git/checkouts/cv32e40p-30a8e3a1ab726f70/bhv/cv32e40p_sim_clock_gate.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/cve2/include" \
    "$ROOT/rtl/cve2/cve2_pkg.sv" \
    "$ROOT/rtl/cve2/cve2_alu.sv" \
    "$ROOT/rtl/cve2/cve2_branch_predict.sv" \
    "$ROOT/rtl/cve2/cve2_compressed_decoder.sv" \
    "$ROOT/rtl/cve2/cve2_controller.sv" \
    "$ROOT/rtl/cve2/cve2_counter.sv" \
    "$ROOT/rtl/cve2/cve2_csr.sv" \
    "$ROOT/rtl/cve2/cve2_decoder.sv" \
    "$ROOT/rtl/cve2/cve2_fetch_fifo.sv" \
    "$ROOT/rtl/cve2/cve2_load_store_unit.sv" \
    "$ROOT/rtl/cve2/cve2_multdiv_fast.sv" \
    "$ROOT/rtl/cve2/cve2_multdiv_slow.sv" \
    "$ROOT/rtl/cve2/cve2_pmp.sv" \
    "$ROOT/rtl/cve2/cve2_register_file_ff.sv" \
    "$ROOT/rtl/cve2/cve2_wb.sv" \
    "$ROOT/rtl/cve2/cve2_cs_registers.sv" \
    "$ROOT/rtl/cve2/cve2_ex_block.sv" \
    "$ROOT/rtl/cve2/cve2_id_stage.sv" \
    "$ROOT/rtl/cve2/cve2_prefetch_buffer.sv" \
    "$ROOT/rtl/cve2/cve2_if_stage.sv" \
    "$ROOT/rtl/cve2/cve2_core.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+RVFI=true" \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/cve2/include" \
    "$ROOT/rtl/cve2/cve2_tracer_pkg.sv" \
    "$ROOT/rtl/cve2/cve2_tracer.sv" \
    "$ROOT/rtl/cve2/cve2_core_tracing.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/idma/idma_pkg.sv" \
    "$ROOT/rtl/idma/idma_channel_coupler.sv" \
    "$ROOT/rtl/idma/idma_dataflow_element.sv" \
    "$ROOT/rtl/idma/idma_obi_read.sv" \
    "$ROOT/rtl/idma/idma_obi_write.sv" \
    "$ROOT/rtl/idma/idma_nd_midend.sv" \
    "$ROOT/rtl/idma/idma_transfer_id_gen.sv" \
    "$ROOT/rtl/idma/idma_legalizer_page_splitter.sv" \
    "$ROOT/rtl/idma/idma_transport_layer_rw_obi.sv" \
    "$ROOT/rtl/idma/idma_legalizer_rw_obi.sv" \
    "$ROOT/rtl/idma/idma_backend_rw_obi.sv" \
    "$ROOT/rtl/idma/croc_idma.sv" \
}]} {return 1}

if {[catch { vcom -2008 -work neorv32 \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_package.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_sys.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_decompressor.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_frontend.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_control.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_hwtrig.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_prim.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_counters.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_regfile.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_shifter.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_muldiv.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_bitmanip.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_fpu.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_cfu.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_cond.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu_crypto.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_alu.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_lsu.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_pmp.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu_trace.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cpu.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cache.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_bus.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_dma.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_imem.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_dmem.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_xbus.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_bootrom.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cfs.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_sdi.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_gpio.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_wdt.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_clint.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_uart.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_spi.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_twi.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_twd.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_pwm.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_trng.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_neoled.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_gptmr.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_onewire.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_slink.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_tracer.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_sysinfo.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_debug_dtm.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_debug_auth.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_debug_dm.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_top.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_cache_ram.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_imem_image.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_imem_rom.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_imem_ram.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_dmem_ram.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_bootrom_image.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/core/neorv32_bootrom_rom.vhd" \
    "$ROOT/.bender/git/checkouts/neorv32-b464916080e03e08/rtl/system_integration/xbus2axi4_bridge.vhd" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/obi_uart/obi_uart_pkg.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_baudgen.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_interrupts.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_modem.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_rx.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_tx.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_register.sv" \
    "$ROOT/rtl/obi_uart/obi_uart.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/rtl/riscv-dbg/dm_pkg.sv" \
    "$ROOT/rtl/riscv-dbg/debug_rom/debug_rom.sv" \
    "$ROOT/rtl/riscv-dbg/debug_rom/debug_rom_one_scratch.sv" \
    "$ROOT/rtl/riscv-dbg/dm_csrs.sv" \
    "$ROOT/rtl/riscv-dbg/dm_mem.sv" \
    "$ROOT/rtl/riscv-dbg/dmi_cdc.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/rtl/riscv-dbg/dmi_jtag_tap.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/rtl/riscv-dbg/dm_sba.sv" \
    "$ROOT/rtl/riscv-dbg/dm_top.sv" \
    "$ROOT/rtl/riscv-dbg/dmi_jtag.sv" \
    "$ROOT/rtl/riscv-dbg/dm_obi_top.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/rtl/riscv-dbg/dmi_test.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/rtl/riscv-dbg/dmi_intf.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "$ROOT/rtl/riscv-dbg/tb/jtag_test_simple.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/croc_pkg.sv" \
    "$ROOT/rtl/user_pkg.sv" \
    "$ROOT/rtl/soc_ctrl/soc_ctrl_regs_pkg.sv" \
    "$ROOT/rtl/gpio/gpio_reg_pkg.sv" \
    "$ROOT/rtl/clint/clint_reg_pkg.sv" \
    "$ROOT/rtl/obi_timer/obi_timer_reg_pkg.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/core_wrap.sv" \
    "$ROOT/rtl/bootrom/bootrom.sv" \
    "$ROOT/rtl/soc_ctrl/soc_ctrl_regs.sv" \
    "$ROOT/rtl/gpio/gpio_reg_top.sv" \
    "$ROOT/rtl/gpio/gpio.sv" \
    "$ROOT/rtl/clint/clint.sv" \
    "$ROOT/rtl/obi_timer/obi_timer.sv" \
    "$ROOT/rtl/croc_domain.sv" \
    "$ROOT/rtl/user_domain.sv" \
    "$ROOT/rtl/neorv32/neorv32_wrap.sv" \
    "$ROOT/rtl/neorv32/xbus_to_obi.sv" \
}]} {return 1}

if {[catch { vcom -2008 -work neorv32 \
    "$ROOT/rtl/neorv32/neorv32_flatten_pkg.vhd" \
    "$ROOT/rtl/neorv32/neorv32_bus_gateway_wrap.vhd" \
    "$ROOT/rtl/neorv32/neorv32_cpu_wrap.vhd" \
    "$ROOT/rtl/neorv32/neorv32_xbus_wrap.vhd" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/croc_soc.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/croc_chip.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_TEST" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-df65432c571d78d4/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/test/tb_croc_pkg.sv" \
    "$ROOT/rtl/test/croc_vip.sv" \
    "$ROOT/rtl/test/tb_croc_soc.sv" \
}]} {return 1}

