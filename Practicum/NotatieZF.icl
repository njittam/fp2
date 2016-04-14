module NotatieZF

import StdEnv

g1 :: // meest algemene type
g1 as bs = [(a,b) \\ a <- as, b <- bs]

g2 :: // meest algemene type
g2 as bs = [(a,b) \\ a <- as & b <- bs]

g3 :: // meest algemene type
g3 as bs = [(a,b) \\ a <- as, b <- bs | a <> b]

g4 :: // meest algemene type
g4 as bs = [a \\ a <- as, b <- bs | a == b]

g5 :: // meest algemene type
g5 xss = [x \\ xs <- xss, x <- xs]

g6 :: // meest algemene type
g6 a xs = [i \\ i <- [0 ..] & x <- xs | a == x]
