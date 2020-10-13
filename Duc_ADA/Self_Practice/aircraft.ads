-- generic
--     type Id is private;
--     type Index is (<>);
--     type TA is array (Index range <>) of Id;
--     with function "<" ( A, B: Id ) return Boolean is <>;
-- Define a generic package which implements the Aircraft type. It has 2 generic parameters: an (Id) for airplane identifications, and the (<) operator to compare Id type variables.
package aircraft is

    type Aircraft_Type (Name: Character) is private;
    procedure printAir(A: in Aircraft_Type);

    private
    type Aircraft_Type (Name: Character) is record        
        C : Integer := 0;
        Is_In_The_Air: Boolean := False;
    end record;
        
end aircraft;
-- In the package include the Aircraft_Type type which has the discriminant (Name) giving the identity of an airplane, and it has two field one represents the airplane position and the other one decides if an airplane is flying (Is_In_The_Air).

-- Implement the following operations.

-- Create an Action generic procedure which has a generic parameter procedure which can change the status of an Aircraft_Type. The generic parameter procedure has 3 out parameters: the airplane id, coordinates and if is in the air.