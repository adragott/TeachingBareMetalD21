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

# LDFLAGS+= -T$(LDSCRIPT) -mthumb -mcpu=cortex-m0 -Wl,--gc-sections
# CFLAGS+= $(INC) -mcpu=cortex-m0 -mthumb -ggdb -D$(MCUTYPE)

# SRC := $(wildcard $(SRC_DIR)/*.c)


# _OBJ=$(join $(addsuffix $(BUILD_DIR)/, $(dir $(SRC))), $(notdir $(SRC:src/%.c=%.o)))
# OBJ=$(_OBJ:$(SRC_DIR)/%=%)
# $(ELF): $(OBJ)
# 	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

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




