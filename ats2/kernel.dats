#include "kernelats/prelude/staloadall.hats"
#define ATS_DYNLOADFLAG 0

extern fun output_char_at(int, int, char): void = "sta#"
%{^
  #include <stddef.h>
  #include <stdint.h>

  #define VIDEO_MEMORY_ADDRESS 0x000B8000

  #define VGA_WIDTH  80
  #define VGA_HEIGHT 25

  // Prints character with green text.
  // VGA memory is represented as an array of 2 byte records.
  // First byte is the color (left nibble for bg, right for fg).
  // Second byte is the character.
  static void output_char_at(int x, int y, char character) {
    // 0x02 == (0 for black bg, 2 for green fg)
    uint16_t cell = 0x0200 | (uint16_t)character;
    int index = (y * VGA_WIDTH) + x;
    ptrdiff_t offset = index * sizeof(uint16_t);
    *(volatile uint16_t*)(VIDEO_MEMORY_ADDRESS + offset) = cell;
  }
%}

extern fun kernel_main(): void = "ext#kernel_main"
implement kernel_main() = output_char_at(0, 0, '@')

%{$
void kernel_entry() {
  kernel_main();
}
%}
