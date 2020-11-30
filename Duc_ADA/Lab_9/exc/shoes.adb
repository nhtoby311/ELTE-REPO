with text_io; use text_io;
procedure shoes is
   
   task sand is
      entry rightfoot;
      entry leftfoot;
      
   end sand;

   task body sand is
   begin
      loop
         select
            accept leftfoot do
               Put_Line("left foot");
               delay 1.0;
            end leftfoot;
         or 
            accept rightfoot do
               Put_line("right foot");
               delay 1.0;
            end rightfoot;
         or 
            terminate;
         end select;  
      end loop;
   end sand;
begin 
   for I in 1..5 loop
      sand.leftfoot;
      sand.rightfoot;
   end loop;
end shoes;  

-- with text_io; use text_io;
-- procedure shoes is

--    task Shoeleft;
--    task shoeRight;

--    task Sand is
--       entry Left;
--       entry Right;
--    end Sand;

--    task body Sand is
--       check : Boolean := False;
--    begin
--       for I in 1..10 loop
--          if check then
--             accept Left;
--             check := false;
--          else
--             accept Right;
--             check := true;
--             end if;
--       end loop;
--    end Sand;

--    task body shoeLeft is
--    begin
--       for I in 1..5 loop
--          sand.Left;
--          Put_Line("Stepping with left foot");
--          delay 1.0;
--       end loop;
--    end shoeLeft;

--    task body shoeRight is
--    begin
--       for I in 1..5 loop
--          sand.Right;
--          Put_Line("Stepping with right foot");
--          delay 1.0;
--       end loop;
--    end shoeRight;


-- begin
--    null;
-- end shoes;


-- with Ada.Text_IO; use Ada.Text_IO;
-- procedure Shoes is
--     task sand is
--         entry left;
--         entry right;
--     end sand;

--     task body sand is 
--         C: Integer := 0;
--     begin 
--         for I in 1..10 loop 
--             if (C = 0) then
--                 accept left;
--                 C := 1;
--             elsif (C = 1) then
--                 accept right;
--                 C := 0;
--             end if;
--         end loop;     
--     end sand;

--     task rightfoot;
    
--     task body rightfoot is 
--     begin 
--         loop 
--             Put_Line("Right");
--             sand.right;
--         end loop;
--     end rightfoot;

--     task leftfoot;

--     task body leftfoot is 
--     begin 
--         loop
--             Put_Line("Left");
--             sand.left;
--         end loop;
--     end leftfoot;

-- begin
-- null;
-- end Shoes;

-- VERSION 1:

-- with text_io; use text_io;
-- procedure pairOfShoes is
  
     
--    task Sand is
--       entry Left;
--       entry Right;
--    end Sand;
  
  
--    task type Shoe(currentShoe:Integer);
--    task body Shoe is
--    begin
--       for I in 1..5 loop
--          if currentShoe = 1 then
--             sand.Left;
--          else
--             sand.Right;
--          end if;
--          delay 1.0;
--       end loop;
--    end Shoe;
  
--    lShoe : Shoe(1);
--    rShoe : Shoe(2);

  
--    task body Sand is
--       check : Boolean := False;
--    begin
--       for I in 1..10 loop
--          if check then
--             accept Left;
--             Put_Line("Left Shoe walked");
--             check := false;
--          else
--             accept Right;
--             Put_Line("Right Shoe walked");
--             check := true;
           
--          end if;
--       end loop;
--    end Sand;
  
  
-- begin
--    null;
-- end pairOfShoes;

-- ---------------------------------
-- VERSION 2:

-- with Ada.Text_IO; use Ada.Text_IO;

-- procedure PairOfShoes2 is

--    type Steps is (Left, Right);

--     task Feet is
--       entry Order( whatFoot: in Steps);
--     end Feet;

--     task body Feet is
--     begin
--         for I in 1..10 loop
--             accept Order ( whatFoot: in Steps ) do
--                 Put_Line("walking with: " & Steps'Image(whatFoot));
--                 delay 1.0;
--             end Order;
--         end loop;
--     end Feet;

--     task Sand;

--     task body Sand is
--       currentFoot : Boolean := false;
--    begin
--       for I in 1..10 loop
--          if currentFoot then
--             Feet.Order(Left);
--             currentFoot := false;
--          else
--             Feet.Order(Right);
--             currentFoot := true;
--          end if;
--       end loop;
--    end Sand;

-- begin
--    null;
-- end PairOfShoes2;

-- ---------------------------------
-- VERSION 3:


-- with text_io; use text_io;
-- procedure pairOfShoes3 is


-- task Shoeleft;
-- task shoeRight;

-- task Sand is
-- entry Left;
-- entry Right;
-- end Sand;

-- task body Sand is
-- check : Boolean := False;
-- begin
-- for I in 1..10 loop
-- if check then
-- accept Left;
-- check := false;
-- else
-- accept Right;
-- check := true;
-- end if;
-- end loop;
-- end Sand;

-- task body shoeLeft is
-- begin
-- for I in 1..5 loop
-- sand.Left;
-- Put_Line("Stepping with left foot");
-- delay 1.0;
-- end loop;
-- end shoeLeft;

-- task body shoeRight is
-- begin
-- for I in 1..5 loop
-- sand.Right;
-- Put_Line("Stepping with right foot");
-- delay 1.0;
-- end loop;
-- end shoeRight;


-- begin
-- null;
-- end pairOfShoes3;