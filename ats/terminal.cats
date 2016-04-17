// Prints character with green text.
// VGA memory is represented as an array of 2 byte records.
// First byte is the color (left nibble for bg, right for fg).
// Second byte is the character.
static void ats_output_char_at(int x, int y, char character) {
  // 0x02 == (0 for black bg, 2 for green fg)
  uint16_t cell = 0x0200 | (uint16_t)character;
  int index = (y * VGA_WIDTH) + x;
  ptrdiff_t offset = index * sizeof(uint16_t);
  *(volatile uint16_t*)(VIDEO_MEMORY_ADDRESS + offset) = cell;
}
