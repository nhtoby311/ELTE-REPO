module ex101
import StdEnv

// Define the type Tree Int and the type Q.

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf
          

atree = (Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 9 Leaf Leaf)) (Node 2 Leaf Leaf) )   
      
// 1. Write a function that returns the maximum value of the values stored 
// in a binary tree. Assume all values are positive; return -1 if the tree is empty.
maxi :: Int Int -> Int
maxi a b
| a>b = a
= b 

f1 :: (Tree Int) -> Int
f1 Leaf = -1
f1 (Node x le ri) = maxi x (maxi (f1 le) (f1 ri))

//Start = f1 atree

// 2. Find the left tree(s) of a node.
f2 :: Int (Tree Int) -> [Tree Int]
f2 a Leaf = []
f2 a (Node x le ri) 
| x == a = [le] ++ f2 a le ++ f2 a ri 
= f2 a le ++ f2 a ri 
//Start = f2 2 atree

// 3. Find the right tree of a node.
f3 :: Int (Tree Int) -> [Tree Int]
f3 a Leaf = []
f3 a (Node x le ri) 
| x == a = [ri] ++ f3 a le ++ f3 a ri 
= f3 a le ++ f3 a ri 
//Start = f3 2 atree

// 4. Given two numbers check if they are brothers, i.e. the children of a same parent.

nr (Node x a b) = x

f4 :: Int Int (Tree Int) -> Bool
f4 x y Leaf = False
f4 x y (Node a le Leaf) = False
f4 x y (Node a Leaf ri) = False
f4 x y (Node a le ri)
|(x==nr le) && (y ==nr ri) = True
= f4 x y le || f4 x y ri

//Start = f4 1 3 atree  

// 5. Find the parent of a node, and give back the tree with the parent as a root node.
//f5 :: Int (Tree Int) -> (Tree Int)

:: Q = { nom :: Int
       , den :: Int
       } 

Q1 :: Q       
Q1 = { nom = 1, den = 2 }    
Q2 :: Q
Q2 = { nom = 1, den = 3 }

simplify :: Q -> Q
simplify {nom=n,den=d}
  | d == 0 = abort " denominator is 0"
  | d < 0  = { nom = ~n/g, den = ~d/g}
  | otherwise =  { nom = n/g, den = d/g}
  where g = gcdm n d

gcdm :: Int Int -> Int
gcdm x y = gcdnat (abs x) (abs y)
  where gcdnat x 0 = x
        gcdnat x y = gcdnat y (x rem y)

mkQ :: Int Int -> Q
mkQ n d = simplify { nom = n, den = d } 

//Start = mkQ 81 90



// 6. Given the type for rational numbers, write a function to test the equality of rational numbers.
f6 :: Q Q -> Bool
f6 {nom=n1,den=d1} {nom=n2,den=d2} = n1*d2 == n2*d1 

//Start = f6 Q1 Q2


// 7. Check about a rational number if it is irreducible.
f7 :: Q -> Bool
f7 {nom=n,den=d}
| gcdm n d == 1 = True
=False

//Start = f7 Q1


// 8. Define maxQ for finding the maximum of two rational numbers.
f8 :: Q Q -> Q
f8 {nom=n1,den=d1} {nom=n2,den=d2} 
| n2*d1 < n1*d2  = {nom=n1,den=d1}
= {nom=n2,den=d2} 

//Start = f8 Q1 Q2


// 9. Add two rational numbers.
f9 :: Q Q -> Q
f9 {nom=n1,den=d1} {nom=n2,den=d2} = simplify {nom=n1*d2+n2*d1,den=d1*d2}
 
//Start = f9 Q1 Q2


// 10. Find the inverse of a rational number.
f10 :: Q -> Q
f10 {nom=n,den=d} = {nom=d,den=n}

Start = f10 Q1



