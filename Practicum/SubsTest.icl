module SubsTest

/*	Test module Subs
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import StdEnv
import gast
import Subs

Start
							= testn 1000
							    (\xs -> alle_lengtes_komen_voor xs /\
							            alle_elementen_zijn_sub xs /\
							            subs_xs_bevat_xs        xs /\
							            True
							    )

alle_lengtes_komen_voor		:: [Int] -> Property
alle_lengtes_komen_voor xs	= name "alle_lengtes_komen_voor"
							       (let n = length xs
							         in sort (removeDup (map length (subs xs))) == [0..n]
							       )

alle_elementen_zijn_sub		:: [Int] -> Property
alle_elementen_zijn_sub xs	= name "alle_elementen_zijn_sub" (and [is_sub f xs \\ f <- subs xs])

subs_xs_bevat_xs			:: [Int] -> Property
subs_xs_bevat_xs xs			= name "subs_xs_bevat_xs" (isMember xs (subs xs))

/*	is_sub sub lijst is True alleen als alle elementen van sub achtereenvolgens voorkomen in lijst.
*/
is_sub						:: [a] [a] -> Bool | Eq a
is_sub [] _					= True
is_sub _ []					= False
is_sub [x:xs] [y:ys]
| x == y					= is_sub xs ys
| otherwise					= is_sub [x:xs] ys
