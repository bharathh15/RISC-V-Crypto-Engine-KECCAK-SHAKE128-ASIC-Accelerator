# $RTL and $IPS are defined in the corresponding XCELIUM or GENUS scripts

# components
set SOURCES " \
   $RTL/rtl/components/pulp_clock_gating.sv \
   $RTL/rtl/components/cluster_clock_gating.sv \
   $RTL/rtl/components/cluster_clock_inverter.sv \
   $RTL/rtl/components/cluster_clock_mux2.sv \
   $RTL/rtl/components/rstgen.sv \
   $RTL/rtl/components/pulp_clock_inverter.sv \
   $RTL/rtl/components/pulp_clock_mux2.sv \
   $RTL/rtl/components/generic_fifo.sv \
   $RTL/rtl/components/sp_ram.sv \
   $RTL/rtl/axi2apb_wrap.sv \
   $RTL/rtl/periph_bus_wrap.sv \
   $RTL/rtl/core2axi_wrap.sv \
   $RTL/rtl/axi_node_intf_wrap.sv \
   $RTL/rtl/axi_spi_slave_wrap.sv \
   $RTL/rtl/axi_slice_wrap.sv \
   $RTL/rtl/axi_mem_if_SP_wrap.sv \
   $RTL/rtl/core_region.sv \
   $RTL/rtl/instr_ram_wrap.sv \
   $RTL/rtl/sp_ram_wrap.sv \
   $RTL/rtl/boot_code.sv \
   $RTL/rtl/boot_rom_wrap.sv \
   $RTL/rtl/peripherals.sv \
   $RTL/rtl/ram_mux.sv \
   $RTL/rtl/pulpino_top.sv \
   $RTL/rtl/clk_rst_gen.sv \
   $IPS/axi/axi_node/apb_regs_top.sv \
   $IPS/axi/axi_node/axi_address_decoder_AR.sv \
   $IPS/axi/axi_node/axi_address_decoder_AW.sv \
   $IPS/axi/axi_node/axi_address_decoder_BR.sv \
   $IPS/axi/axi_node/axi_address_decoder_BW.sv \
   $IPS/axi/axi_node/axi_address_decoder_DW.sv \
   $IPS/axi/axi_node/axi_AR_allocator.sv \
   $IPS/axi/axi_node/axi_ArbitrationTree.sv \
   $IPS/axi/axi_node/axi_AW_allocator.sv \
   $IPS/axi/axi_node/axi_BR_allocator.sv \
   $IPS/axi/axi_node/axi_BW_allocator.sv \
   $IPS/axi/axi_node/axi_DW_allocator.sv \
   $IPS/axi/axi_node/axi_FanInPrimitive_Req.sv \
   $IPS/axi/axi_node/axi_multiplexer.sv \
   $IPS/axi/axi_node/axi_node.sv \
   $IPS/axi/axi_node/axi_node_wrap.sv \
   $IPS/axi/axi_node/axi_node_wrap_with_slices.sv \
   $IPS/axi/axi_node/axi_regs_top.sv \
   $IPS/axi/axi_node/axi_request_block.sv \
   $IPS/axi/axi_node/axi_response_block.sv \
   $IPS/axi/axi_node/axi_RR_Flag_Req.sv \
   $IPS/apb/apb_node/apb_node.sv \
   $IPS/apb/apb_node/apb_node_wrap.sv \
   $IPS/axi/axi_mem_if_DP/axi_mem_if_MP_Hybrid_multi_bank.sv \
   $IPS/axi/axi_mem_if_DP/axi_mem_if_multi_bank.sv \
   $IPS/axi/axi_mem_if_DP/axi_mem_if_DP_hybr.sv \
   $IPS/axi/axi_mem_if_DP/axi_mem_if_DP.sv \
   $IPS/axi/axi_mem_if_DP/axi_mem_if_SP.sv \
   $IPS/axi/axi_mem_if_DP/axi_read_only_ctrl.sv \
   $IPS/axi/axi_mem_if_DP/axi_write_only_ctrl.sv \
   $IPS/axi/axi_spi_slave/axi_spi_slave.sv \
   $IPS/axi/axi_spi_slave/spi_slave_axi_plug.sv \
   $IPS/axi/axi_spi_slave/spi_slave_cmd_parser.sv \
   $IPS/axi/axi_spi_slave/spi_slave_controller.sv \
   $IPS/axi/axi_spi_slave/spi_slave_dc_fifo.sv \
   $IPS/axi/axi_spi_slave/spi_slave_regs.sv \
   $IPS/axi/axi_spi_slave/spi_slave_rx.sv \
   $IPS/axi/axi_spi_slave/spi_slave_syncro.sv \
   $IPS/axi/axi_spi_slave/spi_slave_tx.sv \
   $IPS/axi/axi_spi_master/axi_spi_master.sv \
   $IPS/axi/axi_spi_master/spi_master_axi_if.sv \
   $IPS/axi/axi_spi_master/spi_master_clkgen.sv \
   $IPS/axi/axi_spi_master/spi_master_controller.sv \
   $IPS/axi/axi_spi_master/spi_master_fifo.sv \
   $IPS/axi/axi_spi_master/spi_master_rx.sv \
   $IPS/axi/axi_spi_master/spi_master_tx.sv \
   $IPS/apb/apb_gpio/apb_gpio.sv \
   $IPS/apb/apb_event_unit/apb_event_unit.sv \
   $IPS/apb/apb_event_unit/generic_service_unit.sv \
   $IPS/apb/apb_event_unit/sleep_unit.sv \
   $IPS/apb/apb_spi_master/apb_spi_master.sv \
   $IPS/apb/apb_spi_master/spi_master_apb_if.sv \
   $IPS/apb/apb_spi_master/spi_master_clkgen.sv \
   $IPS/apb/apb_spi_master/spi_master_controller.sv \
   $IPS/apb/apb_spi_master/spi_master_fifo.sv \
   $IPS/apb/apb_spi_master/spi_master_rx.sv \
   $IPS/apb/apb_spi_master/spi_master_tx.sv \
   $IPS/fpu/hdl/fpu_utils/fpu_ff.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_defs.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpexc.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_add.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_core.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_ftoi.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_itof.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_mult.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_norm.sv \
   $IPS/fpu/hdl/fpu_v0.1/fpu_private.sv \
   $IPS/fpu/hdl/fpu_v0.1/riscv_fpu.sv \
   $IPS/fpu/hdl/fpu_v0.1/fp_fma_wrapper.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/fpu_defs_div_sqrt_tp.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/control_tp.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/fpu_norm_div_sqrt.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/iteration_div_sqrt_first.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/iteration_div_sqrt.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/nrbd_nrsc_tp.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/preprocess.sv \
   $IPS/fpu/hdl/fpu_div_sqrt_tp_nlp/div_sqrt_top_tp.sv \
   $IPS/fpu/hdl/fpu_fmac/fpu_defs_fmac.sv \
   $IPS/fpu/hdl/fpu_fmac/preprocess_fmac.sv \
   $IPS/fpu/hdl/fpu_fmac/booth_encoder.sv \
   $IPS/fpu/hdl/fpu_fmac/booth_selector.sv \
   $IPS/fpu/hdl/fpu_fmac/pp_generation.sv \
   $IPS/fpu/hdl/fpu_fmac/wallace.sv \
   $IPS/fpu/hdl/fpu_fmac/aligner.sv \
   $IPS/fpu/hdl/fpu_fmac/CSA.sv \
   $IPS/fpu/hdl/fpu_fmac/adders.sv \
   $IPS/fpu/hdl/fpu_fmac/LZA.sv \
   $IPS/fpu/hdl/fpu_fmac/fpu_norm_fmac.sv \
   $IPS/fpu/hdl/fpu_fmac/fmac.sv \
   $IPS/apb/apb_pulpino/apb_pulpino.sv \
   $IPS/apb/apb_fll_if/apb_fll_if.sv \
   $IPS/axi/core2axi/core2axi.sv \
   $IPS/apb/apb_timer/apb_timer.sv \
   $IPS/apb/apb_timer/timer.sv \
   $IPS/axi/axi2apb/AXI_2_APB.sv \
   $IPS/axi/axi2apb/AXI_2_APB_32.sv \
   $IPS/axi/axi2apb/axi2apb.sv \
   $IPS/axi/axi2apb/axi2apb32.sv \
   $IPS/apb/apb_i2c/apb_i2c.sv \
   $IPS/apb/apb_i2c/i2c_master_bit_ctrl.sv \
   $IPS/apb/apb_i2c/i2c_master_byte_ctrl.sv \
   $IPS/apb/apb_i2c/i2c_master_defines.sv \
   $IPS/axi/axi_slice_dc/axi_slice_dc_master.sv \
   $IPS/axi/axi_slice_dc/axi_slice_dc_slave.sv \
   $IPS/axi/axi_slice_dc/dc_data_buffer.sv \
   $IPS/axi/axi_slice_dc/onehot_to_bin.sv \
   $IPS/axi/axi_slice_dc/dc_full_detector.v \
   $IPS/axi/axi_slice_dc/dc_synchronizer.v \
   $IPS/axi/axi_slice_dc/dc_token_ring_fifo_din.v \
   $IPS/axi/axi_slice_dc/dc_token_ring_fifo_dout.v \
   $IPS/axi/axi_slice_dc/dc_token_ring.v \
   $IPS/riscv/include/apu_core_package.sv \
   $IPS/riscv/include/riscv_defines.sv \
   $IPS/riscv/include/riscv_tracer_defines.sv \
   $IPS/riscv/riscv_alu.sv \
   $IPS/riscv/riscv_alu_basic.sv \
   $IPS/riscv/riscv_alu_div.sv \
   $IPS/riscv/riscv_compressed_decoder.sv \
   $IPS/riscv/riscv_controller.sv \
   $IPS/riscv/riscv_cs_registers.sv \
   $IPS/riscv/riscv_debug_unit.sv \
   $IPS/riscv/riscv_decoder.sv \
   $IPS/riscv/riscv_int_controller.sv \
   $IPS/riscv/riscv_ex_stage.sv \
   $IPS/riscv/riscv_hwloop_controller.sv \
   $IPS/riscv/riscv_hwloop_regs.sv \
   $IPS/riscv/riscv_id_stage.sv \
   $IPS/riscv/riscv_if_stage.sv \
   $IPS/riscv/riscv_load_store_unit.sv \
   $IPS/riscv/riscv_mult.sv \
   $IPS/riscv/riscv_prefetch_buffer.sv \
   $IPS/riscv/riscv_prefetch_L0_buffer.sv \
   $IPS/riscv/riscv_core.sv \
   $IPS/riscv/riscv_apu_disp.sv \
   $IPS/riscv/riscv_fetch_fifo.sv \
   $IPS/riscv/riscv_L0_buffer.sv \
   $IPS/riscv/riscv_register_file.sv \
   $IPS/axi/axi_slice/axi_ar_buffer.sv \
   $IPS/axi/axi_slice/axi_aw_buffer.sv \
   $IPS/axi/axi_slice/axi_b_buffer.sv \
   $IPS/axi/axi_slice/axi_buffer.sv \
   $IPS/axi/axi_slice/axi_r_buffer.sv \
   $IPS/axi/axi_slice/axi_slice.sv \
   $IPS/axi/axi_slice/axi_w_buffer.sv \
   $IPS/adv_dbg_if/rtl/adbg_axi_biu.sv \
   $IPS/adv_dbg_if/rtl/adbg_axi_module.sv \
   $IPS/adv_dbg_if/rtl/adbg_lint_biu.sv \
   $IPS/adv_dbg_if/rtl/adbg_lint_module.sv \
   $IPS/adv_dbg_if/rtl/adbg_crc32.v \
   $IPS/adv_dbg_if/rtl/adbg_or1k_biu.sv \
   $IPS/adv_dbg_if/rtl/adbg_or1k_module.sv \
   $IPS/adv_dbg_if/rtl/adbg_or1k_status_reg.sv \
   $IPS/adv_dbg_if/rtl/adbg_top.sv \
   $IPS/adv_dbg_if/rtl/bytefifo.v \
   $IPS/adv_dbg_if/rtl/syncflop.v \
   $IPS/adv_dbg_if/rtl/syncreg.v \
   $IPS/adv_dbg_if/rtl/adbg_tap_top.v \
   $IPS/adv_dbg_if/rtl/adv_dbg_if.sv \
   $IPS/adv_dbg_if/rtl/adbg_axionly_top.sv \
   $IPS/adv_dbg_if/rtl/adbg_lintonly_top.sv \
   $IPS/apb/apb2per/apb2per.sv \

   $ACCEL/cfg_types_pkg.sv \
   $ACCEL/accel_top_wrapper.sv \
   $ACCEL/accel_wrapper.sv \
   $ACCEL/config_reg.sv \
   $ACCEL/example_add.sv \
   $ACCEL/true_dp_ram.sv \
   $ACCEL/tb_accelerator_template.sv \
   $ACCEL/tb_config_reg.sv \

