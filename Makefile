obj-m += hijack.o

PWD := $(shell pwd)

KBUILD_CFLAGS += -g -Wall
KERNELDIR ?= /lib/modules/$(shell uname -r)/build

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
