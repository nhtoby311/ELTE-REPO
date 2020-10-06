with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure main  is

    type Index is new Integer;
    type Elem is new Integer;

    type TArray is array (Index range <>) of Elem;
    type Matrix is array (Index range <>, Index range <>) of Elem;

    procedure PrintArr(T: in out TArray) is
    begin
        new_line;
        for I in T'Range loop
            Put_Line( Elem'Image( T(I) ) );
        end loop;
    end PrintArr;

    function SumRecursive(T: TArray) return Elem is
    begin
        if T'Length > 1 then
            return T(T'First) + SumRecursive( T(Index'Succ(T'First)..T'Last) );
        else
            return T(T'First);
        end if;
    end SumRecursive;

    procedure Swap( A, B: in out Elem ) is
    begin
        A := A + B;
        B := A - B; 
        A := A - B; 
    end Swap;

    procedure BBSort(T: in out TArray) is
        B: Boolean:= True;
    begin
        while B loop
            B := False;
            for i in T'Range loop
                if i /= T'Last then
                    if T(i) > T(i+1) then
                        Swap(T(i), T(i+1));
                        B := True;
                    end if;
                end if;
            end loop;
        end loop;
        PrintArr(T);
    end BBSort;

    procedure LocalMax(M: Matrix) is
    min: TArray(M'Range(2));
    minV, maxV: Elem;
    begin
        for j in M'Range(2) loop
            minV := Elem'Last;
            for i in M'Range(1) loop
                if minV > M(i,j) then
                    minV := M(i,j);
                end if;
            end loop;
            min(j - M'First(2) + min'First) := minV;
        end loop;
        for i in M'Range(1) loop
            maxV := Elem'First;
            for j in M'Range(2) loop
                if maxV < M(i,j) then
                    maxV := M(i,j);
                end if;
            end loop;
            for j in M'Range(2) loop
                if maxV = M(i,j) and then maxV = min(j-M'First(2)+min'First) then
                    Put_Line("M(" & Index'Image(i-M'First(1)+1) & Index'Image(j-M'First(2)+1) & " ) =" & Elem'Image(maxV));
                end if;
            end loop;
        end loop;
    end LocalMax;

    function DigalSum(M : Matrix) return Integer is 
        S: Integer := 0;
    begin
        for I in M'Range(1) loop
            S:= S + Integer(M(I,I));
        end loop;
        return S;
    end DigalSum;

    procedure spiral(K: Matrix; i: Index; j: Index; m: Index; n: Index) is
    begin
    if (i >= m) or (j >= n) then
        return;
    end if;
    for c in i..(n-1) loop
        Put(Elem'Image(K(i,c)));
    end loop;
    for c in (i+1)..(m-1) loop
        Put(Elem'Image(K(c,n-1)));
    end loop;
    if (m-1 /= i) then
        for c in reverse j..(n-2) loop
            Put(Elem'Image(K(m-1,c)));
        end loop;
    end if;
    if (n-1 /= j) then
        for c in reverse (i+1)..(m-2) loop
            Put(Elem'Image(K(c,j)));
        end loop;
    end if;
    spiral(K,i+1,j+1,m-1,n-1);
    end spiral;

    procedure GetNextElem(T: TArray ; I : Index) is
    begin
        Put_Line(Elem'Image(T'Last));
    end GetNextElem;

    Arr: TArray := (4,5,2,1);
    Arr2: TArray := (5,2,2,5,3,3,6,7,9,8,19);
    A: Matrix := ((1,1,1),(2,2,2),(3,3,3));
    M: Matrix := ((11, 22, 33, 44, 55), (1,8,3,8,8), (10,10,20,30,1));
    SPI: Matrix := ((11, 22, 33, 44, 55), (1,8,3,8,8), (10,10,20,30,1),(1,2,3,4,5),(6,7,8,9,10));
begin
    -- 16
    Put_Line("Sum of Element Array 1: " & Elem'Image(SumRecursive(Arr)));

    -- 17
    Put("Sorted Array 2: ");
    BBSort(Arr2);
      
    -- 18  
    Put_Line("Sum of Diagonal Matrix 1: " & Integer'Image(DigalSum(A)));
    
    -- 19
    Put_Line("Local Max: ");
    LocalMax(M);

    -- 20
    Put_Line("Spiral: ");
    Spiral(SPI,SPI'First,SPI'First,SPI'First+5,SPI'First+5);
    
    --Get next Element
    -- GetNextElem(Arr,2);
    new_line;
    GetNextElem(Arr,2);
end main;

