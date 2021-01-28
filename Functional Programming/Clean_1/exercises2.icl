module exercises2
import StdEnv

// 1. Given a list of triple tuples compute for each tuple (x,y,z) the 
// value (2x,y/2,2z+1)
tumple1::[Int] -> [Int]
tumple1 [x,y,z] = [2*x, y/2, 2*z+1]

//Start = tumple1 [1,2,3]

// 2. Generate the first 10 element of list like: [[0],[0,1,1,0],[0,1,2,2,1,0],[0,1,2,3,3,2,1,0] ...]
gen1 :: Int -> [[Int]]
gen1 [] = []
gen1 0 = 0
gen1 n = take n [(

Start = gen1 10

// 3. Generate the first 10 powers of 2 [1,2,4,8,16 ,...]
gen2 :: Int -> [Int]
gen2 n = take 10 [2^x \\ x<-[0..]]

//Start = gen2 2

// 4. Extract the midle digit of a number e.g.1234 -> 2, 56789 -> 7
//Length



// 5. Find the first 4 perfect numbers. The result will be: [6,28,496,8128]
//   (perfect number = the number is equal to the sum of its divisors)


// 6. Generate pairs of x and x/2 where x is even number of the [1..100] inetrval.


// 7. Given a list of sublists add the head element of a sublist to each element of
// the tail of the same sublist (MAP MUST Be USED!)


// 8. Delete the odd numbers of a given list.


// 9. Sum up the even numbers of a list (FOLDR MUST Be USED!)


// 10. Given a number n make triple tuples: 
// for n = 5 the list is [(1,5,25),(2,10,100),(3,15,225),(4,20,400),(5,625)]


//HOMEWORK
//  11. Given a list of points (the type is taken from the slides)
//  keep only the points that are on one of the axis (x or y)


//  12. Filter the points of list that are visible. 


//  13. Multiply two rational numbers of type Q (defined on the slides)


//  14. Given two rational numbers return the biggest of them.


//  15. Build a search tree for sorting a list in decreased order,
//  then travers inorder the tree.
//  (numbers bigger then the root are going to left child, 
//   numbers smaller then the root are going to right child).