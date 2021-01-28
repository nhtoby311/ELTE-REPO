module HW6
import StdEnv

// Generate the following 3 lists!

// l1 contains the first 10 pairs of odd an even numbers like [(1,2), (3,4), (5,6), ...]

// l1::[(Int,Int)]

// The number, the double and the triple of a number of the numbers from 1 to 10.

// l2::[(Int,Int,Int)]

// Generate five times the list from one to five like: [[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]]

// l3::[[Int]]

list1 :: [(Int,Int)]
list1 = take 10 [(x,y) \\ x<-[1,3..] & y<-[2,4..]]

//Start = list1

list2 :: [(Int,Int,Int)]
list2 = [(x,x*x,x*x*x) \\ x<-[1..10]]

//Start = list2

multlist3 :: [Int] Int -> [[Int]]
multlist3 x 0 = []
multlist3 x n = [x : multlist3 x (n-1)]

list3 :: [[Int]]
list3 = multlist3 [1..5] 5

//Start = list3

Start = (list1, list2, list3)