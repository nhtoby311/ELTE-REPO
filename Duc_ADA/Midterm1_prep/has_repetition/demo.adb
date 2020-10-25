with has_repetition, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure demo is 
    type TInt is array (Integer range <>) of Integer;
    function my_rep is new has_repetition(Integer,Integer, TInt);
    v1: TInt := (1,1,2,3,4,5);
    begin
        Put_Line(Boolean'Image(my_rep(v1)));
    end demo;