staload "terminal.sats"

implement print_string(str) = let
    fun loop
      {n:nat | n > 0}
      {p:nat | p < VGA_WIDTH * VGA_HEIGHT}
      (str: string(n), pos: int(p)): void =
        if pos = (VGA_WIDTH * VGA_HEIGHT) then ()
        else if string_is_empty(str) then ()
        else let
          // ATS isn't smart enough to figure out that this fits
          // the constraint of VgaX... how annoying.
          // val x: VgaX = pos % VGA_WIDTH
          val x: VgaX = pos - (pos / VGA_WIDTH)
          val y: VgaY = pos / VGA_WIDTH
          val () = output_char_at(x, y, string_head(str))
        in loop(str, pos + 1) end
  in loop(str, 0) end

// TODO: swap impl with one that keeps track of x and y pos

// implement print_char(character) = let
//     val () = output_char_at(current_x_position, current_y_position, character)
//   in increment_current_position() end
// 
// implement print_string(str) =
//   if string_is_empty(str) then ()
//   else begin
//     print_char(string_head(str)); print_string(string_tail(str))
//   end
