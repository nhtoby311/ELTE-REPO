module ex1
import StdEnv 

//Start = 4+5 // 9
// Start = 42 // 42
// Start = 3+10*2 // 23
//Start = sqrt 3.0 // 1.73...

double x = x + x
quadruple x = double (double x)
//Start = double 2
//Start = quadruple 2

factorial n = prod [1 .. n]
//Start = factorial 5

// two cases 
abs1 x
| x<0 = ~x
| otherwise = x

//Start = abs1 -4 // 4

// otherwise can be omitted 
abs2 x
| x<0 = ~x
= x

// Start = abs2 4 // 4

// more then two guards or cases
signof x
| x>0 = 1
| x==0 = 0
| x<0 = -1
 
// Start =  signof -8 // -1

factor :: Int -> Int
factor n
| n==0 = 1
| n>0 = n * factor (n-1)

Start = factor 5

// function compositions
odd x = not (isEven x)

// Start = odd 23 // True

twiceof :: (a -> a) a -> a
twiceof f x = f (f x)
//Start = twiceof inc 1

Twice :: (t->t) -> (t->t)
Twice f = f o f

//Start = Twice inc 2 // 4


// 1. Check if an integer is even - in two ways. To divide integer use /, for remainder use rem


// 2. Write a function that takes two arguments, say n and x, and computes their power.


// 3. use 2. to construct a function that squares its argument


// 4. Define the function isum :: Int -> Int which adds the digits of its argument.


// 5. Use the function isum to check whether a number can be divided by 9.


// 6. Define a function maxi with two arguments that delivers the maximum of the two.


// 7. Define a function mini that has two arguments that delivers the minimum of the two.
