module EersteOfLaatsteTest

/*	Test module EersteOfLaatste
	Voor werken met Gast:
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import EersteOfLaatste
import StdEnv
import gast

Start
		= testn 1000
			(\n v ->
			   eerste2_is_eerste_2     v /\
			   laatste2_is_laatste_2   v /\
			   eersten_is_eerste_n   n v /\
			   laatsten_is_laatste_n n v /\
			   True
			)

:: BaseType :== Int

eerste2_is_eerste_2				:: [BaseType] -> Property
eerste2_is_eerste_2 l			= name "eerste2 is eerste twee"
									((length l > 1) ==> let l` = eerste2 l in zelfde_deel 2 l` l)

laatste2_is_laatste_2			:: [BaseType] -> Property
laatste2_is_laatste_2 l			= name "laatste2 is laatste twee"
									((length l > 1) ==> let l` = laatste2 l in zelfde_deel 2 l` (drop (length l - 2) l))

eersten_is_eerste_n				:: Int [BaseType] -> Property
eersten_is_eerste_n n l			= name "eersten is eerste n"
									((n >= 0 && n < length l) ==> let l` = eersten n l in zelfde_deel n l` l)

laatsten_is_laatste_n			:: Int [BaseType] -> Property
laatsten_is_laatste_n n l		= name "laatsten is laatste n"
									((n >= 0 && n < length l) ==> let l` = laatsten n l in zelfde_deel n l` (drop (length l - n) l))

zelfde_deel						:: Int [BaseType] [BaseType] -> Bool
zelfde_deel 0 _ _				= True
zelfde_deel n [a:as] [b:bs]		= a == b && zelfde_deel (n-1) as bs
zelfde_deel _ _ _				= False
