module HW3
import StdEnv

/*
Implement an encoding problem by the following steps:

extract the digits of a number in a list,

subtract 1 from every element of the list (if the digit is 0 then it should remain 0),

build the new encoded number using the elements of the modified list.

Ex. the number 80457 in a list is [8,0,4,5,7], after subtraction the new list is
 [7,0,3,4,6] then the encoded number is 70346.
*/

extr :: Int [Int] -> [Int]
extr 0 l = l
extr x l = extr (x/10) [x rem 10: l]
//Start = extr 80457

l :: Int -> [Int]
l x = extr x []

//Start = l 80457

subtr :: [Int] -> [Int]
subtr [] = []
subtr [0] = [0]
subtr [x:xs]
| x > 0 = [x - 1: subtr xs]
= [0:subtr xs]


//Start = subtr [8,0,4,5,7]
encode :: [Int] -> Int
encode [] = 0
encode [x:xs]
| length [x:xs] == 1 = x
= x*z + encode xs
where
	z = 10^length xs
//Start = encode [7,0,3,4,6]

hw3 :: Int -> Int
hw3 m =encode (subtr (l m))

Start = hw3 80457