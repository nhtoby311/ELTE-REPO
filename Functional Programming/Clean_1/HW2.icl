module HW2
import StdEnv

count y [] = 0
count y [h:t]
|y == h = 1 + count y t
|otherwise = count y t

//length l [x:xs]
l = length [1,2,3,3,1]

del y [] = []
del y [h:t]
|y == h = del y t
|otherwise = [h:del y t]

MakeFrequencyTable :: [Int] -> [[Int]]

//[number,occurance,percentage]

MakeFrequencyTable [] = []
MakeFrequencyTable [x:xs]
= [[x, (occurance),(occurance*100/l)]:MakeFrequencyTable (del x xs)]

where occurance = count x [x:xs]

Start = MakeFrequencyTable [1,2,3,3,1] //[[1,2,40],[2,1,20],[3,2,40]]