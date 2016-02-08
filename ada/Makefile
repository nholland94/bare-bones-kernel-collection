ARCH = i386
RTS_DIR = $(shell pwd)/rts/boards/$(ARCH)

ifeq ($(ARCH),i386)
GNATMAKE = gnatmake
AS = as
AS_FLAGS = --32

OBJS = obj/boot.o obj/multiboot.o obj/terminal.o
BOARD = pc

GRUB_LIB=/usr/lib/grub/i386-pc

.PHONY: obj/multiboot.o obj/terminal.o
endif

ifeq ($(ARCH),x86_64)
GNATMAKE = gnatmake
AS = as
AS_FLAGS = --64

OBJS = obj/boot.o obj/multiboot.o obj/terminal.o
BOARD = pc

GRUB_LIB=/usr/lib/grub/x86_64-pc

.PHONY: obj/multiboot.o obj/terminal.o
endif

all: kernel.bin

testos.iso: grub/* kernel.bin
	mkdir -p isodir/boot/grub
	cp $(GRUB_LIB)/stage2_eltorito isodir/boot/grub
	cp grub/* isodir/boot/grub
	cp kernel.bin isodir/boot/kernel.bin
	genisoimage -R -b boot/grub/stage2_eltorito \
		-no-emul-boot -boot-load-size 4 -boot-info-table \
		-o testos.iso isodir

kernel.bin: rts/boards/$(ARCH)/adalib/libgnat-4.8.a $(OBJS) src/kernel_init.adb
	$(GNATMAKE) --RTS=$(RTS_DIR) -XArch=$(ARCH) -XBoard=$(BOARD) -Ptest_os.gpr

obj/boot.o: src/$(BOARD)/boot.s
	$(AS) $(AS_FLAGS) src/$(BOARD)/boot.s -o obj/boot.o

rts/boards/$(ARCH)/adalib/libgnat-4.8.a: rts/boards/$(ARCH)/adainclude/*
	gnatmake -XArch=$(ARCH) -XBoard=$(BOARD) -Pgnat.gpr

.PHONY: clean

clean:
	rm -f obj/* testos
	for a in "x86_64" "i386"; do rm -f rts/boards/$(a)/adalib/*; done
	rm -rf isodir
