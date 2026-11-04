# Interface summary

| Signal | Meaning |
|---|---|
| `s_pixel[7:0]` | Input grayscale sample |
| `s_sof, s_eol` | Input frame and line markers |
| `s_valid, s_ready` | Input handshake |
| `cfg_x0/x1, cfg_y0/y1` | Inclusive ROI boundaries |
| `m_pixel[7:0]` | Selected output sample |
| `m_sof, m_eol` | ROI frame/line markers |
| `m_valid, m_ready` | Output handshake |

Single clock domain. Throughput is bounded by output backpressure and input pixel rate.
