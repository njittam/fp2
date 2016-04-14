implementation module RandomGetallen

import StdEnv, Random

Start :: *World -> ([Int],*World)
Start world
# (rs,world)	= getNewRandomSeed world
= (shuffle [1..10] rs,world)

random_n :: Int RandomSeed -> ([Int],RandomSeed)
random_n ...

random_inf :: RandomSeed -> [Int]
random_inf ...

iterateSt :: (s -> (a,s)) s -> [a]
iterateSt ...

shuffle :: [a] RandomSeed -> [a]
shuffle ...
