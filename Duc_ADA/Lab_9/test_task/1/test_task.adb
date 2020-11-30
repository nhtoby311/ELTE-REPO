with Ada.Text_IO; use Ada.Text_IO;

procedure test_task is 
    task T;
    task body T is 
    begin 
        Put_Line("Task T");
    end T;
begin
    Put_Line ("Main");
end test_task;