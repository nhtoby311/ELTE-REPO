with Coords, Card_Dir, Ada.Numerics.Discrete_Random, Ada.Text_IO;
use Coords, Card_Dir,Ada.Text_IO;
package body Aircraft is
    procedure Ascend(A: in out Aircraft_Type) is
        begin
            A.Is_In_The_Air := True;        
        end Ascend;

    procedure Land(A:Aircraft_Type) is
        begin
            A.Is_In_The_Air := False;
        end Land; 

    function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean is
        begin
            return A.Is_In_The_Air;
        end Get_Is_In_The_Air;

    function Get_Coord(A:Aircraft_Type) return Coord is 
        begin
            return A.C;
        end Get_Coord;
    
    procedure Set_Card_Dir_Coord(A: in out Aircraft_Type;D: in Cardinal_Direction) is
        begin
            case D is
                when 'N'    => Set_Y(A.C, Get_Y(A.C) - 1);
                when 'S'    => Set_Y(A.C, Get_Y(A.C) + 1); 
                when 'E'    => Set_X(A.C, Get_X(A.C) + 1);
                when 'W'    => Set_X(A.C, Get_X(A.C) - 1);
                when 'NE'   => Set_X(A.C, Get_X(A.C) + 1); Set_Y(A.C, Get_Y(A.C) - 1);
                when 'SE'   => Set_Y(A.C, Get_Y(A.C) + 1); Set_X(A.C, Get_X(A.C) + 1);
                when 'SW'   => Set_X(A.C, Get_X(A.C) - 1); Set_Y(A.C, Get_Y(A.C) + 1);
                when 'NW'   => Set_X(A.C, Get_X(A.C) - 1); Set_Y(A.C, Get_Y(A.C) - 1);         
            end case;        
        end Set_Card_Dir_Coord;  

    procedure Start(A: in out Aircraft_Type) is        
        package Random_int is new Ada.Numerics.Discrete_Random (Integer);
        G : Random_int.Generator;
        rand_numb: Integer;
        C: Boolean := False;
        begin            
            while (C != True) loop:
                Random_int.Reset(G);
                rand_numb := Random_int.Random(G);
                if ((rand_numb >= 1) && (rand_numb <= 100)) then
                    Set_X (A.C, rand_numb);
                    C := True;
                end if;                            
            end loop;
            C:= False;
            while (C != True) loop:
                Random_int.Reset(G);
                rand_numb := Random_int.Random(G);
                if ((rand_numb >= 1) && (rand_numb <= 100)) then
                    Set_Y (A.C, rand_numb);
                    C := True;
                end if;                            
            end loop;
        end Start;

    procedure Compare(A1,A2: in Aircraft_Type) is
        begin
            if (A1.ID > A2.ID) then
                Put_Line("Bigger");
            elsif (A1.ID < A2.ID) then    
                Put_Line("Smaller");
            else
                Put_Line("Equeal");
            end if;
        end Compare;

    function Get_Distance(A1: Aircraft_Type; A2:Aircraft_Type) return Integer is
        begin
            return Coords.Get_Distance(A1,A2); 
        end Get_Distance;

    
    -- procedure Set_Card_Dir_Coord (A: in out Aircraft_Type;D: in out Cardinal_Direction );
    -- procedure Start(A: in out Aircraft_Type);
    -- procedure Compare(A1,A2: in Aircraft_Type);
    -- function Get_Distance(A1,A2: in Aircraft_Type) return Integer;
    procedure Set_Coord(A: in out Aircraft_Type; C: in out Coord) is 
        begin
            A.C := C;
        end Set_Coord;
    
    procedure Action(A : in Aircraft_Type) is
        begin
            Gene(A.ID,A.C,A.Is_In_The_Air);
        end Action;
    
end Aircraft;