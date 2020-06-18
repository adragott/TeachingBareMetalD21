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

# SRC_C_SUBDIRS:=$(shell find ./src -type f,l -name "*.c" -printf '%h\n' | sort -u)
# SRC_CPP_SUBDIRS:=$(shell find ./src -type f,l -name "*.cpp" -printf '%h\n' | sort -u)
# SRC_S_SUBDIRS:=$(shell find ./src -type f,l -name "*.s" -printf '%h\n' | sort -u)

vpath %.c $(sort $(shell find ./src -type f,l -name "*.c" -printf '%h\n' | sort -u))
vpath %.s $(sort $(shell find ./src -type f,l -name "*.cpp" -printf '%h\n' | sort -u))
vpath %.cpp $(sort $(shell find ./src -type f,l -name "*.cpp" -printf '%h\n' | sort -u))
vpath %.o $(BUILD_DIR)

_OBJ=$(shell find ./src/ -type f,l -name '*.c' -o -name '*.cpp' -o -name '*.s')
OBJ:=$(addprefix $(BUILD_DIR)/, $(notdir $(_OBJ:%.c=%.o)))
DEPS:=$(OBJ:.o=.d)

LDFLAGS+= -T$(LDSCRIPT) -mthumb -mcpu=cortex-m0 -Wl,--gc-sections
CFLAGS+= $(INC) -mcpu=cortex-m0 -mthumb -ggdb -D$(MCUTYPE)

$(ELF): $(OBJ)
	@mkdir -p $(dir $@)
	@echo "============="
	@echo "Linking Target: " $@
	@echo "prereq: " $(OBJ)
	@$(LD) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

# compile and generate dependency info
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@echo "============="
	@echo "Compiling $< ---> $@"
	@$(CC) -c $(CFLAGS) $< -o $@
	@echo "Outputting Dependency from $< ---> "$(BUILD_DIR)/$*.d
	@$(CC) -MM $(CFLAGS) $< > $(BUILD_DIR)/$*.d

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	@echo "============="
	@echo "Assembling $< ---> $@"
	$(AS) $< -o $@

clean:
	rm -f $(OBJ) $(OBJ:.o=.d) $(BUILD_DIR)/*.d $(BUILD_DIR)/*.o $(ELF) $(CLEANOTHER) .gdb_history

debug:  $(ELF)
	arm-none-eabi-gdb -iex "target extended-remote localhost:3333" $(ELF)

# pull in dependencies
-include $(OBJ:$@.o=$@.d)


