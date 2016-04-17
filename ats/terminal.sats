#define VIDEO_MEMORY_ADDRESS 0x000B8000

#define VGA_WIDTH  80
#define VGA_HEIGHT 25

sortdef vga_x = {n:nat | n < VGA_WIDTH}
sortdef vga_y = {n:nat | n < VGA_HEIGHT}
typedef VgaX = {i:vga_x} int(i)
typedef VgaY = {i:vga_y} int(i)

fun output_char_at(VgaX, VgaY, char): void = "sta#ats_output_char_at" 
fun print_char(char): void
fun print_string(stringLt(VGA_WIDTH * VGA_HEIGHT)): void
