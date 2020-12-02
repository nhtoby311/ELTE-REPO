with  Ada.Text_IO, Ada.Integer_Text_IO,Ada.Numerics.Float_Random, Ada.Calendar; 
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure main is

    protected Door is 
        entry Go_in;
        procedure Go_out;
        procedure Stats;
    private
        inside: Natural := 0;
    end Door;

    protected body Door is 
        entry Go_in is 
            begin 
                Put_Line("Patient go in");
                inside:= inside +1; 
            end;
        procedure Go_out is 
            begin 
                Put_Line ("Patient went out");
                inside:=inside -1; 
            end;
        procedure Stats is
                begin 
                    Put_Line(&Natural'Image (inside)& " in the hospital");
                end;
    end Door;

    task type Patient is
        entry Name(S: in string := "");
    end Patient;
    Patients: array (1..20) of Patient;
    type PPatient is access Patient;
    PP: PPatient;

    task body Patient is
        type PString is access string;
        n: PString;
    begin
        accept Name (S: in string := "") do n:= new string'(S); end Name;
        loop
            select

                Door.Go_in;

            end select;
        end loop;
    end Patient;

    package R1 is new Ada.Numerics.Discrete_Random(Float);
    use R1;
    G: R1.Generator;

    task type Hospital is
        entry Open;
        entry Close;
    end Hospital;
    Hospitals: array (1..3) of Hospital;
    type PHospital is access Hospital;
    PH: PHospital;

    task body Hospital is 
        opening_time: Float;
        open_time: Float := 10;
        close_time: Float;
    begin

    end Hospital;

begin
null;
end main;