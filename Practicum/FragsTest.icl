module FragsTest

/*	Test module Frags
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import StdEnv
import gast
import Frags

Start						= testn 1000
								( \xs -> alle_lengtes_komen_voor  xs /\
								         alle_elementen_zijn_frag xs /\
								         True
								)

alle_lengtes_komen_voor		:: [Int] -> Property
alle_lengtes_komen_voor xs	= name "alle_lengtes_komen_voor"
							       (let n = length xs
							         in sort (removeDup (map length (frags xs))) == [0..n]
							       )

alle_elementen_zijn_frag	:: [Int] -> Property
alle_elementen_zijn_frag xs	= name "alle_elementen_zijn_frag"
							       (and [is_frag f xs \\ f <- frags xs])

/*	is_frag fragment lijst is True alleen als fragment een strikte deellijst is
	van lijst, dwz: de elementen van fragment komen direct achter elkaar in lijst voor.
*/
is_frag						:: [a] [a] -> Bool | Eq a
is_frag [] _				= True
is_frag _  []				= False
is_frag [f:fs] [x:xs]
| f == x
	| is_frag fs xs			= True
	| otherwise				= is_frag [f:fs] xs
| otherwise					= is_frag [f:fs] xs
