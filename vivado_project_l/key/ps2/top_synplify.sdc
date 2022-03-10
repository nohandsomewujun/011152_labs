#define_clock -internal  {6} [get_ports {clk}] -name  {top|clk} -ref_rise  {0.000000} -ref_fall  {500.000000} -uncertainty  {0.000000} -period  {1000.000000} -clockgroup  {Inferred_clkgroup_0} -rise  {0.000000} -fall  {500.000000} 
#define_clock -internal  {5} [get_nets {vga_dis_test.cnt}] -name  {vga_dis_test|cnt_derived_clock} -ref_rise  {0.000000} -ref_fall  {500.000000} -uncertainty  {0.000000} -period  {1000.000000} -clockgroup  {Inferred_clkgroup_0} -rise  {0.000000} -fall  {500.000000} -disable 
#define_multicycle_path -internal  {5} -from [get_clocks {vga_dis_test|cnt_derived_clock}] -to [get_clocks {vga_dis_test|cnt_derived_clock}]  {2} -disable 