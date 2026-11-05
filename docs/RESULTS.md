# Verification record

Date: 05 November 2026
Source revision tested: `953e7b1862c7d49e8ab75e3031c99a0273950a25`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-8/actions/runs/41902463888
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-8/actions/runs/41902463926

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | 4x3 raster cropped to 2x2 ROI, pixel order and SOF/EOL |
| Generic Yosys synthesis | **PASS**; 506 technology-independent cells |

**Evidence:** Tool-reported Icarus Verilog regression and Yosys synthesis results for the source revision cited above.
