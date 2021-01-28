module HW9
import StdEnv

// 1. Given a list of triple tuples compute for each tuple (x,y,z) 
//the value (2x,y/2,2z+1)
f1 :: [(Int,Int,Int)] -> [(Int,Int,Int)]
f1 x = [(2*x,y/2,2*z+1) \\ x <-  map fst3 x & y <- map snd3 x & z <- map thd3 x]

//Start = f1 [(1,2,3),(1,4,4),(9,10,6)]

// 2. Generate the first 10 element of list like: 
//[[0],[1,1],[0,1,2,2,1,0],[0,1,2,3,3,2,1,0] ...]
g2 :: Int -> [Int]
g2 0 = [0]
g2 1 = [1,1]
g2 x
| x>= 2 = [x \\ x<-[0..x]] ++ reverse [x \\ x<-[0..x]]
= []

//Start = g2 1

f2 :: Int -> [[Int]]
f2 x = take 11 [g2 x: f2 (x-1)]

//Start = f2 10

//Start = reverse (f2 10)

// 3. Generate the first 10 powers of 2 [1,2,4,8,16 ,...]
f3 :: [Int]
f3 = take 10 [2^x \\ x<-[0..]]

//Start = f3