module HW10
import StdEnv

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf
          
collect :: (Tree a) -> [a]
collect Leaf = []
collect (Node x le ri) = collect le ++ [x] ++ collect ri

// For ex 1,2,3 use the Tree Int type defined in the class.

tree1 = (Node 2(Node 3(Node 3 Leaf Leaf)(Node 4 Leaf Leaf)) Leaf)

//Start = collect tree1

g1 :: [Int] Int -> Bool
g1 [] a = False
g1 [x:xs] a = a == x || g1 xs a

//Start = g1 1 [1]
//Start = g1 [1,2,3,4,5,2,5] 2

//Start = g1 (collect tree1) 2

// 1. Check if a number is a node of a tree.
isNode :: (Tree Int) Int -> Bool
isNode tree1 a = g1 (collect tree1) a

//Start = isNode tree1 1

// 2. Count how many times is a node in a tree.
CountOccurrences :: [a] a -> Int | == a
CountOccurrences [ x : xs] a = f a [ x : xs] 0
where
	f a [] i = i
	f a [ x : xs] i
		| a == x = f a xs i+1
			= f a xs i

//Start = CountOccurrences [1,2,3] 2

nrNode :: (Tree Int) Int -> Int
nrNode tree1 x = CountOccurrences (collect tree1) x

//Start = nrNode tree1 3

// 3. If a number is in a tree, then give the list of its children in the form of (left child, right child).
// if the children are leaves then (0,0) are its children.

aTree = Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 2 Leaf Leaf)

getNode :: (Tree Int) -> (Int, Int)
getNode (Node a Leaf Leaf) = (0,0)
getNode (Node a Leaf (Node c _ _)) = (0,c)
getNode (Node a (Node b _ _) Leaf) = (b,0)
getNode (Node a (Node b _ _) (Node c _ _)) = (b,c)


child :: (Tree Int) Int -> [(Int, Int)]
child Leaf a = []
child (Node n l r) a
| n == a = [ getNode (Node n l r) ] ++ (child l a) ++ (child r a)
= (child l a) ++ (child r a)

Start = child aTree 2 //[(1,3),(0,0)]