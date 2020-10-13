 with Ada.Numerics.Discrete_Random, Ada.Integer_Text_IO, Ada.Text_IO;
    use Ada.Integer_Text_IO, Ada.Text_IO;

    procedure main is
      package Random_int is new Ada.Numerics.Discrete_Random (Integer);
      G : Random_int.Generator;
    begin
      Random_int.Reset(G);

        Put("random Integer : ");
        Put(Random_int.Random(G));
        new_line;

      
    end main;