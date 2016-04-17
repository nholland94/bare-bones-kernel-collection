CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld

CFLAGS=-fPIC -march=armv6 -msoft-float -mapcs-frame -marm
LDFLAGS=-N -Ttext=0x10000

PATS_HOME=/usr/lib/ats2-postiats-0.1.3
KERNEL_LIB=$(PWD)/kernelats

# PATS_INCLUDE=-I$(PATS_HOME) -I$(PATS_HOME)/ccomp/runtime
PATS_INCLUDE=-I$(PATS_HOME) -I$(KERNEL_LIB)
PATS_LINK=-L$(PATS_HOME)/ccomp/atslib/lib

ATS_VARS=-D_ATS_CCOMP_HEADER_NONE_ \
	 -D_ATS_CCOMP_PRELUDE_NONE_ \
	 -D_ATS_CCOMP_PRELUDE_USER_=\"./pats_ccomp.h\" \
	 -D_ATS_CCOMP_EXCEPTION_NONE_

.SECONDARY:

all: kernel_dats.elf

debug: CFLAGS+= -g
debug: all

clean:
	rm -f *.o *_dats.s *_dats.c kernel_dats.elf

%_dats.c: %.dats
	patscc -ccats - $@ $<

%.s: %.c
	$(CC) $(PATS_INCLUDE) $(CFLAGS) $(ATS_VARS) -O2 -S -o $@ $<

%.o: %.s
	$(CC) -O2 -c -o $@ $<

%.elf: %.o
	$(LD) $(LDFLAGS) -o $@ $^


kernel_dats.elf: boot.o kernel_dats.o

# kernel_dats.elf: boot_asm.o kernel_dats.o
# 	$(CC) $(CFLAGS) -T linker.ld -ffreestanding -nostdlib -lgcc -o kernel.bin $^
