with Coords;
generic
    type Id is private;
    type Index is (<>);
    type TA is array (Index range <>) of Id;
    with function "<" ( A, B: Id ) return Boolean is <>;
-- Define a generic package which implements the Aircraft type. It has 2 generic parameters: an (Id) for airplane identifications, and the (<) operator to compare Id type variables.
package Aircraft is

    type Aircraft_Type is limited private;

    procedure Ascend(A: Aircraft_Type);
    procedure Land(A:Aircraft_Type); 
    function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean ;
    function Get_Coord(A:Aircraft_Type) return Coord ;
    procedure Set_Card_Dir_Coord(A: in out Aircraft_Type;D: in Cardinal_Direction) ;
    procedure Start(A: in out Aircraft_Type) ;
    procedure Compare(A1: Aircraft_Type;A2: Aircraft_Type) ;
    function Get_Distance(A1: Aircraft_Type; A2:Aircraft_Type) return Integer;
    private
    type Aircraft_Type is record
        Name: Character;
        C : Coord;
        Is_In_The_Air: Boolean;
    end record;
        procedure Set_Coord(A: in out Aircraft_Type; C: in out Coord) ;--: changes the position of an airplane, this should be private.
end Aircraft;
-- In the package include the Aircraft_Type type which has the discriminant (Name) giving the identity of an airplane, and it has two field one represents the airplane position and the other one decides if an airplane is flying (Is_In_The_Air).

-- Implement the following operations.

-- Create an Action generic procedure which has a generic parameter procedure which can change the status of an Aircraft_Type. The generic parameter procedure has 3 out parameters: the airplane id, coordinates and if is in the air.