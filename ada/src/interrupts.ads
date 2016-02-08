with System; use System;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces; use Interfaces;

package Interrupts is

  type IVT_Entry is
    record
      CS : Unsigned_16;
      IP : Unsigned_16;
    end record;

  IVT : array (0 .. 255) of IVT_Entry;
  for IVT'Address use To_Address(0);
  pragma Import(Ada, IVT);

  procedure Register_Interrupt_Handler(Interrupt_ID : in Natural; Handler_Addr : in Address);

end Interrupts;
