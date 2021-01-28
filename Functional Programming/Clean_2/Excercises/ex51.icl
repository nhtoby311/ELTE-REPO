module ex51
import StdEnv

// Exercises

// 1. Write a recursive function that computes the n-th multiple of an x.
f1 :: Int Int -> Int
f1 0 x = 0
f1 n x = x + f1 (n-1) x

//Start = f1 5 2

// 2. Add 2 to every odd number of a list, and subtract 2 from every even number.
f2 :: [Int] -> [[Int]]
f2 list = [l1,l2]
where
	l1 = map ((+)2) (filter isOdd list)
	l2 = map ((-)2) (filter isEven list)

//Start = f2 [1,2,3,4,5]

// 3. Compute the triple of the negative elements of a list up to the
//first positive number.
f3 :: [Int] -> [Int]
f3 x = map ((*)3) (takeWhile ((>)0) x)

//Start = f3 [-5..5]


// 4. Write a function that keeps the non-zero elements of a list
// and then multiply by 2 every element.
f4 :: [Int] -> [Int]
f4 x = map ((*)2) (filter ((<>)0) x)

//Start = f4 [-5..5]

// 5. Write a function for the square, the cube, and so on up to
// the n-th power of a number,
// so that increasing powers of a number are obtained in a list.
f51 :: Int Int -> [Int]
f51 x 0 = [1]
f51 x n = [x^n : f51 x (n-1)]
f5 x n = reverse (f51 x n)

//Start = f5 5 2

// 6. Replicate n>0 times a list.
//f6 :: Int [Int] -> [[Int]]


//Start = f6 5 [-5..5]

// 7. Insert 0 at the middle of each sublist.
//g :: [[Int]] -> [[Int]]
//g list = take(length (list/2)) list ++ [0])

//Start = g [[-5..5]]

//f7 :: [[Int]] -> [[Int]]
//f7 list = take

//Start = f7 [[-5..5]]

// 8. Extract the elements smaller then the head element of a list.
f8 :: [Int] -> [Int]
f8 [] = []
f8 [x:xs] = filter ((>)x) xs

//Start = f8 [5,5,2,1,3,4,9,2,3,1]

// 9. Eliminate in a list the sublists that are longer then 10.
f9 :: [[Int]] -> [[Int]]
f9 x = filter (\x = length x<10) x

//Start = f9 [[1..10],[1..20],[1..5]]

// 10. Compute the greatest common divisor in a recursive function.
f10 :: Int Int -> Int

//Start = f10 20 4

// 11. Compute the Euler number aproximation in n steps: e = 1/0! + 1/1! + 1/2! + 1/3! + ... 
//f11 :: Int -> Real

// Start = f11 1000