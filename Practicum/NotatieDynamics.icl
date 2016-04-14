module NotatieDynamics

import StdEnv
import StdDynamic

Start = f4 f3

f1 :: // meest algemene type
f1 (x :: Int) y = x + y

f2 :: // meest algemene type
f2 (b :: Bool) (e1 :: a) (e2 :: a) = dynamic if b e1 e2 :: a

f3 :: // meest algemene type
f3 = dynamic map fib [1 ..]

fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

f4 :: // meest algemene type
f4 (xs :: [Int]) = take 10 xs

f5 :: // meest algemene type
f5 = f4 f3
