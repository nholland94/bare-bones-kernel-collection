with System; use System;
with Interfaces; use Interfaces;

package body Terminal is

  procedure Put_Cell(C : in Cell; X : in Natural; Y : in Natural) is
  begin
    Video_Memory(Y, X) := C;
  end Put_Cell;

  procedure Clear is
    Blank_Cell : Cell;
  begin
    Blank_Cell := (Char => ' ', Color => Default_Cell_Color);

    for Y in Natural range 0 .. VGA_HEIGHT - 1 loop
      for X in Natural range 0 .. VGA_WIDTH - 1 loop
        Put_Cell(Blank_Cell, X, Y);
      end loop;
    end loop;
  end Clear;

  procedure Print_Char(Char : in Character) is
  begin
    Put_Cell((Char => Char, Color => Default_Cell_Color), Column, Row);

    Column := Column + 1;

    if Column >= VGA_WIDTH then
      Column := 0;
      Row := Row + 1;

      if Row >= VGA_HEIGHT then
        Row := 0;
      end if;
    end if;
  end Print_Char;

  procedure Print_String(Str : in String) is
  begin
    for Index in Str'Range loop
      Print_Char(Str(Index));
    end loop;
  end Print_String;

begin

  Row := 0;
  Column := 0;

end Terminal;
