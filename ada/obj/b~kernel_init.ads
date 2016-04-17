pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is
   pragma Warnings (Off);


   GNAT_Version : constant String :=
                    "GNAT Version: 4.9.2" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_kernel_init" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#e4fba2c9#;
   pragma Export (C, u00001, "kernel_initB");
   u00002 : constant Version_32 := 16#22170409#;
   pragma Export (C, u00002, "interruptsB");
   u00003 : constant Version_32 := 16#fa8d1480#;
   pragma Export (C, u00003, "interruptsS");
   u00004 : constant Version_32 := 16#129923ea#;
   pragma Export (C, u00004, "interfacesS");
   u00005 : constant Version_32 := 16#991e70bd#;
   pragma Export (C, u00005, "systemS");
   u00006 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00006, "system__storage_elementsB");
   u00007 : constant Version_32 := 16#63d30d25#;
   pragma Export (C, u00007, "system__storage_elementsS");
   u00008 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00008, "adaS");
   u00009 : constant Version_32 := 16#f45a3945#;
   pragma Export (C, u00009, "terminalB");
   u00010 : constant Version_32 := 16#0bf9a7ae#;
   pragma Export (C, u00010, "terminalS");
   u00011 : constant Version_32 := 16#dd5e1d54#;
   pragma Export (C, u00011, "testB");
   u00012 : constant Version_32 := 16#69ff92de#;
   pragma Export (C, u00012, "testS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  interrupts%s
   --  interrupts%b
   --  terminal%s
   --  terminal%b
   --  test%s
   --  test%b
   --  kernel_init%b
   --  END ELABORATION ORDER


end ada_main;
