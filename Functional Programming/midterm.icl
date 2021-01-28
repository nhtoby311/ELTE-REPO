module midterm
import StdEnv


//Each exercise is of 0.5 point.

//For mark 2 you MUST have 4 exercises perfectly solved.

//Each further mark needs two more perfect solutions,

//mark 3 - 6 exercises, mark 4 - 8, and mark 5 - 10 perfect solutions.

//1.

//Check if each elements in the list appear even times.
count :: Int [Int] -> Int
count n [] = 0
count n [x:xs]
| n == x = 1 + (count n xs)
= count n xs
checkEven :: [Int] -> Bool
checkEven list = and (map (\x = isEven (count x list)) list)


//Start = checkEven [1,1,2,2,2,2,3,5,3,5] // True

//Start = checkEven [1,1,2,2,1] // False

//2.

//Check if a list of sublists is symmetric.

symList :: [[Int]] -> Bool
symList list = (list == reverse list)
//Start = symList [[1,2], [3,1,4],[3,1,4], [1,2]] // True

//Start = symList [[5,1],[2,3], [3,2], [5,1]]

// False because the position of each element should be the same

//3.

//Given a list, generate a tuple of two lists,

//the first list contains every odd-th number element of the list and

//the second list has every even-th number element of the list.

//Sort the two lists in increasing order.

fun::[Int]->([Int],[Int])

fun list = (sort [list!!a \\ a<-[0..(length list)-1] | isEven a],sort [list!!b \\ b<-[0..(length list)-1] | isOdd b])
//Start = fun [] // []

//Start = fun [1] // ([1],[])

//Start = fun [10,9,20,8,30,7,40,6,50] // ([10,20,30,40,50],[6,7,8,9])

//Start = fun [5,6,2,3,8,4,4,3] // ([2,4,5,8],[3,3,4,6])

//4.

//Write a function that will write out n_th Fibonacci number of every element of the list.

//The Fibonacci numbers are: 0,1,1,2,3,5,8,13,21...
fibo :: Int -> Int
fibo 1 = 0
fibo 2 = 1
fibo n = fibo (n-1) + fibo (n-2)
Fib::[Int]->[Int]
Fib list = map fibo list
//Start = Fib [1] //[0]

//Start = Fib [2,4] //[1,2]

//Start = Fib [2,5,9] //[1,3,21]

//5.

//Given two integers x and y, generate a list of common divisors.

commonDiv :: Int Int -> [Int]
commonDiv n m 
| n == 0 || m == 0 = [0]
= [a \\ a<-[1..n] | n rem a == 0 && m rem a == 0]
//Start = commonDiv 36 12 //[1,2,3,4,6,12]

//Start = commonDiv 12 36 // [1,2,3,4,6,12]

//Start = commonDiv 27 13 //[1]

//Start = commonDiv 32 0 //[0]

//Start = commonDiv 36 36 //[1,2,3,4,6,12,18,36]

//6.

//Given two points as tuples, return the slope

slopeOf :: (Int,Int) (Int,Int) -> Real
slopeOf (a,b) (x,y) = toReal(b-y)/toReal(a-x)
//Start = slopeOf (3,5) (-4,6) //-0.142857142857143

//7.

//Given a list of points as tuples, determine if they lay on the same line.

isLinear :: [(Int,Int)] -> Bool
isLinear [(x,y)] = True
isLinear [(x1,y1),(x2,y2)] = True
isLinear [(x1,y1),(x2,y2):tl] = and (map (\(x,y)= y==k*x+b) tl)
where
	k=(y1-y2)/(x1-x2)
	b=y1-k*x1

//Start = isLinear [(1,1),(2,1),(3,1)] //True

//Start = isLinear [(1,1),(2,2),(3,4)] //False

//8.

//Given a list of integers, make tuples with every consecutive even numbers.

//Pair the last integer with 0, in case the list contains an odd number of integers.

pairEvens :: [Int] -> [(Int, Int)]
pairEvens list = pairEvens1 (filter isEven list)
pairEvens1 list
| isEven (length list) = [(list!!(a), list!!(a+1)) \\ a<-[0..((length list)-1)] | isEven a]
= pairEvens (list ++ [0])


//Start = pairEvens [1..10] // [(2,4),(6,8),(10,0)]

//Start = pairEvens [1,0..(-10)] // [(0,-2),(-4,-6),(-8,-10)]

//Start = pairEvens [1,3..15] // []

//Start = pairEvens [] // []

//9.

//Given a list of non-negative numbers arrange them from smallest to largest

//so that each item will be bigger than the previous one exactly by 1.

//It may need some additional numbers to be able to accomplish that.

//Determine the minimum number of additional numbers needed.

//Example: makeListConsecutive2 [6, 2, 3, 8] = 3. We need to add 4, 5 and 7.
makeListConsecutive2 :: [Int] -> Int
makeListConsecutive2 list = foo (length list) (hd (sort (list))) (last (sort(list)))
foo k min max = (max-min+1)-k


//Start = makeListConsecutive2 [6, 2, 3, 8] // 3

//Start = makeListConsecutive2 [0, 3] // 2

//Start = makeListConsecutive2 [5, 4, 6] // 0

//Start = makeListConsecutive2 [6, 3] // 2

//Start = makeListConsecutive2 [1] // 0

//10.

//We define the middle of the list arr as follows:

//- if arr contains an odd number of elements, its middle is the element

//whose index number is the same when counting from the beginning of the list and from its end;

//- if arr contains an even number of elements, its middle is the sum of the two

//elements whose "index numbers" when counting from the beginning and from the end of the list differ by one.

//Given the list arr, your task is to find its middle, and,

//if it consists of two elements, replace those elements with the value of middle.

//Return the resulting list as the answer.

//Example: replaceMiddle [7, 2, 2, 5, 10, 7] = [7, 2, 7, 10, 7].

//The middle consists of two elements, 2 and 5.

//These two elements should be replaced with their sum, i.e. 7.
replaceMiddle :: [Int] -> [Int]
replaceMiddle list
| isOdd (length list) = list
= (take (myconst-1) list) ++ [(list!!(myconst - 1) + list!!(myconst))] ++ (drop (myconst+1) list)
where
	myconst = (length list)/2

Start = replaceMiddle [7, 2, 2, 5, 10, 7] // [7, 2, 7, 10, 7]

//Start = replaceMiddle [-5, -5, 10] // [-5, -5, 10]

//Start = replaceMiddle [45, 23, 12, 33, 12, 453, -234, -45] // [45, 23, 12, 45, 453, -234, -45]

//Start = replaceMiddle [2, 8] // [10]

//Start = replaceMiddle [-12, 34, 40, -5, -12, 4, 0, 0, -12] // [-12, 34, 40, -5, -12, 4, 0, 0, -12]