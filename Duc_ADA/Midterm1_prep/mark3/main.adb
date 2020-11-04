with More_Than, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Main is
    type M is array (Integer range <> , Integer range <>) of Natural;
    function test is new More_Than(Integer, M );
    G: M (1..10,1..10):= ((1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),
                            (1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0),(1,0,1,0,1,0,1,0,1,0));
begin
    Put(Boolean'Image(test(G,30)));
end Main; 