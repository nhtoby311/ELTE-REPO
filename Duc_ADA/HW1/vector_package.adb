package body vector_package is


    function size(V: Vector) return Natural is
        begin
            return V.Pointer;
        end size;

    function first(V: Vector) return Integer is
        begin
            return  V.Data'First;
        end first;

   function last(V: Vector) return Integer is
        begin 
            return V.Data'Last;
        end last;

    function is_Empty (V: Vector) return Boolean is
        begin
            if (V.Pointer = 0)
                then return True;            
            end if;
            return False;
        end is_Empty;

    procedure insert(V: in out Vector; number: Integer) is 
        begin 
            if V.Pointer < V.Data'Length then
                V.Pointer := V.Pointer + 1;
                V.Data(V.Pointer) := number;
            end if;
        end insert;  

end vector_package;