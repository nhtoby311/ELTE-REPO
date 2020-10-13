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
            return A.Coord;
        end Get_Coord;

    -- procedure Set_Card_Dir_Coord(A: in out Aircraft_Type;D: in Cardinal_Direction) ;
    -- procedure Start(A: in out Aircraft_Type) ;
    -- procedure Compare(A1: Aircraft_Type;A2: Aircraft_Type) ;
    -- function Get_Distance(A1: Aircraft_Type; A2:Aircraft_Type) return Integer;
    -- procedure Set_Coord(A: in out Aircraft_Type; C: in out Coord) ;
end Aircraft;