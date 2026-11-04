# Verification record

Date: 04 November 2026
Source revision tested: `7ccce03bda83083911f5404f014a54f1b333f055`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-8/actions/runs/41871671095

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | 4x3 raster cropped to 2x2 ROI, pixel order and SOF/EOL |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
