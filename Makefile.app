TOPPERS_KERNEL = asp3
INCLUDES = -I. -Iinclude -I$(TOPPERS_KERNEL)/include

SRCS = $(wildcard *.c)

TARGET = $(APP).bin

all:
	$(MAKE) -C ../../$(TOPPERS_KERNEL) APP=$(APP) SRCS="$(SRCS)" INCLUDES="$(INCLUDES)"

clean:
	$(MAKE) -C ../../$(TOPPERS_KERNEL) clean
	rm -f *.o *.bin
