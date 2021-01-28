module examples11
import StdEnv 

// 1. Triple a number.
triple :: Int -> Int
triple x = 3*x

//Start = triple 3


// 2. Check if a number is odd.
isoddnr :: Int -> Bool
isoddnr x = (x rem 2 == 1)

//Start = isoddnr 6


// 3. Check if a number is the sum of two other given numbers.
issum :: Int Int Int -> Bool
issum x y z = (x == y + z)

//Start = issum 10 6 3


// 4. Add 100 to a number.
add100 :: Int -> Int
add100 x = x + 100

//Start = add100 5


// 5. Check if a number is multiple of 10.
ismult10 :: Int -> Bool
ismult10 x = (x rem 10 == 0)

//Start = ismult10 20


// 6. Add the numbers from 1..N in a recursive function (N positive).
addn :: Int -> Int
addn n 
| n == 1 = 1
= n + addn (n-1)

//Start = addn 5


// 7. Compute the N choose K value (N and K are positive, K ).
n_choose_k :: Int Int -> Int
n_choose_k n k
| k == 0 = 1
= (n-k+1)/k * n_choose_k n (k-1)

//Start = n_choose_k 5 2


// 8. Compute the cube of a number
cube :: Int -> Int
cube x = x * x * x

Start = cube 4


// 9*. Define addition as recursive function.
//recadd :: Int -> Int

//Start = recadd 5