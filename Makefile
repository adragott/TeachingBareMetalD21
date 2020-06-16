# LDSCRIPT = ./linker/ex.ld
# BOOTUP = startup_samd21.o system_samd21.o
# MCUTYPE=__SAMD21J18A__
# print-%  : ; @echo $* = $($*)
# BUILD_DIR:=build
# SRC_DIR:=src
# INC_DIR:=inc
# BIN_DIR:=bin

# # Tools
# CC=arm-none-eabi-gcc
# LD=arm-none-eabi-gcc
# AR=arm-none-eabi-ar
# AS=arm-none-eabi-as

# ELF=./bin/main.elf

# INC = -I./inc		\
# -I./inc/asf3-inc	\
# -I./inc/cmsis		\
# -I./inc/drivers		\
# -I./inc/devices

# vpath %.c $(sort $(dir $))
# LDFLAGS+= -T$(LDSCRIPT) -mthumb -mcpu=cortex-m0 -Wl,--gc-sections
# CFLAGS+= $(INC) -mcpu=cortex-m0 -mthumb -ggdb -D$(MCUTYPE)

# SRC := $(shell find src/ -type f,l -name '*.c')

# _OBJ = $(patsubst %.c, %.o, $(SRC))
# #_OBJ=$(join $(addsuffix $(BUILD_DIR)/, $(dir $(SRC))), $(notdir $(SRC:src/*%.c=%.o)))
# OBJ=$(_OBJ:$(SRC_DIR)/%=%)
# $(ELF): $(OBJ)
# 	$(LD) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

# # compile and generate dependency info
# $(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
# 	@mkdir -p $(dir $@)
# 	$(CC) -c $(CFLAGS) $< -o $@
# 	$(CC) -MM $(CFLAGS) $< > $(BUILD_DIR)/$*.d

# $(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
# 	@mkdir -p $(dir $@)
# 	$(AS) $< -o $@

# clean:
# 	rm -f $(OBJ) $(OBJ:.o=.d) $(ELF) $(CLEANOTHER) .gdb_history

# debug:  $(ELF)
# 	arm-none-eabi-gdb -iex "target extended-remote localhost:3333" $(ELF)

# # pull in dependencies
# -include $(OBJ:$@.o=$@.d)


LDSCRIPT = ./linker/ex.ld
BOOTUP = startup_samd21.o system_samd21.o
MCUTYPE=__SAMD21J18A__
print-%  : ; @echo $* = $($*)
BUILD_DIR:=build
SRC_DIR:=src
INC_DIR:=inc
BIN_DIR:=bin

# Tools
CC=arm-none-eabi-gcc
LD=arm-none-eabi-gcc
AR=arm-none-eabi-ar
AS=arm-none-eabi-as

ELF=./bin/main.elf

INC = -I./inc		\
-I./inc/asf3-inc	\
-I./inc/cmsis		\
-I./inc/drivers		\
-I./inc/devices

SRC_C_SUBDIRS:=$(shell find ./src -type f,l -name "*.c" -printf '%h\n' | sort -u)
SRC_CPP_SUBDIRS:=$(shell find ./src -type f,l -name "*.cpp" -printf '%h\n' | sort -u)
SRC_S_SUBDIRS:=$(shell find ./src -type f,l -name "*.s" -printf '%h\n' | sort -u)

vpath %.c $(sort $(SRC_C_SUBDIRS))
vpath %.s $(sort $(SRC_CPP_SUBDIRS))
vpath %.cpp $(sort $(SRC_S_SUBDIRS))
vpath %.o $(BUILD_DIR)

_OBJ=$(shell find ./src/ -type f,l -name '*.c' -o -name '*.cpp' -o -name '*.s')
OBJ:=$(addprefix $(BUILD_DIR)/, $(notdir $(_OBJ:%.c=%.o)))

LDFLAGS+= -T$(LDSCRIPT) -mthumb -mcpu=cortex-m0 -Wl,--gc-sections
CFLAGS+= $(INC) -mcpu=cortex-m0 -mthumb -ggdb -D$(MCUTYPE)

$(ELF): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

# compile and generate dependency info
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	echo "target: " $@ "prereq: " $<
	$(CC) -c $(CFLAGS) $< -o $@
	$(CC) -MM $(CFLAGS) $< > $(BUILD_DIR)/$*.d

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(AS) $< -o $@

clean:
	rm -f $(OBJ) $(OBJ:.o=.d) $(ELF) $(CLEANOTHER) .gdb_history

debug:  $(ELF)
	arm-none-eabi-gdb -iex "target extended-remote localhost:3333" $(ELF)

# pull in dependencies
-include $(OBJ:$@.o=$@.d)


