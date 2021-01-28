module ex81
import StdEnv

// 1. Compute the sum of the list of tuples [(1,1), (2,2), (3,3)] -> (6,6)
sumtup x = (sum y, sum z)
where
	(y,z) = unzip x

//Start = sumtup [(1,1), (2,2), (3,3)]


// 2. Generate 5 tuples like [(1,2),(2,3),(3,4),(4,5),(5,6)]
increase = [(x,x+1) \\ x <- [1..5]]

//Start = increase


// 3. Make triple tuples like [(1,2,3),(4,5,6),(7,8,9),(10,11,12),(13,14,15)]
tripl = take 5 [(x,x+1,x+2) \\ x <- [1,4..]]

//Start = tripl


// 4. Given a list of lists, transform it tuples of sublist such that two 
// continous sublists form pairs 
// (if there are odd number of sublist the last has as pair the empty list)
pairs :: [[Int]] -> [([Int],[Int])]
pairs [] = []
pairs [a] = [(a,[])]
pairs[a,b:t] = [(a,b):pairs t]

//Start = pairs [[1,2,3], [5,6], [7,8,9,10], [11,3], [1..5]]
//Start = pairs [[1,2,3], [5,6], [7,8,9,10], [11,3]]


// 5. Given a list of tuples form a list of triple tuples with the original 
// numbers and their sum
triplesum x = [(a,b,a+b) \\ a <- fst y & b <- snd y]
where 
	y = unzip x

//Start = triplesum [(1,2),(2,3),(3,4),(4,5),(5,6)]


// 6. Generate quadruples of a number, its square, its cube, and its biquadratic
// where the number are in the 1..20 interval
quadruple = [(x,x^2,x^3,x^4) \\ x <- [1..20]]

//Start = quadruple

// 7. Form triple tuples of 3 lists selecting one element from each list.
// E.g. for ([1..10],[20..25],[35..47]) the result is 
// [(1,20,35),(2,21,36),(3,22,37),(4,23,38),(5,24,39),(6,25,40)]
tri x = [(x,y,z) \\ x <- fst3 x & y <- snd3 x & z <- thd3 x]

Start = tri ([1..10],[20..25],[35..47]