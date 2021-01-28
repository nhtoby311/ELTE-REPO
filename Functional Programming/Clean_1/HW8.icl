module HW8
import StdEnv

// 1. Delete from a list the elements that are squares
//delsq :: [Int] -> [Int]
//delsq [x:xs] = [

//Start = delsq [1,3,4,2,1,6,9,1,2,16] //[3,2,6,2]
// 2. Remove the duplicates of a list that are in a sequence, i.e. one after the other
deldup :: [Int] -> [Int] 
deldup [] = []
deldup [x] = [x]
deldup [x, y :xs]
| (x == y) = deldup xs
= [x : deldup [y :xs]]

//Start = deldup [1,2,2,2,2,3,4,2,2,1,1,1,3,3,5,4,4,4,4] //-> [1,2,3,4,2,1,3,5,4]

// 3. Generate elements from 1 to x first in increasing order, then in decreasing order.
list1 :: Int -> [Int]
list1 n 
| n >= 1 = [x \\ x<-[1..n]] ++ reverse [x \\ x<-[1..n]]
= []
Start = list1 4
// e.g. if x=4 then the list is [1,2,3,4,4,3,2,1]

perm [] = [[]]
perm [h:t] = [insertAt y h x \\ x <-perm t , y <- [0..length x]]

//Start = perm [1,2,3,4]
