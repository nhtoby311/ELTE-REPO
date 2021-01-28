module HW2
import StdEnv

/*
Write a function that computes the gcd (greatest common divisor) of 
two positive numbers. The function name should be my_gcd.
*/

/*
My original code looked like this:

my_gcd :: Int Int -> Int
my_gcd x y
| x == y = x
| x > y && x rem y == 0 = y
| otherwise = y rem x - x rem y
| x < y && y rem x == 0 = x
| otherwise = x rem y - y rem x

but I kept getting a parse error for definition so I seperated it and it works.
I spent a long time trying to figure it out why it gave an error but I couldn't.
*/
my_gcd_greater_smaller :: Int Int -> Int
my_gcd_greater_smaller x y
| x == y = x
| x > y && x rem y == 0 = y
| otherwise = y rem x - x rem y

//Start = my_gcd_greater_smaller 10 2 //2
//Start = my_gcd_greater_smaller 10 6 //2

my_gcd_smaller_greater:: Int Int -> Int
my_gcd_smaller_greater x y
|x == y = x
| x < y && y rem x == 0 = x
| otherwise = x rem y - y rem x

//Start = my_gcd_smaller_greater 5 5
//Start = my_gcd_smaller_greater 1 5 //1
//Start = my_gcd_smaller_greater 2 5 //1
//Start = my_gcd_smaller_greater 4 10