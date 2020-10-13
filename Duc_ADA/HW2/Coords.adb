function Get_X(C: Coord) return Integer is
    begin
        return C.X;
    end Get_X;

function Get_Y(C: Coord) return Integer is
    begin
        return C.Y;
    end Get_Y;
    
procedure Set_X(C: in out Coord, number: Integer) is
    begin
        C.X := number;
    end Set_X;

procedure Set_Y(C: in out Coord, number: Integer) is
    begin
        C.Y := number;
    end Set_Y;
    
function Get_Distance(C1,C2: Coord) return Integer is
    begin
        return ((Get_X(C2) - Get_X(C1)) * (Get_X(C2) - Get_X(C1)) + (Get_Y(C2) - Get_Y(C1)) * (Get_Y(C2) - Get_Y(C1))); 
    end Get_Distance;
    
procedure Change_To_Direction (D: in Cardinal_Direction, C: in out Coord) is
    begin
        case D is
            when 'N'    => Set_Y(C, Get_Y(C) - 1);
            when 'S'    => Set_Y(C, Get_Y(C) + 1); 
            when 'E'    => Set_X(C, Get_X(C) + 1);
            when 'W'    => Set_X(C, Get_X(C) - 1);
            when 'NE'   => Set_X(C, Get_X(C) + 1); Set_Y(C, Get_Y(C) - 1);
            when 'SE'   => Set_Y(C, Get_Y(C) + 1); Set_X(C, Get_X(C) + 1);
            when 'SW'   => Set_X(C, Get_X(C) - 1); Set_Y(C, Get_Y(C) + 1);
            when 'NW'   => Set_X(C, Get_X(C) - 1); Set_Y(C, Get_Y(C) - 1);         
        end case;
    end Change_To_Direction;
