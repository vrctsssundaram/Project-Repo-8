# Test procedure

Run `make test`; confirm `PASS` and exit code 0. Directed test sends twelve pixels in a 4×3 raster and expects four selected pixels in 2×2 order with regenerated sidebands.

Further work: randomized output stalls, malformed frame markers, ROI changes between frames, extreme image dimensions, pixel-rate timing and memory/resource synthesis.

`make synth` reproduces the generic Yosys RTL synthesis check.
