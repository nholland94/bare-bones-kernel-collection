with System; use System;
with System.Storage_Elements; use System.Storage_Elements;

package Terminal is

  type VGA_Color is (
    Black,
    Blue,
    Green,
    Cyan,
    Red,
    Magenta,
    Brown,
    Light_Grey,
    Dark_Grey,
    Light_Blue,
    Light_Green,
    Light_Cyan,
    Light_Red,
    Light_Magenta,
    Light_Brown,
    White
  );

  for VGA_Color use (
    Black         => 16#0#,
    Blue          => 16#1#,
    Green         => 16#2#,
    Cyan          => 16#3#,
    Red           => 16#4#,
    Magenta       => 16#5#,
    Brown         => 16#6#,
    Light_Grey    => 16#7#,
    Dark_Grey     => 16#8#,
    Light_Blue    => 16#9#,
    Light_Green   => 16#A#,
    Light_Cyan    => 16#B#,
    Light_Red     => 16#C#,
    Light_Magenta => 16#D#,
    Light_Brown   => 16#E#,
    White         => 16#F#
  );

  for VGA_Color'Size use 4;

  type Cell_Color is
    record
      Foreground : VGA_Color;
      Background : VGA_Color;
    end record;

  for Cell_Color use
    record
      Foreground at 0 range 0 .. 3;
      Background at 0 range 4 .. 7;
    end record;

  for Cell_Color'Size use 8;

  type Cell is
    record
      Char  : Character;
      Color : Cell_Color;
    end record;

  for Cell'Size use 16;

  procedure Put_Cell(C : in Cell; X : in Natural; Y : in Natural);
  procedure Clear;
  procedure Print_Char(Char : in Character);
  procedure Print_String(Str : in String);

private

  Row    : Natural;
  Column : Natural;

  VGA_HEIGHT : constant Natural := 80;
  VGA_WIDTH  : constant Natural := 25;

  Video_Memory : array (0 .. VGA_HEIGHT - 1, 0 .. VGA_WIDTH - 1) of Cell;
  for Video_Memory'Address use To_Address(16#B8000#);
  pragma Import(Ada, Video_Memory);

  Default_Cell_Color : constant Cell_Color := (Background => Black, Foreground => Green);

end Terminal;
