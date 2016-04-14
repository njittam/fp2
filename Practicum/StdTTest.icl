module StdTTest

/*	Test module StdTTest
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import StdT
import StdEnv
import gast

Start
			= testn 1000
				(\ i -> 
				    gelijkheid_is_symmetrisch       i /\
				    ordening_is_monotoon            i /\
				    negatieve_tijd_bestaat_niet     i /\
				    omzetten_naar_Int_is_consistent i /\ 
				    parse_print_is_consistent       i /\
				    True
				)

t :: Int -> T
t x = fromInt x

gelijkheid_is_symmetrisch			:: Int -> Property
gelijkheid_is_symmetrisch i			= name "gelijkheid_is_symmetrisch"
									       (t i == t i)

ordening_is_monotoon				:: Int -> Property
ordening_is_monotoon i				= name "ordening_is_monotoon"
									       ((i <= i+1) ==> t i <= t (i+1))

negatieve_tijd_bestaat_niet			:: Int -> Property
negatieve_tijd_bestaat_niet i		= name "negatieve_tijd_bestaat_niet"
									       ((i + 1 >= i) ==> t i - t (i+1) == zero)

omzetten_naar_Int_is_consistent		:: Int -> Property
omzetten_naar_Int_is_consistent i	= name "omzetten_naar_Int_is_consistent"
									       ((abs i >= 0) ==> toInt (t (abs i)) == abs i)

parse_print_is_consistent			:: Int -> Property
parse_print_is_consistent i			= name "parse_print_is_consistent"
									       (fromString (toString (t i)) == t i)
