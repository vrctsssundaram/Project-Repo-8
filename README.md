# PixelROI-Stream

Programmable region-of-interest cropper for grayscale raster pixel streams.

## Features

- Four programmable inclusive ROI coordinates
- SOF/EOL marker regeneration
- Ready/valid output with backpressure

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Scope:** Single 8-bit pixel lane; no image memory, color conversion, scaling or codec.

Project owner: Sundaram S S.
