with Coords, Card_Dir, Ada.Numerics.Discrete_Random, Ada.Text_IO;
use Coords, Card_Dir,Ada.Text_IO;

package body Aircraft is
    procedure Ascend(A: in out Aircraft_Type) is
        begin
            A.Is_In_The_Air := True;        
        end Ascend;

    procedure Land(A: in out Aircraft_Type) is
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
                when N    => Set_Y(A.C, Get_Y(A.C) - 1);
                when S    => Set_Y(A.C, Get_Y(A.C) + 1); 
                when E    => Set_X(A.C, Get_X(A.C) + 1);
                when W    => Set_X(A.C, Get_X(A.C) - 1);
                when NE   => Set_X(A.C, Get_X(A.C) + 1); Set_Y(A.C, Get_Y(A.C) - 1);
                when SE   => Set_Y(A.C, Get_Y(A.C) + 1); Set_X(A.C, Get_X(A.C) + 1);
                when SW   => Set_X(A.C, Get_X(A.C) - 1); Set_Y(A.C, Get_Y(A.C) + 1);
                when NW   => Set_X(A.C, Get_X(A.C) - 1); Set_Y(A.C, Get_Y(A.C) - 1);         
            end case;        
        end Set_Card_Dir_Coord;  

    procedure Start(A: in out Aircraft_Type) is        
        subtype R is Integer range 0..100;
        package Random_int is new Ada.Numerics.Discrete_Random (R);
        G : Random_int.Generator;
        -- C: Boolean := False;
        X,Y: R;
        begin       
            Random_int.Reset(G);
            X:=Random_int.Random(G);
            Random_int.Reset(G);
            Y:=Random_int.Random(G);
            Set_X (A.C, X);
            Set_Y (A.C, Y);
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

    function Get_Distance(A1,A2:Aircraft_Type) return Integer is
        begin
            return ((Get_X(A2.C) - Get_X(A1.C)) * (Get_X(A2.C) - Get_X(A1.C)) + (Get_Y(A2.C) - Get_Y(A1.C)) * (Get_Y(A2.C) - Get_Y(A1.C)));
        end Get_Distance;
    
    procedure Action(A : in Aircraft_Type) is
        I : Character := A.ID;
        B : Boolean := A.Is_In_The_Air;
        C : Coord := A.C;        
        begin
            Change(I,B,C);
        end Action;
    
        procedure Set_Coord(A: in out Aircraft_Type; C: in out Coord) is 
        begin
            A.C := C;
        end Set_Coord;
    
end Aircraft;