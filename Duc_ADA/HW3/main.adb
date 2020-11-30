-- Create the following simulation. 
-- The printing should be done by a protected object. 
-- The 1 minute in the text is 0.1 second when programming.

-- Create a task type Patient which receives the name as discriminant
-- A Patient choses one of the available hospitals randomly, and then arrives after 10 minutes. 
-- If it is open, enters and prints (his name and hospital number), if not, after 5 minute tries once again.
-- if he couldn't enter again he goes home (and print (his name) couldn't get into Hospital)
-- 20 dynamic Patients should be created in an array.

-- The hospitals should be also task types.
-- A hospital takes random (float) time to open, after that it allows a patient to enter each minute.
-- 3 dynamic hospitals should be created in an array, opening at 2 minutes intervals.
-- after 10 minutes of opening the hospitals, 
-- they all should close and declare how many patient each one served.
with  Ada.Text_IO, Ada.Integer_Text_IO,Ada.Numerics.Discrete_Random, Ada.Calendar; 
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure main is

    protected type Obj_Type is
        procedure Print (S: String);
    private
    end Obj_Type;

    protected body Obj_Type is
        procedure Print (S: String) is
        begin
            Put_Line(S);
        end Print;
    end Obj_Type;

    task type Patient is
        entry Init(Name: in string := "");
        entry say_Hello;
    end Patient;
    Patients: array (1..20) of Patient;
    type PPatient is access Patient;
    Pat: PPatient;

    task body Patient is
        type PString is access string;
        n: PString;
    begin
        accept Init (Name: in string := "") do n:= new string'(Name); end Init;
        loop
            select
                accept say_Hello do
                    Put_line("Hello");
                    Put_Line(n.all);
                end say_Hello;
            or
                terminate;
            end select;
        end loop;
    end Patient;

--    package R is new Ada.Numerics.Discrete_Random(Float);
--    use R;
--    G: R.Generator;

--    task type Hospital is
--        entry Open_And_Patient_Enter;
--        entry Close;
--    end Hospital;

Pa: Patient;

begin
    Pa.Init ("Duc");
    Pa.say_Hello;
end main;