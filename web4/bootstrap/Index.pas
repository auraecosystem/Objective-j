program Web4Boot;

{$mode objfpc}{$H+}

uses Process;

begin
  Writeln('[BOOT] Launching Objective-J Web4 Runtime');

  ExecuteProcess('node', 'runtime/vm.js');
end.
