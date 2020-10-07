with reverseArr;
with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
    -- Reverse 
    type TArray is array(Integer range <>) of Integer;
    A: TArray(1..5):=(1, 2, 3, 4, 5);
    procedure swap(a, b: in out Integer) is
        tmp: Integer := a;
    begin
        a := a+b;
        b := a-b;
        a := a-b;
    end swap;
    procedure Revs is new ReverseArr(Integer, Integer, TArray, swap);

    
begin
    Revs(a);
    for i in A'Range loop
        Put_Line(Integer'Image(A(i)));
    end loop;

end Main;