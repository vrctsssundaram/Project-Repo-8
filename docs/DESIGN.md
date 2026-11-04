# Technical design

The raster counters advance only after accepted input handshakes. Start-of-frame reinitializes the effective coordinate origin; end-of-line returns x to zero and increments y. Pixels outside the inclusive ROI rectangle are consumed without output. A one-entry output register holds selected pixel data and ROI sidebands until downstream acceptance.

The ROI configuration must remain stable during an active frame. Pixel format conversion, line buffering, frame synchronization recovery and multi-plane video are outside this revision.