"

set SOURCES_VHDL_UART " \
   
   $KECCAK/keccak_globals.vhd \
   $KECCAK/keccak_buffer.vhd \
   $KECCAK/keccak_round_constants_gen.vhd \
   $KECCAK/keccak_round.vhd \
   $KECCAK/keccak.vhd \

   $IPS/apb/apb_uart/apb_uart.vhd \
   $IPS/apb/apb_uart/slib_clock_div.vhd \
   $IPS/apb/apb_uart/slib_counter.vhd \
   $IPS/apb/apb_uart/slib_edge_detect.vhd \
   $IPS/apb/apb_uart/slib_fifo.vhd \
   $IPS/apb/apb_uart/slib_input_filter.vhd \
   $IPS/apb/apb_uart/slib_input_sync.vhd \
   $IPS/apb/apb_uart/slib_mv_filter.vhd \
   $IPS/apb/apb_uart/uart_baudgen.vhd \
   $IPS/apb/apb_uart/uart_interrupt.vhd \
   $IPS/apb/apb_uart/uart_receiver.vhd \
   $IPS/apb/apb_uart/uart_transmitter.vhd \
"

set SOURCES_SV_UART "\
   $IPS/apb/apb_uart_sv/apb_uart_sv.sv \
   $IPS/apb/apb_uart_sv/uart_rx.sv \
   $IPS/apb/apb_uart_sv/uart_tx.sv \
   $IPS/apb/apb_uart_sv/io_generic_fifo.sv \
   $IPS/apb/apb_uart_sv/uart_interrupt.sv \
"

set INCLUDES " \
    $IPS/adv_dbg_if \
    $IPS/apb/apb_event_unit/include \
    $IPS/axi/axi_node \
    $IPS/fpu \
    $IPS/riscv/include \
    $RTL/rtl/includes \
"
