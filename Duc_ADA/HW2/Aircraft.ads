with Coords, Card_Dir, Ada.Numerics.Discrete_Random; 
use Coords, Card_Dir;
-- Define a generic package which implements the Aircraft type. It has 2 generic parameters: an (Id) for airplane identifications, and the (<) operator to compare Id type variables.
generic
    type Id is private;
    -- type Index is (<>);
    -- type TA is array (Index range <>) of Id;
    with function "<" (A,B: Id) return Boolean is <>;
package Aircraft is

    type Aircraft_Type (I: Character) is record
        ID: Character := I;  
        C : Coord; 
        Is_In_The_Air: Boolean := False; 
    end record;

    procedure Ascend(A: in out Aircraft_Type);
    procedure Land(A: in out Aircraft_Type); 
    function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean ;
    function Get_Coord(A:Aircraft_Type) return Coord ;        

    procedure Set_Card_Dir_Coord (A: in out Aircraft_Type;D: in Cardinal_Direction ); -- random 
    
    procedure Start(A: in out Aircraft_Type);
    procedure Compare(A1,A2: in Aircraft_Type);
    function Get_Distance(A1,A2: in Aircraft_Type) return Integer;

    generic
        with procedure Change(I:out character; B:out boolean; C: out Coord);
            procedure Action (A: in AirCraft_Type);

    private
        procedure Set_Coord(A: in out Aircraft_Type; C: in out Coord) ;
        
end Aircraft;
-- Define a generic package which implements the Aircraft type. It has 2 generic parameters: an (Id) for airplane identifications, and the (<) operator to compare Id type variables.

-- In the package include the Aircraft_Type type which has the discriminant (Name) giving the identity of an airplane, and it has two field one represents the airplane position and the other one decides if an airplane is flying (Is_In_The_Air).

-- Implement the following operations.

-- Ascend(Aircraft_Type) : an airplane takes off.

-- Land(Aircraft_Type) : an airplane lands.

-- Get_Is_In_The_Air(Aircraft_Type) : gives back if an airplane is in air or not.

-- Get_Coord(Aircraft_Type) : gives back the position of an airplain.

-- Set_Coord(Aircraft_Type, Coord) : changes the position of an airplane, this should be private.

-- Set_Card_Dir_Coord(Aircraft_Type, Cardinal_Direction) : changes by Cardinal_Direction the position of an airplane, it works like Change_To_Direction.

-- Start(Aircraft_Type) : places an airplane in random position.

-- Compare(Aircraft_Type, Aircraft_Type) : two airplanes can be compared using (<) generic parameter, and print equal, bigger or smaller

-- Get_Distance(Aircraft_Type, Aircraft_Type) : returns the distance between two Aircraft_Type-objects.

-- Create an Action generic procedure which has a generic parameter procedure which can change the status of an Aircraft_Type. The generic parameter procedure has 3 out parameters: the airplane id, coordinates and if is in the air.

-- Please check your implementation with the main demo provided.

-- Notes :

-- The random position of Start(Aircraft_Type) should be between 0 and 100.

