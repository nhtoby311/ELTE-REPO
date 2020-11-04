with Count, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Main is
    package IQueue is new PQueue(Integer);
    PQ: IQueue.PQueue(100);
begin
    IQueue.Insert(PQ, 10, 2);
end Main; -- OUTPUT: 9