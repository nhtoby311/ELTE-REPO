-- There is a chicken and a little child that needs to feed the chicken, since
-- in the stomach of the chicken the number of seeds are decreasing at every second.
-- If the nr seeds = 0 then the chicken will die. If the child feeds it, it increases
-- the seeds with 3 (4 seeds are at the beginning in the stomach).
-- The child needs to play with the chicken because if it not then will die of sorrow
-- (in this case an exception GONE will be raised).
-- If the chicken consumes 30 seeds, then it will grow up and fly away, and
-- the child will be unhappy. Write all the events of the feeding simulation on the screen.
with  Ada.Text_IO, Ada.Integer_Text_IO,Ada.Numerics.Discrete_Random, Ada.Calendar; 
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure main is

    Gone: exception;
    Fly : exception;

    task Chicken is
        entry Child_feed;
        entry Child_play;
    end Chicken;

    task body Chicken is
        Seed: Integer:= 4;
        losingTime: Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 0.1 );
    begin
        while (Seed > 0) and (Seed <=30) loop
            select
                accept Child_feed do
                    Seed:= Seed + 3;
                    Put_Line("Child is feeding the chicken, seed left: " & Integer'Image(Seed));
                end Child_feed;
            or
                accept Child_Play do 
                    Seed:=Seed - 2;                   
                    Put_Line("Chicken is playing with kid, seed left: " & Integer'Image(Seed));
                end Child_play;
            or
                delay until losingTime;
                Seed:=Seed -1;
                Put_Line("Chicken lost a seed per sec, seed left" &Integer'Image(Seed));
            end select;
        end loop;
        
        if (Seed <=0) then
            raise Gone;
        elsif (Seed>30) then
            raise Fly;
        end if;
    end ;

package Choice is new Ada.Numerics.Discrete_Random(Boolean);
use Choice;
G: Choice.Generator;

    task child;
    task body child is
        B:Boolean;
    begin
        loop
            B:= random(G);
            if (B=True) then
                Chicken.Child_feed;
            else Chicken.Child_play;
            end if;
        end loop;
    exception
        when Fly => Put_Line("Chicken flew away");
        when Gone => Put_Line("chicken died , kid is sad!");
    end;

begin
Choice.Reset(G);
end main;