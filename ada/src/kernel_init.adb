With Terminal;
with Interrupts;
with Test;

procedure Kernel_Init is
begin
  Interrupts.Register_Interrupt_Handler(16#09#, Test.Test'Address);

  Terminal.Clear;

  Terminal.Print_String("Hello World!");
end Kernel_Init;
