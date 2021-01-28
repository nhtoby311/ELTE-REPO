module perm

import StdEnv

Start = perm [1,2,3,4]

perm [] = [[]]
perm [h:t] = [insertAt y h x \\ x <-perm t , y <- [0..length x]]
