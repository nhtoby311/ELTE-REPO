module HW5
import StdEnv

/*Given a list of sublists compute the followings:

delete every second element of the sublists

sort each sublist

at the end concatenate them in one list*/

//Delete 2nd element of sublist
del :: [Int] -> [Int]
del [] = []
del x = [hd x:del (drop 2 x)]

//Sort Sublist
subsort :: [Int] -> [Int] 
subsort [] = []
subsort [a:xs] = subsort [x \\ x<-xs | x<a] ++ [a] ++ subsort [x \\ x<-xs | x>=a]

//Concatenate
list :: [[Int]] -> [Int]
list [] = []
list x = flatten (map subsort (map del x))


Start = list [[2,1,4],[5,8,3,1],[],[1..10],[10,3,8]] //[2,4,3,5,1,3,5,7,9,8,10]