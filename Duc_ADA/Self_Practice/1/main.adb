with  Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure main is 

    task test_termination is 
        entry insert;
        entry remove;
    end test_termination;

    task body test_termination is
    begin
        loop
            select 
                accept insert do
                    Put_Line("Insert");
                end insert;
            or        
                terminate;
            end select;
            select 
                accept remove do
                    Put_Line("Remove");
                end remove;
            or
                terminate;
            end select;
        end loop;
    end test_termination;

begin 
    test_termination.insert;
    test_termination.remove;
    test_termination.insert;
    test_termination.remove;
    test_termination.insert;
    test_termination.remove;
    test_termination.remove;
    test_termination.remove;
end main;