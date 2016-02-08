#include <stddef.h>
#include <stdint.h>
#include "panic.h"

#define VGA_ADDRESS 0xB8000

#define VGA_WIDTH  80
#define VGA_HEIGHT 25

void panic(char *message) {
  char *character = message;
  ptrdiff_t x = 0;
  ptrdiff_t y = 0;

  uint16_t vga_cell;
  ptrdiff_t vga_offset;

  while(character != NULL && y < VGA_HEIGHT) {
    vga_cell = 0x0400 & *character;
    vga_offset = ((y * VGA_WIDTH) + x) * sizeof(uint16_t);
    *(uint16_t *)(VGA_ADDRESS + vga_offset) = vga_cell;

    if(x < VGA_WIDTH - 1) {
      x++;
    } else {
      x = 0;
      y++;
    }
  }
}
