# https://wiki.hacdc.org/index.php/Iverilogmakefile
# https://makefiletutorial.com/
# https://iverilog.fandom.com/wiki/Iverilog_Flags

VC := iverilog
VRUNTIME := vvp

VFLAGS := -Wall -t $(VRUNTIME)

EXEC := profirTest
EXEC_DIR := ./sim

TARGET_EXEC := $(EXEC_DIR)/$(EXEC)

SRC_RTL := $(shell find ./src/verilog-rtl -name '*.v')
SRC_TB := $(shell find ./src/verilog-tb -name '*.v')

$(TARGET_EXEC): $(SRC_RTL) $(SRC_TB)
	$(VC) $^ $(VFLAGS) -o $(TARGET_EXEC)

# -n flag causes the runtime to end upon $stop 
run: $(TARGET_EXEC)
	(cd $(EXEC_DIR); $(VRUNTIME) -n $(EXEC))

clean:
	rm -f $(TARGET_EXEC)

wave:
	gtkwave ./sim/filterWaveforms.vcd &!

.PHONY: clean