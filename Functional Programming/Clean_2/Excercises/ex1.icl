module ex1
import StdEnv 

//Start = 4+5 // 9
// Start = 42 // 42
// Start = 3+10*2 // 23
// Start = sqrt 3.0 // 1.73...

double x = x + x
quadruple x = double (double x)
// Start = double 2
// Start = quadruple 2

//factorial n = prod [1 .. n]
//Start = factorial 5

// two cases 
abs1 x
| x<0 = ~x
| otherwise = x

// Start = abs1 -4 // 4

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

// Start = factor 5

// function compositions
odd x = not (isEven x)

// Start = odd 23 // True

twiceof :: (a -> a) a -> a
twiceof f x = f (f x)

// Start = twiceof inc 0

Twice :: (t->t) -> (t->t)
Twice f = f o f

// Start = Twice inc 2 // 4


// 1. Check if an integer is even - in two ways. To divide integer use /, for remainder use rem
even1 :: Int -> Bool

even1 x
| x rem 2 == 0 = True
= False

//Start = even1 5

even2 :: Int -> Bool
even2 x
|(x/2)*2 == x = True
= False

//Start = even2 5

even3 :: Int -> Bool
even3 x = ((x/2)*2==x)

//Start = even3 5

// 2. Write a function that takes two arguments, say n and x, and computes their power.
ex2 :: Int Int -> Int

ex2 n x = n^x

//Start = ex2 2 5

ex2b :: Int Int -> Int

ex2b x n
|n == 0 = 1
= x * ex2b x(n-1) //why n-1

//Start = ex2b 2 5

// 3. use 2. to construct a function that squares its argument

ex3 :: Int -> Int

ex3 n = n^2

//Start = ex3 5

// 4. Define the function isum :: Int -> Int which adds the digits of its argument.

isum :: Int -> Int

isum n
| n == 0 = 0
= (n rem 10) + isum (n/10)

//Start = isum 123

// 5. Use the function isum to check whether a number can be divided by 9.

div9 :: Int -> Bool

div9 x = (isum x) rem 9 == 0

//Start = div9 81

// 6. Define a function maxi with two arguments that delivers the maximum of the two.

maxi :: Int Int -> Int

maxi a b
|a > b = a
= b

//Start = maxi 5 5

// 7. Define a function mini that has two arguments that delivers the minimum of the two.

mini :: Int Int -> Int

mini a b
|a < b = a
= b

Start = mini 3 5
