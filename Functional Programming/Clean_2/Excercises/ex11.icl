module ex11
import StdEnv 

// 1. Triple a number.
triple :: Int -> Int
triple n = n * 3

//Start = triple 3


// 2. Check if a number is odd.
isoddnr :: Int -> Bool
isoddnr n
| n rem 2 == 1 = True
= False

//Start = isoddnr 5


// 3. Check if a number is the sum of two other given numbers.
issum :: Int Int Int -> Bool
issum x y z
| x == y + z = True
= False

//Start = issum 10 6 3


// 4. Add 100 to a number.
add100 :: Int -> Int
add100 n = n + 100

//Start = add100 5


// 5. Check if a number is multiple of 10.
ismult10 :: Int -> Bool
ismult10 n
| n rem 10 == 0 = True
= False

//Start = ismult10 20


// 6. Add the numbers from 1..N in a recursive function.
addn :: Int -> Int
addn n
| n == 0 = 0
| n > 0 = n + addn(n-1)

//Start = addn 5


// 7. Compute the N choose K value.
n_choose_k :: Int Int -> Int
n_choose_k n k
| k == 0 = 1
= (n-k+1) / k * n_choose_k n (k-1)

//Start = n_choose_k 5 2

// 8. Compute the cube of a number
cube :: Int -> Int
cube n = n^3

//Start = cube 4


// 9*. Define addition as recursive function.
recadd :: Int -> Int
recadd n
| n == 0 = 0
| n < n + 1 = (n-(n-1)) + recadd (n-1)

Start = recadd 5 //5
//Start = recadd 6 //6
//Start = recadd 0 // 0