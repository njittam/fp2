module NotatieFuncties

import StdEnv

f1			:: Int
f1			= 1 + 5

f2			:: Int
f2			= (+) 1 5

f3			:: Int Int -> Int
f3 m n
| m < n		= m
| otherwise	= n

f4			:: String Int -> String
f4 s n
| n <= 0	= ""
| otherwise	= s +++ f4 s (n-1)

f5			:: Int Int -> Int
f5 x 0		= x
f5 x y		= f5 y (x rem y)

f6			:: (Int,Int) -> Int
f6 x		= fst x + snd x

f7			:: (a,b) -> (b,a)
f7 (a,b)	= (b,a)

f8			:: (a,a) -> (a,a)
f8 x		= f7 (f7 x)

Start		= f1
