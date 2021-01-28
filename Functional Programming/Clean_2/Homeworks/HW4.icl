module HW4
import StdEnv

/*
Write a function that given the current day and your date of birth
determines how many days you have to wait for your birthday
(a date is given in form of a list like [year,month,day])
*/

leap :: Int -> Bool
leap y = y rem 4 == 0 && (not(y rem 100 ==0) || y rem 400 == 0)

//Start = leap 1995 //False
//Start = leap 1996 //True

months :: Int -> [Int]
months y = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
where
	feb | leap y = 29
		| otherwise = 28
		
//Start = months 1996 //28

date1 :: Int Int Int Int [Int] -> Int
date1 d1 m1 d2 m2 l
| m1 == m2 = (hd (drop (m1 - 1) l)) + d1 - d2
= (hd (drop (m2 - 1) l)) + (date1 d1 m1 d2 (m2 + 1) l)

//Start = date1 10 19 2 9

date2 :: Int Int Int Int [Int] -> Int
date2 d1 m1 d2 m2 l
| 13 == m2 = date1 d1 m1 d2 1 l
= (hd (drop(m2 - 1) l)) + (date1 d1 m1 d2 (m2 + 1) l)


//Start = date2 10 2 4 12

f1 :: Int Int Int Int Int Int -> Int
f1 y2 m2 d2 y1 m1 d1
| m1 == m2 && d1 >= d2 = d1 - d2
| m1 == m2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) && m1 > 2 = 366 - (d2 - d1)
| m1 == m2 = 365 - (d2 - d1)

| m1 == 1 && m1 < m2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) && m1 > 2 = date1 d1 (12) d2 (m2) (months (y2 + 1))
| m1 < m2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) && m1 > 2 = date2 d2 (m1 - 1) d2 (m2) (months (y2 + 1))

| m1 > m2 = date1 d1 (m1 - 1) d2 m2 (months y2)

| m1 == 1 && m1 == m2 && d1 < d2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) = date1 d1 (12) d2 (m2) (months (y2 - 1))
| m1 == m2 && d1 < d2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) = date2 d1 (m1 - 1) d2 (m2) (months (y2 - 1))

| m1 == 1 && m1 < m2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) && m1 > 2 = date1 d1 (12) d2 (m2) (months (y2 - 1))
| m1 < m2 && y2 rem 4 == 0 && (not(y2 rem 100 ==0) || y2 rem 400 == 0) && m1 > 2 = date1 d1 (m1 - 1) d2 (m2) (months (y2 - 1))

| m1 == 1 = date1 d1 (12) d2 (m2) (months y2)
= date1 d1 (m1 - 1) d2 (m2) (months y2)


//Start = f1 2018 10 2 1995 10 14

f2 :: [Int] [Int] -> Int
f2 x y = f1 (hd x) (hd (tl x)) (last x) (hd y) (hd (tl y)) (last y)

//Start = f2 [2018,3,12] [1995,10,14] //216
Start = f2 [2016,3,12] [1995,10,14]