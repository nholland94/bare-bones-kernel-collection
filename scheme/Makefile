kernel.bin: kernel_init.o k_memory.o panic.o scheme.o
	gcc -T linker.ld -o kernel.bin -ffreestanding -O2 -nostdlib $^ -lgcc

clean:
	rm -f kernel.bin *.o
