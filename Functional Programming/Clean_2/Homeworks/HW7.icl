module HW7
import StdEnv

// Define the function MakeFrequenceTable that makes a frequency table for
// the elements of a list.

// The table consists of a list of lists. Each sub-list consists of an element
// from the original list, number of occurrences and its frequency (percentage).

// MakeFrequenceTable :: [Int] -> [[Int]]

// Examples:

// MakeFrequenceTable [] = [[]]

// MakeFrequenceTable [1] = [[1,1,100]]

// MakeFrequenceTable [1,2] = [[1,1,50],[2,1,50]]

// MakeFrequenceTable [1..10] = [[1,1,10],[2,1,10],[3,1,10],[4,1,10],[5,1,10],
//[6,1,10],[7,1,10],[8,1,10],[9,1,10],[10,1,10]]

// MakeFrequenceTable [1,3,2,3,2] = [[1,1,20],[3,2,40],[2,2,40]]

MakeFrequenceTable :: [Int] -> [[Int]]
MakeFrequenceTable [] = [[]]
MakeFrequenceTable list = func1 (length list) list

func1 n [] = []
func1 n [x:xs] = [[x,length same + 1,freq] : func1 n diff]
where
	same = [a \\ a <- xs | a == x]
	diff = [a \\ a <- xs | not (a == x)]
	freq = 100 * (length same + 1) / n
	
Start = MakeFrequenceTable [1,3,2,3,2] //[[1,1,20],[3,2,40],[2,2,40]]
//Start = MakeFrequenceTable [1,2] //[[1,1,50],[2,1,50]]
//Start = MakeFrequenceTable []
