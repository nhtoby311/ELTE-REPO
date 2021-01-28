module examples8
import StdEnv

// 1. Is x a power of 10?
iprod :: Int -> Bool 
iprod x
| (x == 1) = True
| (x rem 10 == 0) = iprod (x / 10)
= False

//Start = iprod 123 // False


// 2. Write a function to compute 1+2+3+4+5+6+...+n
isum :: Int -> Int
isum n 
| n==0 = 0
| n>0 = n + isum (n-1)

isum1 n = foldr (+) 0 [1..n]

//Start = isum 10
//Start = isum1 10


// 3. Compute the number of sublists in a list
nrlist :: [[Int]] -> Int
nrlist l = length l

//Start = nrlist [[1, 2, 3], [3, 4], [5, 7, 8, 9]]


// 4. Compute the number of all the elements in a list
nrelist :: [[Int]] -> Int
nrelist l = length (flatten l)

//Start = nrelist [[1, 2, 3], [3, 4], [5, 7, 8, 9]]


// 5. Keep the first n and the last n elements of a list
cut :: [Int] Int -> [Int]
cut l x 
| h < x = []
| h == x = []
= (take x l) ++ (drop (h-x) l)
where h = length l

//Start = cut [1, 2, 3, 4, 5, 6, 7, 8, 9] 3

cut1 l x  
| h < x = []
| h == x = []
= (take x l) ++ reverse (take x (reverse l))
where h = length l

//Start = cut1 [1, 2, 3, 4, 5, 6, 7, 8, 9] 3


// 6. Delete the 0 element from a list
delzero :: [Int] -> [Int]
delzero []   =  []
delzero [0:t]   = delzero t 
delzero [h:t] = [h : delzero t]

//Start = delzero [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

delzero1 l = filter ((<>)0) l

//Start = delzero1 [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 


// 7. compute  1*2 + 2*3 + ... + n*n+1 
sums :: Int -> Int
sums n 
| n > 0 = sums (n-1) + n*(n+1)
= 0

//Start = sums 5

sumsp n = sumsp1 n 0

sumsp1 x y 
| x == y = 0
= y*(y+1) + sumsp1 x (y+1) 

//Start = sumsp 5

sums1 0 = 0
sums1 n = (n+1)*n + sums1 (n-1)

//Start = sums1 5


// 8. write a function duplicates which checks if there are neighbouring duplicates in a list
duplic :: [Int] -> Bool
duplic []     = False
duplic [x]     = False
duplic [x, y :xs] = (x == y) || duplic [y : xs]

//Start = duplic [1, 1]
//Start = duplic [2]
//Start = duplic [1, 2, 3, 4, 5, 6, 7, 8, 9]
//Start = duplic [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 


// 9. write a function that removes neighbour duplicates in a list
duplicrem :: [Int] -> [Int] 
duplicrem []     = []
duplicrem [x]     = [x]
duplicrem [x, y :xs]
| (x == y) = duplicrem xs
= [x : duplicrem [y :xs]]

//Start = duplicrem [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0]


// 10. filter the even elements of a list
g :: [Int] -> [Int]
g l = filter isEven l

//Start = g [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 


// 11. compute the half of the elements of a list using map

half :: Int -> Int
half x = x / 2

halfs :: [Int] -> [Int]
halfs y = map half y 

//Start = halfs [1, 2, 3, 4, 5, 6, 7, 8, 9]


// 12. transform the sub-sub lists into one list of sublists
f :: [[[Int]]] -> [[Int]]
f lists = foldr (++) [] lists

//Start = f [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 
// result : [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]

f1 lists = flatten lists

//Start = f1 [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 


// 13. delete the last element of the sublists
dellast :: [[Int]] -> [[Int]] 
dellast x = map init x

//Start = dellast [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]


// 14.  generate the following list [(1,1),(2,2),(3,3),(4,4),(5,5)]
l1 :: [(Int, Int)]
l1 = [(x,x) \\ x<-[1..5]]

//Start = l1


// 15. generate [(1,2,3),(2,4,6),(3,6,9),(4,8,12),(5,10,15)]
l2 :: [(Int, Int, Int)]
l2 = [(y, 2*y, 3*y) \\ y<-[1..5]]

Start = l2