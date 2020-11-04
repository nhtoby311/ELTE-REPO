with pqueue_type, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure demo is
    package IQueue is new pqueue_type(Integer,Integer);
    
    PQ: IQueue.PQueue(100);
begin
    IQueue.Insert(PQ, 10, 2);
end demo;