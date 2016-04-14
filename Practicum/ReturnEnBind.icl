module ReturnEnBind

import StdEnv, Random

Start = 42

(bind1) infix 0 :: (St s a) (a -> (St s b)) -> St s b
(bind1) f1 f2 = ...

som2 :: (RandomSeed -> (Int,RandomSeed))
som2 ...

seqList1 :: [St s a] -> St s [a]
seqList1 ...
