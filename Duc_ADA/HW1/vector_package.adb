with Ada.Integer_Text_IO, Ada.Text_IO; 
use Ada.Integer_Text_IO, Ada.Text_IO;
package body vector_package is

    procedure print_Vector(V: in Vector) is 
        begin
            for I in 1..V.Pointer loop
                Put(Integer'Image(V.Data(i)) & " ");
            end loop;
        end print_Vector;

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
    
    procedure insert(V: in out Vector; number: Integer) is -- insert a number into the Vector
        begin
        if V.Pointer + 1 <= V.Max then
            V.Pointer := V.Pointer + 1;
            V.Data(V.Pointer) := number;
        end if;
    end;

    procedure assign(V: in out Vector; n, number: Integer ) is  -- insert a number to the Vector n times
    T : Integer := V.Pointer;
    begin
        V.Pointer := V.Pointer + n;
        for I in 1..V.Pointer loop
            for i in 1..n loop
                V.Data(T + i) := number;
            end loop;
        end loop;
    end;


    procedure pop(V: in out Vector) is   
        begin
            for I in 2..V.Pointer loop
                V.Data(Integer'Pred(I)) := V.Data(I);
            end loop;
            V.Pointer := V.Pointer-1;            
        end pop;

    procedure remove(V: in out Vector; number: Integer; all_occurrences: Boolean:= False) is -- remove a number from the Vector, with all_occurrences False as default to remove first occurrence only, otherwise remove all occurrences
        T : Integer ;
        V3: Vector;
        begin
            T := V.Pointer;
            if (all_occurrences = False) then
                for I in 1..V.Pointer loop
                    if (V.Data(I) = number) then
                        for J in I+1..V.Pointer loop
                            V.Data(J-1) := V.Data(J);
                        end loop;
                        V.Pointer:= V.Pointer -1;
                    end if;
                    exit when V.Pointer < T;
                end loop;
            else
                for I in 1..V.Pointer loop
                    if not(V.Data(I) = number) then
                        insert(V3, V.Data(I));                    
                    end if;
                end loop;
                swap(V,V3);
            end if;    
    end remove;

    procedure remove1(V: in out Vector; number: Integer; all_occurrences: Boolean:= False) is
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
        end remove1;

    procedure swap(V1, V2: in out Vector) is -- swap two Vectors
        V3 : Vector (size(V1));
        begin
            if (is_Empty(V1) = False) and (is_Empty(V2) = False) then
                for I in 1..V1.Pointer loop
                    V3.Data(I) := V1.Data(I);
                    V3.Pointer := V3.Pointer+1;
                end loop;
                V1.Pointer:=V2.Pointer;
                for I in 1..V1.Pointer loop
                    V1.Data(I):=V2.Data(I);
                end loop;
                V2.Pointer := V3.Pointer;
                for I in 1..V3.Pointer loop
                    V2.Data(I):=V3.Data(I);
                end loop;
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
        C: Boolean := False;
        Cnt: Integer := 0;
        begin
            if (size(V1) /= size(V2)) then 
                return False;
            else            
            for I in 1..V1.Pointer loop
                for J in 1..V2.Pointer loop
                    if (V1.Data(I) = V2.Data(J)) then
                        C:= True;
                    end if;
                end loop;
                if (C = True) then
                    Cnt:= Cnt + 1;
                end if;
                C:=False;
            end loop;
                if (Cnt = V1.Pointer) then
                return True;    
                else return False;
                end if;
            end if;
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