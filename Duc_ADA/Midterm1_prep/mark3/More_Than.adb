function More_Than (G: Grid; Max: Natural) return Natural is 
    CNT: Natural:=0;
    S: Natural := 0;    
    begin
        for i in G'Range(1) loop
            for j in G'Range(2) loop
                if (CNT < Max) then
                    S:= S + G(i,j);
                    CNT:= CNT+ 1;
                end if;
            end loop;
        end loop;
        return CNT;
    end More_Than;