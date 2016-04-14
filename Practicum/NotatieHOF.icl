module NotatieHOF

import StdEnv

f1 :: // geef meest algemene type
f1 a b = a b

f2 :: // geef meest algemene type
f2 a b c = a c (b c)

f3 :: // geef meest algemene type
f3 a b = a (a b)

f4 :: // geef meest algemene type
f4 a b c = [x \\ x <- [b .. c] | a x]

f5 :: // geef meest algemene type
f5 a b (c,d) = (a c,b d)

f6 :: // geef meest algemene type
f6 = f5

f7 :: // geef meest algemene type
f7 "-" = -
f7 "+" = +
f7 "*" = *
f7 "/" = /

Start = 0
