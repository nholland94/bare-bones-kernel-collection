Red/System [
  Purpose: "Prints information via bios text printing"
  Author:  "Nathan Holland"
  License: "GNU General Public License (GNU GPL)"
]

#define VRAM_WIDTH   25
#define VRAM_HEIGHT  80
#define VRAM_ADDRESS 000B8000h

#enum color! [
  black: 0
  white: 1
  green: 2
  ; TODO
]

vga-cell!: alias struct! [
  char  [byte!]
  color [byte!]
]

video-memory: as [vga-cell!] VRAM_ADDRESS

; TODO: support bg color
print-char-at: func [
  x [integer!]
  y [integer!]
  char [byte!]
  /local
    index: [integer!]
    video-memory-cell: [vga-cell!]
] [
  index: (y * VRAM_ADDRESS) + x
  video-memory-cell: video-memory + index
  video-memory-cell/char: char
  video-memory-cell/color: green
]
