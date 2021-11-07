OUTPUT_DIR ?= target
SCALA_SRCS ?= $(shell find src -name "*.scala")

.PHONY: default prog clean

default: $(OUTPUT_DIR)/Blinky.bin

$(OUTPUT_DIR)/Blinky.v: $(SCALA_SRCS)
	sbt "runMain Blinky --target-dir $(OUTPUT_DIR)"

$(OUTPUT_DIR)/Blinky.json: $(OUTPUT_DIR)/Blinky.v
	yosys -q -p "synth_ice40 -top Blinky -json $@" $<

$(OUTPUT_DIR)/Blinky.asc: $(OUTPUT_DIR)/Blinky.json icestick.pcf
	nextpnr-ice40 -q --json $< --asc $@ --pcf icestick.pcf --hx1k --package tq144

$(OUTPUT_DIR)/Blinky.bin: $(OUTPUT_DIR)/Blinky.asc
	icepack $< $@

prog: $(OUTPUT_DIR)/Blinky.bin
	iceprog $<

clean:
	rm -rf $(OUTPUT_DIR)/
