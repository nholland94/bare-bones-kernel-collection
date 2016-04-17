pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~kernel_init.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~kernel_init.adb");

package body ada_main is
   pragma Warnings (Off);

   E03 : Short_Integer; pragma Import (Ada, E03, "interrupts_E");
   E10 : Short_Integer; pragma Import (Ada, E10, "terminal_E");
   E12 : Short_Integer; pragma Import (Ada, E12, "test_E");


   procedure adainit is
   begin
      null;

      Interrupts'Elab_Spec;
      E03 := E03 + 1;
      Terminal'Elab_Spec;
      Terminal'Elab_Body;
      E10 := E10 + 1;
      E12 := E12 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_kernel_init");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/ada.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/interfac.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/system.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/s-stoele.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/interrupts.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/terminal.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/test.o
   --   /home/nathan/bare-bones-kernel-collection/ada/obj/kernel_init.o
   --   -L/home/nathan/bare-bones-kernel-collection/ada/obj/
   --   -L/home/nathan/bare-bones-kernel-collection/ada/obj/
   --   -L/home/nathan/bare-bones-kernel-collection/ada/rts/boards/i386/adalib/
   --   -shared
   --   -lgnat-4.9
--  END Object file/option list   

end ada_main;
