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

set_property PACKAGE_PIN BK28 [get_ports {dout_0[0]}]
set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports {dout_0[0]}]
set_property PACKAGE_PIN BJ28 [get_ports {dout_0[1]}]
set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports {dout_0[1]}]
set_property PACKAGE_PIN BL26 [get_ports {dout_0[2]}]
set_property -dict {IOSTANDARD LVCMOS18 DRIVE 4} [get_ports {dout_0[2]}]

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
set_false_path -from [get_pins {u_top_sub/u0_dut_top/u0_CFG_TOP/u_MFUNC_*/reg_*/C}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
