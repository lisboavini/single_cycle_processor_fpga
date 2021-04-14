onerror {quit -f}
vlib work
vlog -work work ARQ_Lab1.vo
vlog -work work ARQ_Lab1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ARQ_Lab1_vlg_vec_tst
vcd file -direction ARQ_Lab1.msim.vcd
vcd add -internal ARQ_Lab1_vlg_vec_tst/*
vcd add -internal ARQ_Lab1_vlg_vec_tst/i1/*
add wave /*
run -all
