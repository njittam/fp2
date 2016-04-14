definition module Domino

::	Steen	:== (Int,Int)		// (1..N,1..N)
::	Slang	:== [Steen]

N			:== 2

/*	alle_slangen max
	levert alle slangen van lengte max op van een dubbel-N spel.
*/
alle_slangen :: Int -> [Slang]
