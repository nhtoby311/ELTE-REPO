module HW7
import StdEnv

// 1. Create using an input list of tuples a new list of tuples like:
// [(1,1), (2,6), (3,9)] -> [(1,1,2), (2,6,8), (3,9,12)]
create l = [(x,y,x+y) \\ x<-(fst a) & y<-(snd a)]
where a = unzip l

//Start = create [(1,1), (2,6), (3,9)]

// 2. Compute the average of tuple elements using map
averages l = [(x,y,x+y/2) \\ x<-(map fst l) & y<-(map snd l)]

//Start = averages [(1,1), (2,6), (3,9)]

// 3. Put the product of the sublist elements in a list, you must use foldr
sublistsp :: [[Int]] -> [Int]
sublistsp [] = []
sublistsp [h:t] = [(foldr (*) 1 h) : sublistsp t]

//Start = sublistsp [[1, 2, 3], [3, 4], [5, 7, 1]] // [6,12,35]

// 4. Generate the following list of lists
// [[1],[2,1],[3,2,1],[4,3,2,1],[5,4,3,2,1]]
genNlist :: Int -> [[Int]]
genNlist l = [reverse (take x [1..5]) \\ x<-[1..l]]

//Start = genNlist 5

// 5. Delete every third element of a list
// e.g. [1,2,3,4,3,2,4,5] -> [1,2,4,3,4,5]
delthird :: [Int] -> [Int]
delthird l = [x \\ x<-l & y<-[1..] | not (y rem 3==0)]

//Start = delthird [1,2,3,4,3,2,4,5]