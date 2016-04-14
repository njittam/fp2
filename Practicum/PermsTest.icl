module PermsTest

/*	Test module Perms
	Voor werken met Gast:
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import StdEnv
import gast
import Perms

Start							= testn 1000
									(\xs -> alle_lengtes_zijn_n         xs /\
									        alle_elementen_zijn_present xs /\
									        True
									)

alle_lengtes_zijn_n				:: [Int] -> Property
alle_lengtes_zijn_n xs			= let n = length xs
								   in name ("alle lengtes zijn " +++ toString n)
								           (all (\p -> length p == n) (perms xs))

alle_elementen_zijn_present		:: [Int] -> Property
alle_elementen_zijn_present xs	= let ps = perms xs
								   in name "alle_elementen_zijn_present"
								           (and [isMember x p \\ x <- xs, p <- ps])
