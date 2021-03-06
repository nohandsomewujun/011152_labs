# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
set_param synth.incrementalSynthesisCache C:/Users/apple/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-8112-969E/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir Y:/Programs/vivado_project/labh6_v2/labh6.cache/wt [current_project]
set_property parent.project_path Y:/Programs/vivado_project/labh6_v2/labh6.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo y:/Programs/vivado_project/labh6_v2/labh6.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/coe.coe
add_files Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/coe.coe
add_files Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/coe_rom.coe
add_files //Mac/Home/Desktop/background.coe
add_files Y:/Desktop/background.coe
read_verilog -library xil_defaultlib {
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/DB.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/DIS.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/PCU.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/PS.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/SRA.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/VDT.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/counter.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/decoder7.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/decodercnt.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/fqp.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/mux.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/trigger.v
  Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/new/PNT_1.v
}
read_ip -quiet Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/VRAM_1/VRAM.xci
set_property used_in_implementation false [get_files -all y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/VRAM_1/VRAM_ooc.xdc]

read_ip -quiet Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/clk50/clk50.xci
set_property used_in_implementation false [get_files -all y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/clk50/clk50_board.xdc]
set_property used_in_implementation false [get_files -all y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/clk50/clk50.xdc]
set_property used_in_implementation false [get_files -all y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/clk50/clk50_ooc.xdc]

read_ip -quiet Y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/ROM/ROM.xci
set_property used_in_implementation false [get_files -all y:/Programs/vivado_project/labh6_v2/labh6.srcs/sources_1/ip/ROM/ROM_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc Y:/Programs/vivado_project/labh6_v2/labh6.srcs/constrs_1/new/PNTS.xdc
set_property used_in_implementation false [get_files Y:/Programs/vivado_project/labh6_v2/labh6.srcs/constrs_1/new/PNTS.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Print -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Print.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Print_utilization_synth.rpt -pb Print_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
