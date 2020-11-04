with pqueue_type;
package body pqueue_type is 
    procedure Insert ( PQ : in out PQueue; P : in Priority; D : in Data ) is   
        begin
            if (P<=PQ.Priority) then
                PQ.D(PQ.Pointer) := D;
                PQ.Pointer := PQ.Pointer + 1;
            end if;
        end Insert;

    -- procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean ) is
    --     begin
    --         for I in 1..PQ.Pointer loop

    --         end loop;
    --     end Get;
    
    
end pqueue_type;