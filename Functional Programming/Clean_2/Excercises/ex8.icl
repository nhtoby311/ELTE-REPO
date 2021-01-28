module ex8
import StdEnv

// 1. Is x a power of 10?
iprod :: Int -> Bool 
iprod x
| x == 1 = True
| x rem 10 == 0 = iprod (x/10)
= False

//Start = iprod 123 // False

// 2. Write a function to compute 1+2+3+4+5+6+...+n
isum :: Int -> Int
isum x = foldr (+) 0 [1..x]

//Start = isum 10 // False

// 3. Compute the number of sublists in a list
nrlist :: [[Int]] -> Int
nrlist x = length x

//Start = nrlist [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 4. Compute the number of all the elements in a list
nrelist :: [[Int]] -> Int
nrelist x = length (flatten x)

//Start = nrelist [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 5. Keep the first n and the last n elements of a list
cut :: [Int] Int -> [Int]
cut x n
| y <= n = []
= take n x ++ drop (y-n) x
where
	y = length x

//Start = cut [1, 2, 3, 4, 5, 6, 7, 8, 9] 3

// 6. Delete the 0 element from a list
delzero :: [Int] -> [Int]
delzero x = filter ((<>)0) x

//Start = delzero [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 7. compute  1*2 + 2*3 + ... + n*n+1 
sums :: Int -> Int
sums n = sum [x*(x+1) \\ x <- [1..n]]

//Start = sums 5

// 8. write a function duplicates which checks if there are neighbour duplicates in a list
duplic :: [Int] -> Bool
duplic [] = False
duplic [a] = False
duplic [a,b:t] = (a==b) || duplic [b:t]

//Start = duplic [1, 1]
//duplic [2]
//Start = duplic [1, 2, 3, 4, 5, 6, 7, 8, 9]
//duplic [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 9. write a function that removes neighbour duplicates in a list
duplicrem :: [Int] -> [Int] 
duplicrem [] = []
duplicrem [x] = [x]
duplicrem [x,y:t]
| x==y = duplicrem [y:t]
= [x:duplicrem [y:t]]

//Start = duplicrem [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 10. filter the even elements of a list
g :: [Int] -> [Int]
g x = filter isEven x

//Start = g [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 11. compute the half of the elements of a list using map
halfs :: [Int] -> [Int]
halfs x = map (\x = x/2) x

//Start = halfs [1, 2, 3, 4, 5, 6, 7, 8, 9]

// 12. transform the sub-sub lists into one list of sublists
f :: [[[Int]]] -> [[Int]]
f x = flatten x

//Start = f [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 
// result : [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]

// 13. delete the last element of the sublists
dellast :: [[Int]] -> [[Int]] 
dellast x = map init x

//Start = dellast [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]

// 14.  generate the following list [(1,1),(2,2),(3,3),(4,4),(5,5)]
l1 :: [(Int, Int)]
l1 = [(x,x) \\ x <- [1..5]]

//Start = l1

// 15. generate [(1,2,3),(2,4,6),(3,6,9),(4,8,12),(5,10,15)]
l2 :: [(Int, Int, Int)]
l2 = [(x,x*2,x*3) \\ x <-[1..5]]

Start = l2