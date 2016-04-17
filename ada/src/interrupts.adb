with System; use System;

package body Interrupts is

  -- TODO: not suck at ada and use a range
  procedure Register_Interrupt_Handler(Interrupt_ID : in Natural; Handler_Addr : in Address) is
    Addr : Unsigned_16;
    E    : IVT_Entry;
  begin
    Addr := Unsigned_16(To_Integer(Handler_Addr));
    E.CS := Addr / 16;
    E.IP := Addr rem 16;

    IVT(Interrupt_ID) := E;
  end Register_Interrupt_Handler;

end Interrupts;
