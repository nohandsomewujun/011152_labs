-makelib ies_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../labh6.srcs/sources_1/ip/clk50/clk50_clk_wiz.v" \
  "../../../../labh6.srcs/sources_1/ip/clk50/clk50.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

