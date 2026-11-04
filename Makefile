IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_roi_stream_crop -o build/sim rtl/roi_stream_crop.sv tb/tb_roi_stream_crop.sv
	$(VVP) build/sim
