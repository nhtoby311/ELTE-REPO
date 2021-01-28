module examples31

import StdEnv

// Earlier exemples rewritten with map and/or fold.

// 1. Operations with lists: write functions for the followings
// keep the head of every sublist (sublists are not empty)
// e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [1, 3, 5]
heads :: [[Int]] -> [Int]
heads x = map hd x

//Start = heads [[1, 2, 3], [3, 4], [5, 7, 8, 9]]


// 2. Keep the tails of the sublists of a list.
// e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [[2, 3], [4], [7, 8, 9]] 
tails :: [[Int]] -> [[Int]]
tails x = map tl x

//Start = tails [[1, 2, 3], [3, 4], [5, 7, 8, 9]]


// 3. Triple the elements of a list.
triples :: [Int] -> [Int]
triples x = map ((*)3) x

//Start = triples [1..5]


// 4. Check if the numbers of a list are odd.
isoddnrs :: [Int] -> [Bool]
isoddnrs x = map isOdd x

//Start = isoddnrs [1..5]


// 5. Add 100 to the numbers of a list.
add100 :: [Int] -> [Int]
add100 x = map  ((+) 100) x

//Start = add100 [1..8]


// 6. Check if the numbers of a list are multiple of 10.
ismult10 :: [Int] -> [Bool]
ismult10 x = map (\y = y rem 10 == 0) x

//Start = ismult10 [1..20]


// 7. Collect in a list the last digists of the numbers of a list.
lastdigits :: [Int] -> [Int]
lastdigits x = map f x
where f z = z rem 10

//Start = lastdigits [1..35]


// 8. Compute the cube of the numbers of a list.
cube :: Int -> Int
cube x = x * x * x

cubes :: [Int] -> [Int]
cubes x = map cube x

//Start = cubes [1..10]
//Start = cubes []


// 9.  Add the numbers of 1..N (N positive) using foldr.
addn :: Int -> Int
addn n 
| n < 0 = abort "for n negative there is no sum defined"
= foldr (+) 0 [1..n]

//Start = addn 5
//Start = addn 0
//Start = addn -2
//Start = addn 10


// 10. Reverse every sublist of a list.
revsub :: [[Int]] ->  [[Int]]
revsub x = map reverse x 

//Start = revsub [[1,2,3],[5,6],[],[7,8,9,10]]


// 11. Keep the last elements of the sublists of a list in one list 
// (the sublists are not empty).
// [[1,2,3],[5,6],[1],[7,8,9,10]] -> [3,6,1,10]
lasts :: [[Int]] -> [Int]
lasts x = map last x

//Start = lasts [[1,2,3],[5,6],[1],[7,8,9,10]]


// 12. Instert 0 in front of every sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is 
// [[0,1,2,3],[0,5,6],[0],[0,7,8,9,10]]
ins0 :: [[Int]] -> [[Int]]
ins0 x = map ((++) [0]) x

//Start = ins0 [[1,2,3],[5,6],[],[7,8,9,10]]


// 13. Delete the last element of each sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is [[1,2],[5],[],[7,8,9]]
lastdel :: [[Int]] -> [[Int]]
lastdel x = map init x

//Start = lastdel [[1,2,3],[5,6],[],[7,8,9,10]]


// 14. Compute the product of the elements of a list using foldr.
prodf :: [Int] -> Int
prodf x = foldr (*) 1 x

//Start = prodf [1,5,2,4]


// 15. Compute 1*1 + 2*2 + ... + n*n  for n positive using map and foldr.
sumsqr :: Int -> Int
sumsqr n = foldr (+) 0 (map (\x=x*x)  [1..n])

Start = sumsqr 5 // 55