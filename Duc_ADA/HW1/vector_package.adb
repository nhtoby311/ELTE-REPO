with Ada.Integer_Text_IO, Ada.Text_IO; 
use Ada.Integer_Text_IO, Ada.Text_IO;
package body vector_package is

    procedure printVec(V: in Vector) is 
        begin
            for I in 1..V.Pointer loop
                Put(Integer'Image(V.Data(i)) & " ");
            end loop;
        end printVec;

    function size(V: Vector) return Natural is
        begin
            return V.Pointer;
        end size;

    function first(V: Vector) return Integer is
        begin
            if (is_Empty (V) = False) then
            return  V.Data(1);
            end if;
            return 0;
        end first;

   function last(V: Vector) return Integer is
        begin             
            return V.Data(V.Pointer);
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
                for I in reverse 2..V.Pointer+1 loop                     
                        V.Data(I):= V.Data(I-1);                                            
                end loop;
                V.Data(1):= number;                                
                V.Pointer := V.Pointer+1;
            end if;                        
        end insert;  
    

    procedure assign(V: in out Vector; n, number: Integer ) is 
        begin
            for I in 1..n loop
                insert (V,number);
            end loop;
        end assign;

    procedure pop(V: in out Vector) is   
        begin
            for I in 2..V.Pointer loop
                V.Data(Integer'Pred(I)) := V.Data(I);
            end loop;
            V.Pointer := V.Pointer-1;            
        end pop;

    procedure remove(V: in out Vector; number: Integer; all_occurrences: Boolean:= False) is
        tmp : Integer:= V.Pointer;
        begin
            if (all_occurrences = True) then
                for I in 1..V.Pointer loop
                    if (V.Data(I) = number) then
                        for J in I+1..V.Pointer loop
                            V.Data(Integer'Pred(J)) := V.Data(J);
                        end loop;
                        V.Pointer:= V.Pointer -1;
                    end if;
                end loop;
                if (V.Data(1) = number) then
                    pop(V);
                end if;
            else 
                for I in 1..V.Pointer loop
                    if (V.Data(I) = number) then
                        for J in I+1..V.Pointer loop
                            V.Data(Integer'Pred(J)) := V.Data(J);
                        end loop;
                        V.Pointer:= V.Pointer -1;
                    end if;
                    exit when V.Pointer < tmp;
                end loop;
            end if;
        end remove;

    procedure swap(V1, V2: in out Vector) is -- swap two Vectors
        V3 : Vector (size(V1));
        begin
            if (is_Empty(V1) = False) and (is_Empty(V2) = False) then
                for I in 1..V1.Pointer loop
                    V3.Data(I) := V1.Data(I);
                    V3.Pointer := V3.Pointer+1;
                end loop;
                for I in 1..V1.Pointer loop
                    V1.Data(I):=V2.Data(I);
                end loop;
                V1.Pointer:=V2.Pointer;
                for I in 1..V3.Pointer loop
                    V2.Data(I):=V3.Data(I);
                end loop;
                V2.Pointer := V3.Pointer;
            end if;
        end swap;

    procedure join(V1, V2: in out Vector) is
        V3 : Vector (size(V1)+size(V2));
        begin
            for I in 1..V1.Pointer loop
                V3.Data(I) :=V1.Data(I);
                V3.Pointer := V3.Pointer + 1;
            end loop;
            for I in 1.. V2.Pointer loop
                V3.Pointer := V3.Pointer + 1;
                V3.Data(V3.Pointer) := V2.Data(I);
            end loop;
            V1.Pointer:=0;
            for I in 1.. V3.Pointer loop
                V1.Data(I) :=V3.Data(I);
                V1.Pointer := V1.Pointer+1;
            end loop;
        end join;

    function compare(V1, V2: Vector) return Boolean is
        begin
            if (size(V1) /= size(V2)) then 
                return False;
            else
                for I in 1..V1.Pointer loop
                    if (V1.Data(I) /= V2.Data(I)) then
                        return False;
                    end if;
                end loop;
            end if;
            return True; 
        end compare;
    
    procedure copy(V: in out Vector; arr: TArray) is
        begin
            for I in 1..arr'Length loop
                V.Pointer := V.Pointer+1;
                V.Data(V.Pointer) := arr(I);                
            end loop;
        end copy;

    procedure clear(V: in out Vector) is
        begin
            while (is_Empty(V) /= True) loop
                pop(V);
            end loop;
            Put_Line("V size: " & Integer'Image(size(V)));
        end clear;
end vector_package;