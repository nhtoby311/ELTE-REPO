module HW11
import StdEnv

// 1. Find the cube of a fraction represented as an element of type Q.
:: Q = {num :: Int
		,den :: Int
		}

simplify :: Q -> Q
simplify {num = n, den = d}
	| d == 0 = abort "den cant be 0"
	| d < 0 = {num = ~n / g, den = ~d / g}
	| otherwise = {num = n / g, den = d / g}
where
	g = gcd n d

//Start = simplify {num = 2, den = 10}

mkQ :: x x -> Q | toInt x
mkQ n d = simplify {num = toInt n, den = toInt d}

//Start = mkQ 81 90

instance * Q
where
	(*) q1 q2 = mkQ (q1.num*q2.num) (q1.den*q2.den)

f1 :: Q -> Q
f1 q1 = q1*q1*q1

//Start = f1 {num = 3, den = 5}

// 2. Define minQ for finding the minimum of two rational numbers.

instance < Q
where
	(<) x y = x.num * y.den < x.den * y.num

f2 :: Q Q -> Q
f2 q1 q2
| q1 < q2 = q1
= q2

//Start = f2 {num = 2,den = 1} {num = 1,den = 5}


// 3. Given a list of rational numbers, sort them in decreased order.
f3 :: [Q] -> [Q]
f3 [] = []
f3 [c : xs] = f3 [x \\ x <- xs | x >  c] ++ [c] ++
                 f3 [x \\ x <- xs | x <= c]

//Start = f3 [{num = 1, den = 3},{num = 6, den = 9},{num = 3, den = 3},{num = 2, den = 1}]