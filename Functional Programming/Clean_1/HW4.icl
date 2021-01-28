module HW4
import StdEnv

/*A Turing-like encoding machine is encrypts numbers by
attaching 1 at the beginning and at the end of the number,
and by inserting 0 between the digits.. Write an encrypting
for a list of integers. 
E.g. [101, 25, 388, 77, 0, 1234] -> [1100011, 12051, 1308081, 17071, 101, 110203041].
To check that the machine is working properly, write also the decrypting of the elements of a list.
Thus the property: list == decoding (coding list) shoudl hold at the end.*/

power x n
|n == 0 = 1
|n > 0 = x * power x (n - 1)

//Start = power 5 2

insert0 :: Int Int -> Int
insert0 x 0 = 0
insert0 x i = ((x/(power 10 (i-1))) rem 10)*(power 100 i)/10 + (insert0 x (i-1))

//Start = insert0 29 2

numlength :: Int -> Int
//numlength [] = 0
numlength x
|x/10 > 0 = 1 + numlength (x/10)
= 1

//Start = numlength 25

add1 :: Int -> Int
add1 x = 1 + (insert0 x i) + power 100 i
where i = numlength x

//Start = add1 59

encode :: [Int] -> [Int]
encode [] = []
encode x = map add1 x

//Start = encode [101, 25, 388, 77, 0, 1234]
//Answer [1100011, 12051, 1308081, 17071, 101, 110203041]

//Decode

recode::Int Int -> Int
recode x 0 = 0
recode x l = ((10*x/(power 100 (l))) rem 10)*(power 10 (l-1)) + recode x (l-1)

//Start = recode 101 2

remove :: Int -> Int
remove x = recode x n
where n = ((numlength x)-1)/2

//Start = remove 1919213913

decode :: [Int] -> [Int]
decode [] = []
decode x = map remove x

//Start = decode [1100011, 12051, 1308081, 17071, 101, 110203041]
//Answer [101, 25, 388, 77, 0, 1234]
