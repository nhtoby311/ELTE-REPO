module HW6
import StdEnv

/*
Insert an element x after every element of a list.

Delete every second element of a list.

(After inserting and then deleting in fact the original list can be obtained.)
*/

f1 :: Int [Int] -> [Int]
f1 n [] = []
f1 n [x:xs] = [x,n : f1 n xs]

//Start = f1 5[]
Start = f1 5 [1,2,1]

f2 :: [Int] -> [Int]
f2 [] = []
f2 [x] = [x]
f2 [x,y:xs] = [x : f2 xs]

//Start = f2 []
//Start = f2 [1,5,2,5,1,5]
//Start = f2 [1,2,3,4,5]

//Start = (f1 5 [1,2,3], f2 [1,5,2,5,3,5])