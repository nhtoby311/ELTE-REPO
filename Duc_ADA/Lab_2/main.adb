with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Float_Text_IO, Text_IO; 
use Ada.Integer_Text_IO, Ada.Text_IO, Ada.Float_Text_IO, Text_IO;
with math; -- use Mat;
procedure main is
    C: Natural;
    F: Float;
    X: Positive;
    N: Positive;
begin
    --9
    Put("Number = ");
    Get(C);
    Put("Add Digit Number: ");
    Put(math.AddDigitNumber(C));
    New_Line;
    --10
    Put("Number divided by 9? " & Boolean'image(math.CheckIfDividedByNine(C)));
    New_Line;
    --11
    Put("Perfect Number in range 1.. 10000: ");
    New_Line;
    for i in 1..10000 loop
       if (math.FindPerfectNumber(i)=True) then
            Put(i);
            Put(" ");
       end if;
    end loop;

    --12
    New_Line;
    Put("X = ");
    Get(F);
    Put("Sin(X) = ");
    Put(math.Sin(F));
    --13
    New_Line;
    Put("Enter number to check Palindrome: ");
    Get(C);
    if (C = math.ReverseNumber(C)) then
        Put("Palindrome");
    else Put("Not Palindrome");
    end if;

    -- 14
    New_Line;
    Put("Power Number:");
    New_Line;
    Put("Enter N: "); Get(N);
    Put("Enter X: "); Get(X);
    New_Line;
    Put("N to the power of X: ");
    Put(math.Power(N,X));

    --15
    New_Line;
    Put("Recursive Factorial");
    New_Line;
    Put("Enter number: ");
    Get(N);
    Put("Factorial: ");
    Put(math.RecursiveFact(N));
end main;