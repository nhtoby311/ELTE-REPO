generic
    Type Elem is limited private;
    Type Index is (<>);
    Type TArray is array (Index range <>) of Elem;
    with procedure swap(x,y: in out Elem);
    procedure ReverseArr(A: in out TArray);
