-- compile: gnatmake 1.adb
--        ./1
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
procedure Hello is
i:Positive:=3;
begin
Put_Line("Hello, world!");
New_Line;

--for J in 1..10 loop
--        Put_Line("I am an Ada program with package use.");
--end loop;

while i<10 loop
        Put("asdasd");
        Put(i);
        i:=i+1;
end loop;
end Hello;