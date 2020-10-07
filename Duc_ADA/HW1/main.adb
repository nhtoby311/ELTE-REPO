with vector_package, Ada.Text_IO;
use Ada.Text_IO;

procedure main is
    package Vec is new vector_package(Integer);

    V: Vec.Vector(100);
begin
    --insert(v,5);
    Vec.insert(V,5);
    Put_Line(Boolean'Image(Vec.is_Empty(V)));
end main;