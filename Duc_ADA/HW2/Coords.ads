with Card_Dir; use Card_Dir;
    -- The function takes a Coord type object and Map type array and returns the element of the Map which is on the (X, Y) represented by Coord.
package Coords is
    type Coord is private;

    function Get_X(C: Coord) return Integer;
    function Get_Y(C: Coord) return Integer;
    procedure Set_X(C: in out Coord; number: Integer);
    procedure Set_Y(C: in out Coord; number: Integer);
    function Get_Distance(C1,C2: Coord) return Integer;     
    procedure Change_To_Direction (D: in Cardinal_Direction; C: in out Coord);

    generic
        type Item is private;
        type Index is (<>);
        type Map is array ( Index range <>, Index range <> ) of Item;
        function Coord_With_Array(I: Item;M: Map) return Item;

private
   type Coord is record
            X : Integer;
            Y : Integer;
   end record;
end Coords;
