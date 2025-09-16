##-----------------------------------------------------------------------------
##
## (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##-----------------------------------------------------------------------------
##
## Project    : The Xilinx PCI Express DMA
## File       : xilinx_pcie_xdma_ref_board.xdc
## Version    : 4.1
##-----------------------------------------------------------------------------
#
# User Configuration
# Link Width   - x16
# Link Speed   - Gen3
# Family       - virtexuplusHBM
# Part         - xcvu37p
# Package      - fsvh2892
# Speed grade  - -2L
#
# PCIe Block INT - 6
# PCIe Block STR - PCIE4C_X1Y0
#

# Xilinx Reference Board is F37X
###############################################################################
# User Time Names / User Time Groups / Time Specs
###############################################################################
##
## Free Running Clock is Required for IBERT/DRP operations.
##
#############################################################################################################
#
#############################################################################################################
#
# Configuration
# ------------------------------------------------------------------------------
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]

##set_property PACKAGE_PIN BK28 [get_ports {dout_0[0]}]
##set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports {dout_0[0]}]
##set_property PACKAGE_PIN BJ28 [get_ports {dout_0[1]}]
##set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports {dout_0[1]}]
##set_property PACKAGE_PIN BL26 [get_ports {dout_0[2]}]
##set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports {dout_0[2]}]

### ref_clk of PCIe : 100MHz
set_property PACKAGE_PIN AR14 [get_ports sys_clk_n]
set_property PACKAGE_PIN AR15 [get_ports sys_clk_p]
#set_property IOSTANDARD LVDS [get_ports {ref_clk_clk_n}]
#set_property IOSTANDARD LVDS [get_ports {ref_clk_clk_p}]
##
### perst_n
set_property PACKAGE_PIN C19 [get_ports sys_rst_n]
#set_property IOSTANDARD LVCMOS12 [get_ports perst_n]
#
#############################################################################################################
#############################################################################################################

set_property PACKAGE_PIN H18 [get_ports uart_rxd_i]
set_property -dict {IOSTANDARD LVCMOS18} [get_ports uart_rxd_i]
set_property PACKAGE_PIN H19 [get_ports uart_txd_o]
set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports uart_txd_o]



####################################################################################
# Constraints from file : 'pcie_mem_auto_cc_2_clocks.xdc'
####################################################################################



create_clock -period 10.000 -name sys_clk [get_ports sys_clk_p]
set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_n]

####################################################################################
# Constraints from file : 'pcie_mem_auto_cc_2_clocks.xdc'
####################################################################################

##set_false_path -from [get_pins {u_pcie_mem_wrapper/pcie_mem_i/proc_sys_reset_0/U0/ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N_replica_36/C}]


set_false_path -from [get_pins {u0_top_sub/u0_dut_top/u0_CFG_TOP/u_MFUNC_*/reg_*/C}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]


# System clocks
# 100 MHz (DDR4)
#set_property -dict {LOC BJ43 IOSTANDARD LVDS} [get_ports clk_100mhz_0_p]
#set_property -dict {LOC BJ44 IOSTANDARD LVDS} [get_ports clk_100mhz_0_n]
#create_clock -period 10 -name clk_100mhz_0 [get_ports clk_100mhz_0_p]
set_property -dict {LOC G18  IOSTANDARD LVCMOS18} [get_ports xmc_clk_i]

create_clock -period 10.000 -name xmc_clk_i [get_ports xmc_clk_i]

set_property -dict {LOC BG22 IOSTANDARD LVCMOS18} [get_ports qsfp0_lpmode]
set_property -dict {LOC BL22 IOSTANDARD LVCMOS18} [get_ports qsfp1_lpmode]

set_property -dict {LOC AN40 } [get_ports qsfp0_mgt_refclk_1_p] ;# MGTREFCLK1P_126 from SI546
set_property -dict {LOC AD42 } [get_ports qsfp1_mgt_refclk_1_p] ;# MGTREFCLK1P_130 from SI546



set_false_path -from [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]] -to [get_clocks -of_objects [get_pins {u3_cmac_200g/u0_qsfp0_cmac_inst/inst/cmac_usplus_0_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[2].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {u3_cmac_200g/u0_qsfp0_cmac_inst/inst/cmac_usplus_0_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[2].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]]

set_false_path -from [get_clocks -of_objects [get_pins {u3_cmac_200g/u1_qsfp1_cmac_inst/inst/cmac_usplus_1_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[6].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]]

set_false_path -from [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]] -to [get_clocks -of_objects [get_pins {u3_cmac_200g/u1_qsfp1_cmac_inst/inst/cmac_usplus_1_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[6].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]


set_false_path -from [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]] -to [get_clocks xmc_clk_i]



set_false_path -from [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/user_reset_reg/C] 



set_false_path -from [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]] -to [get_clocks -of_objects [get_pins {u3_cmac_200g/u0_qsfp0_cmac_inst/inst/cmac_usplus_0_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[2].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]] -to [get_clocks -of_objects [get_pins {u3_cmac_200g/u1_qsfp1_cmac_inst/inst/cmac_usplus_1_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[6].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {u3_cmac_200g/u0_qsfp0_cmac_inst/inst/cmac_usplus_0_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[2].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]]
set_false_path -from [get_clocks -of_objects [get_pins {u3_cmac_200g/u1_qsfp1_cmac_inst/inst/cmac_usplus_1_gt_i/inst/gen_gtwizard_gtye4_top.cmac_usplus_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[6].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins u1_pcie_mem_wrapper/pcie_mem_i/xdma_0/inst/pcie4c_ip_i/inst/gt_top_i/diablo_gt.diablo_gt_phy_wrapper/phy_clk_i/bufg_gt_userclk/O]]




