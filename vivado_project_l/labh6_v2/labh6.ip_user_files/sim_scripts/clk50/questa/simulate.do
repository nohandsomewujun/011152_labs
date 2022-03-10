onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk50_opt

do {wave.do}

view wave
view structure
view signals

do {clk50.udo}

run -all

quit -force
