module examples3

import StdEnv

// 1. Compute the product of the elements of a list
product :: [Int] -> Int
product [] = 1
product [h:t] = h * product t

//Start = product [1..5] // 120

// 2. delete the elements equal to 5
not_five :: [Int] -> [Int]
not_five  []  =  []
not_five  [5:t]  = not_five t 
not_five  [h:t]  = [h : not_five t] 

// Start = not_five [5,4,5,4,3]  // [4,4,3]

// 3. Delete an element n from a list
del :: Int [Int] -> [Int]
del _  []   =  []
del n  [h:t]   
|  n==h     = del n t 
del n [h:t] = [h : del n t]

// Start = del 5 [1, 5, 6, 7, 5, 8, 5] // [1, 6, 7, 8]


// 4. write a funtion with the patterns depending on the parameter:
// if the param is [] then is equal to 20, if is a two element list starting with 4 then is 30
// if is a two element list ending with 5 then is 40, in all other cases is 50, 
// the order of the patterns is important
gp :: [Int] -> Int
gp [] = 20
gp [4,_] = 30
gp [_,5] = 40
gp _ = 50 

// Start = gp [4, 6] // 30


// 5. write a funtion which returns true if a is divisible by b
div_by :: Int Int -> Bool
div_by a b = a rem b == 0

// Start = div_by 16 4      // True


// 6. write a funtion which returns true if a is divisible by b or vice versa
div_any :: Int Int -> Bool
div_any a b = div_by a b || div_by b a

// Start = div_any 4 16     // True


// 7. sumsq n returns 1*1 + 2*2 + ... + n*n - with a pattern for 0
sumsq :: Int -> Int
sumsq 0         = 0
sumsq n 
| n > 0 = sumsq (n-1) + n*n

// Start = sumsq 3 // 14


// version 2. - without pattern for 0
sums :: Int -> Int
sums n 
| n > 0 = sumsq (n-1) + n*n
= 0

// Start = sums 3 // 14
  

// 8. check if a number is palindrom e.g.12321
p :: Int -> [Int]
p x = digits x []

//Start = p 520

digits :: Int [Int] -> [Int]
digits 0 l = l
digits x l = digits (x/10) [x rem 10 : l]

Start = digits 204

pali :: Int -> Bool
pali x = y == reverse y
where 
    y = p x

// Start = pali 12321 // True
 

// 9. Computes the nth Fibonacci number - try more versions
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

// Start = fib 5 // 8

fib1 :: Int -> (Int, Int)
fib1 0 = (1,1)
fib1 1 = (1,1)
fib1 n = (b,a+b)
where
	(a,b) = fib1 (n-1)

// Start = fib1 8 // (21, 34)

fib2 :: Int Int Int -> Int
fib2 a b 0 = a
fib2 a b c = fib2 b (a+b) (c-1)

// Start = fib2 1 1 10 // 89

fib3 :: Int -> Int
fib3 n = fibAux n 1 1

fibAux 0 a b         = a
fibAux i a b | i > 0 = fibAux (i-1) b (a+b)

// Start = fib3 8 // 34


// 10. exists x xs checks whether x exists as an element in the list xs (or is ||, and is &&)
exists :: Int [Int] -> Bool
exists x []     = False
exists x [y:ys] = x == y || exists x ys

// Start = exists 3 [1, 2, 1, 1, 2, 3, 2, 1, 3] // True

// 11. write the function duplicates which checks if there are duplicates in the list xs
duplicates :: [Int] -> Bool
duplicates []     = False
duplicates [x:xs] = exists x xs || duplicates xs

// Start = duplicates [1, 2, 1, 1, 2, 3, 2, 1, 3] // True


// 12. remove x xs removes x from the list xs
remove :: Int [Int] -> [Int]
remove x []                 = []
remove x [y:ys] 
| x == y    = remove x ys
| otherwise = [y : remove x ys]

// Start = remove 3 [1, 2, 1, 1, 2, 3, 2, 1, 3] // [1, 2, 1, 1, 2, 2, 1] 

// 13. removeDuplicates l returns the list l with all duplicate elements removed
removeDuplicates :: [Int] -> [Int]
removeDuplicates []     = []
removeDuplicates [x:xs] = [x : removeDuplicates (remove x xs)]

// Start = removeDuplicates [1, 2, 1, 2, 3, 1, 2, 4, 2, 3] // [1, 2, 3, 4]


// 14. filter the elements that are satisfying a condition
filter` :: (Int -> Bool) [Int] -> [Int]
filter`  _  []    =  []
filter`  p  [h:t]    
| p h             = [h : filter` p t]
filter`  p  [h:t] = filter` p  t  

// Start = filter` ((<>) 5) [1, 5, 6, 7, 5, 8, 5]  // [1, 6, 7, 8]

