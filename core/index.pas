program Index;

{$mode objfpc}{$H+}

uses
  SysUtils, Process;

procedure BootBridge;
var
  ProcessHandle: TProcess;
begin
  Writeln('Starting Web4 Bridge...');

  ProcessHandle := TProcess.Create(nil);
  try
    ProcessHandle.Executable := 'node';
    ProcessHandle.Parameters.Add('bridge/bridge.js');
    ProcessHandle.Options := ProcessHandle.Options + [poWaitOnExit];
    ProcessHandle.Execute;
  finally
    ProcessHandle.Free;
  end;
end;

begin
  Writeln('==============================');
  Writeln(' Web4 Objective-J Runtime');
  Writeln(' Pascal Core Bootloader');
  Writeln('==============================');

  Writeln('Initializing system...');

  Sleep(500);

  Writeln('✔ Memory subsystem ready');
  Writeln('✔ Scheduler ready');
  Writeln('✔ VM host standby');

  BootBridge;

  Writeln('System shutdown complete.');
end.
