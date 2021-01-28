module sieve
import StdEnv

sieve :: [Int] -> [Int]
sieve [p:xs] = [p: sieve [ i \\ i <- xs | i rem p <> 0]]

Start = take 100 (sieve [2..]) 
