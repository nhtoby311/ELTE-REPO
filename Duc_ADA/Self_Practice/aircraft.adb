with Ada.Integer_Text_IO, Ada.Text_IO; 
use Ada.Integer_Text_IO, Ada.Text_IO;
package body aircraft is
    procedure printAir(A: in Aircraft_Type) is
        begin
            Put(Character'Image(A.Name));
            Put(Integer'Image(A.C));
            Put(Boolean'Image(A.Is_In_The_Air));
        end printAir;
end aircraft;