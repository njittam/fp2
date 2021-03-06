implementation module RandomGetallen

import StdEnv, Random

Start :: *World -> ([Int], *World)
// Start :: *World -> (([Int], RandomSeed), *World)
Start world
# (rs, world)	= getNewRandomSeed world
= (shuffle [1..10] rs, world)
// = (random_n 3 rs, world)

random_n :: Int RandomSeed -> ([Int], RandomSeed)
random_n n seed
| n <= 0 = ([], seed)
| otherwise
# (rand_int, next_seed) = random seed
# (rand_list, rand_seed) = random_n (n-1) next_seed
= (rand_list ++ [rand_int], next_seed)


/*
random_inf :: RandomSeed -> [Int]
random_inf ...
*/

iterateSt :: (s -> (a,s)) s -> [a]
iterateSt ...

iterate::(a -> a) a -> .[a]
iterate f x	= [x:iterate f (f x)]

shuffle :: [a] RandomSeed -> [a]
shuffle [] seed = []
shuffle [x:xs] seed
# (rand_int, next_seed) = random seed
# pos = rand_int rem length[x:xs]
= insertAt pos x (shuffle xs next_seed)
