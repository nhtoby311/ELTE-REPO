with  Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Integer_Text_IO, Ada.Text_IO;

procedure main is
    type Elem is new Integer;
    type Index is new Integer;

    type TArray is array (Index range <>) of Elem;
    
    Arr : TArray := (4,5,3,2,1,1);
begin
    -- for I in Arr'Range loop
    --     Put_Line( Elem'Image( Arr(I) ) );
    -- end loop;
    Put_Line("Last Elem: " & Elem'Image(Arr'Last)) ;
end main;