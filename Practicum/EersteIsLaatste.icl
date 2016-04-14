module EersteIsLaatste

import StdEnv

last1			:: [a] -> a
last1 [x]		= x
last1 [_:xs]	= last1 xs

last2			:: ([a] -> a)
last2			= hd o reverse

//	1.
//  Herschrijf de volgende Start-regels handmatig:
Start = last1 [1,2,3,4]

Start = last2 [1,2,3,4]

//	2.
//  Verklaar het verschil tussen last1 en last2
