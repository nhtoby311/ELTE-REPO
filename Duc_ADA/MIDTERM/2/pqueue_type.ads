generic 
    type Data is private;
    type Priority is (<>);
    -- with function "<" (Q1,Q2:PQueue) return Boolean is <>;
package pqueue_type is 

    type PQueue(Max:Positive) is limited private;
    
    procedure Insert ( PQ : in out PQueue; P : in Priority; D : in Data ); 
	-- procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean ); 

private
type TArr is array (Integer range <>) of Data;    
type PQueue (Max: Positive) is record
    D: TArr (1..Max);
    Pointer: Natural :=0;
end record;


end pqueue_type;