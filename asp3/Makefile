# ============================
#  ASP3 Kernel Build Makefile
# ============================

.PHONY: all cfg clean

all: asp.elf

TARGET = primehub_gcc
APP    = $(APP)
CFG    = cfg/cfg.rb

# Directories
KERNEL_DIR = kernel
TARGET_DIR = target/$(TARGET)
SYSSVC_DIR = syssvc
LIB_DIR    = library
INCLUDE    = -Iinclude -I$(TARGET_DIR) -I$(KERNEL_DIR)

# Application
APP_DIR = ../workspace/$(APP)
APP_CFG = $(APP_DIR)/cfg/app.cfg
APP_C   = $(APP_DIR)/app.c

# Generated files
CFG1_OUT = cfg1_out.c
CFG2_OUT = cfg2_out.c

# Compiler
CC = arm-none-eabi-gcc
CFLAGS = -O2 -mcpu=cortex-m4 -mthumb $(INCLUDE)

# Linker
LDSCRIPT = $(TARGET_DIR)/stm32f413xx.ld
LDFLAGS = -T $(LDSCRIPT) -nostartfiles

# ============================
#  Build Rules
# ============================

asp.elf: cfg $(CFG1_OUT) $(CFG2_OUT) $(APP_C) $(TARGET_DIR)/target_kernel_impl.c $(TARGET_DIR)/target_timer.c $(SYSSVC_DIR)/logtask.c
	$(CC) $(CFLAGS) -c $(CFG1_OUT)
	$(CC) $(CFLAGS) -c $(CFG2_OUT)
	$(CC) $(CFLAGS) -c $(APP_C)
	$(CC) $(CFLAGS) -c $(TARGET_DIR)/target_kernel_impl.c
	$(CC) $(CFLAGS) -c $(TARGET_DIR)/target_timer.c
	$(CC) $(CFLAGS) -c $(SYSSVC_DIR)/logtask.c
	$(CC) $(LDFLAGS) *.o -o asp.elf
	arm-none-eabi-objcopy -O binary asp.elf asp.bin

cfg: $(APP_CFG)
	ruby $(CFG) --pass 1 --kernel asp --api-table kernel/kernel_api.def --symval-table kernel/kernel_sym.def $(APP_CFG)
	ruby $(CFG) --pass 2 --kernel asp -T target/$(TARGET)/target_kernel.trb

clean:
	rm -f *.o *.elf *.bin $(CFG1_OUT) $(CFG2_OUT)
