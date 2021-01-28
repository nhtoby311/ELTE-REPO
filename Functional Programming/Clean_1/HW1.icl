module HW1
import StdEnv

mult :: Int -> Int
mult x
|x<0 = 0
|x<5 = x * 200
|x<10 = x * 150 
|x>11 = x * 100

Start = mult -5
//Start = mult 3
//Start = mult 8
//Start = mult 99