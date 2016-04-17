#!/bin/sh
qemu-system-arm -s -S -d exec -M versatilepb -cpu arm1176 -kernel kernel_dats.elf
