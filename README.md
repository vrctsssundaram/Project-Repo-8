# PixelROI-Stream

Backpressure-aware raster-region cropper for 8-bit pixel streams. The core outputs pixels within a programmable rectangular region and regenerates ROI start-of-frame and end-of-line signals.

This is a video/sensor frontend primitive, not a VVC/HEVC encoder or decoder. Run `make test` to verify a 4×3 input raster cropped into a 2×2 output.

Project owner: Sundaram S S.
