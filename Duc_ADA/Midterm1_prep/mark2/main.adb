with Gen, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Main is
    type M is array (Integer range <> , Integer range <>) of Natural;
    function test is new Count(Integer,M);
    G: M (1..2,1..2):= ((0,2),(3,4));
begin
    Put(test(G));
end Main; -- OUTPUT: 9