PATSHOME=/usr/lib/ats2-postiats-0.1.3
# ATSCC=$(PATSHOME)/bin/patscc
# ATSOPT=$(PATSHOME)/bin/patsopt

# %_sats.o: %.sats
# 	$(ATSCC) $(ATSCCFLAGS) -c $< || echo $@ ": ERROR!"
# 
# %_dats.o: %.dats
#	$(ATSCC) $(ATSCCFLAGS) -c $< || echo $@ ": ERROR!"

all: kernel.bin

%_dats.c: %.dats
	patscc -ccats $<

%_dats.o: %_dats.c
	gcc -std=c99 -m32 -I$(PATSHOME) -I$(PATSHOME)/ccomp/runtime -L$(PATSHOME)/ccomp/atslib/lib -c $<

boot.o: boot.asm
	nasm -felf32 boot.asm -o boot.o

kernel.bin: kernel_dats.o terminal_dats.o
	gcc -T linker.ld -m32 -o kernel.bin -ffreestanding -O2 -nostdlib $^ -lgcc
