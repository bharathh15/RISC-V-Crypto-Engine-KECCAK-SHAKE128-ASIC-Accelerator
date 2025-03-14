(globals
    version = 3
    io_order = default
)
(iopad
    (topright
    (inst name="CORNER2" cell="sky130_fd_io__corner_bus_overlay" orientation = R0)
    )
    (top
    (inst  name="GND1_P" cell="sky130_fd_io__overlay_vssio_hvc" orientation = R0 skip = 0)
    (inst  name="PAD_spi_sdo0_o" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PAD_spi_mode_o_0" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PAD_spi_mode_o_1" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PAD_gpio_in_out_1" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PAD_gpio_in_out_2" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PAD_gpio_in_out_3" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PAD_gpio_in_out_4" orientation = R0 skip = 0 place_status = fixed)
    (inst  name="PWR1_C" cell="sky130_fd_io__overlay_vccd_hvc" orientation = R0 place_status = fixed skip = 0)
    (inst  name="GND1_C" cell="sky130_fd_io__overlay_vssd_hvc" orientation = R0 place_status = fixed skip = 0)
    (inst  name="PAD_uart_dsr" skip = 0 orientation = R0 place_status = fixed)
    (inst  name="PAD_uart_cts" skip = 0 orientation = R0 place_status = fixed)
    (inst  name="PAD_uart_rx" skip = 0 orientation = R0 place_status = fixed)
    (inst  name="PAD_uart_tx" skip = 0 orientation = R0 place_status = fixed)
    (inst  name="PAD_uart_rts" skip = 0 orientation = R0 place_status = fixed)
    (inst  name="PAD_uart_dtr" skip = 0 orientation = R0 place_status = fixed)
    (inst  name="PWR1_P" cell="sky130_fd_io__overlay_vddio_hvc" orientation = R0 place_status = fixed skip = 0)
    (endspace gap = 0)
    )
    (topleft
    (inst name="CORNER1" cell="sky130_fd_io__corner_bus_overlay" orientation = MY)
    )
    (left
    (inst  name="GND2_P" cell="sky130_fd_io__overlay_vssio_hvc" skip = 0 orientation = R90)
    (inst  name="PAD_spi_master_csn3_o" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_master_mode_o_0" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_master_mode_o_1" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_fetch_enable_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_clk_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_cs_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="GND2_C" cell="sky130_fd_io__overlay_vssd_hvc" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PWR2_C" cell="sky130_fd_io__overlay_vccd_hvc" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdi3_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdi2_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdi1_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdi0_i" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdo3_o" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdo2_o" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PAD_spi_sdo1_o" skip = 0 orientation = R90 place_status = fixed)
    (inst  name="PWR2_P" cell="sky130_fd_io__overlay_vddio_hvc" skip = 0 orientation = R90 place_status = fixed)
    (endspace gap = 0)
    )
    (bottomleft
    (inst name="CORNER4" cell="sky130_fd_io__corner_bus_overlay" orientation = R180)
    )
    (bottom
    (inst  name="PWR3_P" cell="sky130_fd_io__overlay_vddio_hvc" orientation = R180)
    (inst  name="PAD_spi_master_csn2_o" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_csn1_o" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_csn0_o" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdi0_i" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdi1_i" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdi2_i" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="GND3_C" cell="sky130_fd_io__overlay_vssd_hvc" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PWR3_C" cell="sky130_fd_io__overlay_vccd_hvc" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdi3_i" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_clk_sel_i" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_gpio_in_out_5" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_gpio_in_out_6" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_gpio_in_out_7" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdo0_o" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdo1_o" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="PAD_spi_master_sdo2_o" skip = 0 orientation = R180 place_status = fixed)
    (inst  name="GND3_P" cell="sky130_fd_io__overlay_vssio_hvc" skip = 0 orientation = R180 place_status = fixed)
    (endspace gap = 0)
    )
    (bottomright
    (inst name="CORNER3" cell="sky130_fd_io__corner_bus_overlay" orientation = MX )
    )
    (right
    (inst  name="PWR4_P" cell="sky130_fd_io__overlay_vddio_hvc" orientation = R270)
    (inst  name="PAD_spi_master_sdo3_o" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_spi_master_clk_o" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_tdo_o" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_tdi_i" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_tms_i" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_trstn_i" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_tck_i" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PWR4_C" cell="sky130_fd_io__overlay_vccd_hvc" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="GND4_C" cell="sky130_fd_io__overlay_vssd_hvc" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_rst_n" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_clk" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_gpio_in_out_0" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_sda_pad_i_o" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_scl_pad_i_o" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="PAD_BIAS_GENERATOR" skip = 0 orientation = R270 place_status = fixed)
    (inst  name="GND4_P" cell="sky130_fd_io__overlay_vssio_hvc" skip = 4 orientation = R270 place_status = fixed)
    (endspace gap = 0)
    )
)
