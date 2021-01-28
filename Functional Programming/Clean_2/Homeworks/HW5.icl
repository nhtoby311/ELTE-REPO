module HW5
import StdEnv


//Write three functions f1, f2, f3.

//f1. Insert x as second element in every sublist of a list.
//If the sublist was empty then x will be the only element in the new sublist.
//[[1,2], [3,4,5], [6,5,9,7], [], [8]] 10 -> 
//[[1,10,2], [3,10,4,5], [6,10,5,9,7], [10], [8,10]]
g1 :: Int [Int] -> [Int]
g1 n [] = [n]
g1 n x = [hd x] ++ [n] ++ tl x

Start = g1 10 [1,2,3,4,5]

f1 :: [[Int]] Int -> [[Int]]
f1 x n = map (g1 n) x

//Start = f1 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10

//f2. Check if a list contains 2 equal elements one after the other 
//(they can be anywhere in the list)
//for [1,2,3,3,2,4,5] is True for [1 .. 5] is False
f2 :: [Int] -> Bool
f2 [x] = False
f2 [x,y:xs] = x == y || f2 xs

//Start = f2 [1,2,3,3,2,4,5]
//Start = f2 [1..5]

//f3. Extract the second element of the sublists (if there is no such element,
//ignore that sublist)
//[[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]-> [2,4,7,9]
f3 :: [[Int]] -> [Int]
f3 x = map (\x = x !! 1) (filter (\x = length x>1) x)

//Start = f3 [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]

//You can test the functions separately as you wish,
// but at the end please include the following start expression as well:

//Start = (f1 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 66, f2 [1,2,3,4,2,2], f3 [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]])