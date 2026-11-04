IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_roi_stream_crop -o build/sim rtl/roi_stream_crop.sv tb/tb_roi_stream_crop.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/roi_stream_crop.sv; hierarchy -check -top roi_stream_crop; synth -top roi_stream_crop; stat'
