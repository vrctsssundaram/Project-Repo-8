# Streaming grayscale ROI extractor

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

**Architecture:** Single-lane 8-bit grayscale ROI filter with raster tracking and regenerated markers.

Project owner: Sundaram S S.
