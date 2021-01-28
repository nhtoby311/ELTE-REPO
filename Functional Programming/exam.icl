module exam
import StdEnv
//Each exercise is of 0.5 point.

//For mark 2 you MUST have 4 exercises perfectly solved.

//Each further mark needs two more perfect solutions,

//mark 3 - 6 exercises, mark 4 - 8, and mark 5 - 10 perfect solutions.

//1.

//Check if each elements in the list appear even times.
//check::[Int] Int -> [Bool]
//check [x:xs] n
//| x == n = [True] ++ (check xs n)
//=check xs n
//trans::[Int]->Int
//trans [x:xs] = isEven(length (check [x:xs] x))
//checkEven [x:xs] = (\a= check x n
//checkEven [x:xs]
//| x == True = checkEven xs
//Start = checkEven [1,1,2,2,2,2,3,5,3,5] // True

//Start = checkEven [1,1,2,2,1] // False

//2.

//Check if a list of sublists is symmetric.

//symList :: [[Int]] -> Bool

//Start = symList [[1,2], [3,1,4],[3,1,4], [1,2]] // True

//Start = symList [[5,1],[2,3], [3,2], [5,1]]

// False because the position of each element should be the same

//3.

//Given a list, generate a tuple of two lists,

//the first list contains every odd-th number element of the list and

//the second list has every even-th number element of the list.

//Sort the two lists in increasing order.
eve :: Int [Int] -> [Int]
eve _ [] = []
eve n [x:xs]
| n rem 2 == 0 = [x] ++ eve (n+1) xs
= eve (n+1) xs
oddd :: Int [Int] -> [Int]
oddd _ [] = []
oddd n [x:xs]
| n rem 2 <> 0 = [x] ++ oddd (n+1) xs
= oddd (n+1) xs
fun::[Int]->([Int],[Int])
fun [] = ([],[])
fun [x] = ([x],[]) 
fun x = ((sort (eve 0 x)),(sort (oddd 0 x)))

//Start = fun [] // ([],[])

//Start = fun [1] // ([1],[])

//Start = fun [10,9,20,8,30,7,40,6,50] // ([10,20,30,40,50],[6,7,8,9])

//Start = fun [5,6,2,3,8,4,4,3] // ([2,4,5,8],[3,3,4,6])

//4.

//Write a function that will write out n_th Fibonacci number of every element of the list.

//The Fibonacci numbers are: 0,1,1,2,3,5,8,13,21...
fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)
Fib::[Int]->[Int]
Fib [] = []
Fib [x:xs] = [fibo (x-1)] ++ Fib xs
//Start = Fib [1] //[0]

//Start = Fib [2,4] //[1,2]

//Start = Fib [2,5,9] //[1,3,21]

//5.

//Given two integers x and y, generate a list of common divisors.

commonDiv :: Int Int -> [Int]
commonDiv _ 0 = [0]
commonDiv 0 _ = [0]
commonDiv x y
| x>y = [a\\a<-[1..x]|x rem a == 0 && y rem a == 0]
= [a\\a<-[1..y]|x rem a == 0 && y rem a == 0]
//Start = commonDiv 36 12 //[1,2,3,4,6,12]

//Start = commonDiv 12 36 // [1,2,3,4,6,12]

//Start = commonDiv 27 13 //[1]

//Start = commonDiv 32 0 //[0]

//Start = commonDiv 36 36 //[1,2,3,4,6,12,18,36]

//6.

//Given two points as tuples, return the slope

slopeOf :: (Int,Int) (Int,Int) -> Real
slopeOf x y = ((toReal (snd y)) - (toReal (snd x)))/((toReal (fst y)) - (toReal (fst x)))
//Start = slopeOf (3,5) (-4,6) //-0.142857142857143

//7.

//Given a list of points as tuples, determine if they lay on the same line.
isLinear :: [(Int,Int)] -> Bool
isLinear [x] = True
isLinear [x,y,z:n]
|slopeOf x y == slopeOf y z = isLinear [z:n]
= False

//Start = isLinear [(1,1),(2,2),(3,3)] //True

//Start = isLinear [(1,1),(2,2),(3,4)] //False

//8.

//Given a list of integers, make tuples with every consecutive even numbers.

//Pair the last integer with 0, in case the list contains an odd number of integers.
newlist :: [Int]->[Int]
newlist x = filter isEven x
pairEvens :: [Int] -> [(Int,Int)]
pairEvens list = [(x,y)\\ x<-(newlist list)&y<- (newlist list)|x >= 0 && y >= 0]

Start = pairEvens [1..10] // [(2,4),(6,8),(10,0)]

//Start = pairEvens [1,0..-10] // [(0,-2),(-4,-6),(-8,-10)]

//Start = pairEvens [1,3..15] // []

//Start = pairEvens [] // []

//9.

//Given a list of non-negative numbers arrange them from smallest to largest

//so that each item will be bigger than the previous one exactly by 1.

//It may need some additional numbers to be able to accomplish that.

//Determine the minimum number of additional numbers needed.

//Example: makeListConsecutive2 [6, 2, 3, 8] = 3. We need to add 4, 5 and 7.

makeListConsecutive2 :: [Int] -> Int
makeListConsecutive2 x = (length ([(minList (sort x)) .. (maxList (sort x))])) - (length (sort x))


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

//if it consists of two elements, replace those elements wit