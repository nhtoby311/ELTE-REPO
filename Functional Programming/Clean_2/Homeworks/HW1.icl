module HW1
import StdEnv

/*
Write a function that computes the sum: 1 * 1 + 2 * 2 + 3 * 3 + ... + n * n
*/

hw :: Int -> Int

hw n
| n == 0 = 0
| n > 0 = n * n + hw (n-1)

//Start = hw 2 // 4 + 1 = 5
//Start = hw 3 // 9 + 4 + 1
//Start = hw 4 // 1 + 4 + 9 + 16 = 30
//Start = hw 5 // 25 + 16 + 9 + 4 + 1 = 55
//Start = hw 0 // 0