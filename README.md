# icestick-blinky

This is a simple demo that blinks an LED on the [Lattice iCEstick Evaluation
Kit](https://www.latticesemi.com/icestick), written in Chisel3.

It uses the [Chisel](https://www.chisel-lang.org/) to generate the Verilog,
[Yosys](http://bygone.clairexen.net/yosys/) to synthesize it,
[nextpnr](https://github.com/YosysHQ/nextpnr/) to do the placing and routing, and
[Project IceStorm](http://bygone.clairexen.net/icestorm/) to create the bitstream and
program the FPGA.

This is my first attempt at designing hardware, and blinking an LED seemed like
a good first project.

## Running the demo

You'll need Scala and sbt for the Chisel part, and the other programs listed
above.

If you have [Nix](https://nixos.org/), you can get all of these by running:
```sh
$ nix-shell -p gnumake scala sbt icestorm nextpnr yosys
```

Running `make` builds the bitstream, and running `make prog` programs the FPGA.
