onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+design_yodann -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_yodann xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_yodann.udo}

run -all

endsim

quit -force
