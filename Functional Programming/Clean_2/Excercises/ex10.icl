module ex10
import StdEnv


:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

sizeT :: (Tree a) -> Int
sizeT Leaf = 0
sizeT (Node x l r) = 1 + sizeT l + sizeT r

//Start = sizeT (Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) Leaf)// 4

atree = Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)

depth :: (Tree a) -> Int
depth Leaf = 0 
depth (Node _ l r) = (max (depth l) (depth r)) + 1

// Start = depth atree // 2

treesort :: ([a]-> [a]) | Eq, Ord a
treesort = collect o listtoTree

listtoTree :: [a] -> Tree a | Ord, Eq a
listtoTree [] = Leaf
listtoTree [x:xs] = insertTree x (listtoTree xs)

Start = listtoTree [1,2,3,4]

insertTree :: a (Tree a) -> Tree a | Ord a
insertTree e Leaf = Node e Leaf Leaf
insertTree e (Node x le ri)
   | e<=x = Node x (insertTree e le) ri
   | e>x  = Node x le (insertTree e ri)

collect :: (Tree a) -> [a]
collect Leaf = []
collect (Node x le ri) = collect le ++ [x] ++ collect ri

// Start = treesort [3, 1, 5, 9, 2, 7, 0]

:: Point = {  x       ::  Real
            , y       ::  Real
            , visible ::  Bool
            }

:: Vector = { dx       ::  Real
            , dy       ::  Real
            }
  
Origo :: Point
Origo = { x = 0.0
        , y = 0.0
        , visible = True
        }
Dist :: Vector
Dist = { dx = 1.0
       , dy = 2.0
       }

IsVisible :: Point -> Bool
IsVisible {visible = True} = True
IsVisible _                = False

xcoordinate :: Point -> Real
xcoordinate p = p.x

hide :: Point -> Point
hide p = { p & visible = False }

Move :: Point Vector -> Point
Move p v = { p & x = p.x + v.dx, y = p.y + v.dy } 

// Start = Move (hide Origo) Dist

:: Q = { nom :: Int
       , den :: Int
       } 
       
QZero :: Q       
QZero = { nom = 0, den = 1 }    
QOne :: Q
QOne = { nom = 1, den = 1 }

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

// Exercises

// 1. Compute the sum of the numbers placed in the nodes of a tree.
tree1 = Node 2(Node 3 Leaf Leaf)(Node 5 Leaf Leaf)

//Start = collect tree1

sumT :: (Tree Int) -> Int
sumT tree1 = foldr (+)0 y
where
	y = collect tree1

//Start = sumT tree1

// 2. Test about 3 points if they can form a right-angled triangle.
/*
:: Point = { x	:: Int
			,y	:: Int
			,z	:: Int
			}
			
RTri :: Point
RTri = { x = 0
		,y = 1
		,z = 1
		}
*/
//IsTriangle :: Point Point Point -> Bool


// 3. Write a function to test the equality of rational numbers.
//IsEqual :: Q Q -> Bool


