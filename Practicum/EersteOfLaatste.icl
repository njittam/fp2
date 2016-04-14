implementation module EersteOfLaatste

import StdEnv

//	1.
eerste2 :: [a] -> [a]
eerste2 ...

laatste2 :: [a] -> [a]
laatste2 ...


//	2.
//  Reduceer de volgende Start-regels met de hand:
Start = hd (hd (hd [[[1,2,3],[4]],[[5],[6]]]))
Start = hd (tl [1,2,3,4,5])
Start = eerste2 [[1],[],[2,3],[4,5,6]]
Start = laatste2 [[1],[],[2,3],[4,5,6]]


//	3.
eersten  :: Int [a] -> [a]
eersten ...

laatsten :: Int [a] -> [a]
laatsten ...

//	4.
//  Maak de volgende beweringen af:
/*
Voor alle 0 <= n, xs :: [a] : eersten n (eersten  n xs) = 
Voor alle 0 <= n, xs :: [a] : eersten n (laatsten n xs) = 
Voor alle 0 <= n, xs :: [a] : laatsten n (eersten n xs) = 
Voor alle 0 <= n, xs :: [a] : laatsten n (laatsten n xs) = 
Voor alle 0 <= m <= n, xs :: [a] : eersten m (eersten n xs) = 
Voor alle 0 <= m <= n, xs :: [a] : length (eersten m xs) ? length (eersten n xs)
*/
