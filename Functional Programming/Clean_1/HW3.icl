module HW3
import StdEnv

//Sum
listsum :: [Real] -> Real
listsum x
| x == [] = toReal 0
|otherwise = hd x + listsum (tl x)

//Compare
compare :: [Real] -> [Real]
compare x
|length x > 1 && hd x <= hd (tl x) = compare (tl x)
|length x > 1 && hd x > hd (tl x) = compare [hd x:tl(tl x)]
= x

//Average List
average :: [Real] -> [Real]
average x = [listsum x/toReal (length x)]

//Task 1 max temp of the week
maxtemp :: [[Real]] -> [Real]
maxtemp [] = []
maxtemp x = compare (hd x) ++ maxtemp (tl x)
//Start = maxtemp [[1.1,12.0,13.0,16.2,12.5,3.0,11.3],[1.5,1.0,11.0,17.8,11.5,3.9,1.3],[5.8,10.0,11.0,1.2,11.5,3.9,1.3]]

//Task 2 avg temp of period
avgtemp :: [[Real]] -> [Real]
avgtemp [] = []
avgtemp x = average (hd x) ++ avgtemp (tl x)
//Start = avgtemp [[1.1,12.0,13.0,16.2,12.5,3.0,11.3],[1.5,1.0,11.0,17.8,11.5,3.9,1.3],[5.8,10.0,11.0,1.2,11.5,3.9,1.3]]

//Task 3 avg of task 1
maxtempavg :: [[Real]] -> [Real]
maxtempavg [] = []
maxtempavg x = average (maxtemp x)

//Start = maxtempavg [[1.1,12.0,13.0,16.2,12.5,3.0,11.3],[1.5,1.0,11.0,17.8,11.5,3.9,1.3],[5.8,10.0,11.0,1.2,11.5,3.9,1.3]]
//Task 1 Answer [16.2,17.8,11.5]
//Task 2 Answer [9.87,6.85,6.38]
//Task 3 Answer 15.16