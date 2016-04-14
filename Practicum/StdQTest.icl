module StdQTest

/*	Test module StdQTest
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import StdQ
import StdEnv
import gast

Start
		= testn 1000
			(\ a b c -> 
			   let qa = fromInt a
		       in  zero_is_neutral_for_addition      qa /\
			       zero_is_neutral_for_subtraction   qa /\
			       one_is_neutral_for_multiplication qa /\
			       one_is_neutral_for_division       qa /\
			       negation_is_idempotent            qa /\
			       add_then_subtract_yields_identity qa /\
			       subtract_then_add_yields_identity qa /\
			       abs_is_positive                   qa /\
			       isInt_holds_for_Ints              qa /\
			       toQ_yields_rational            a b c /\
			       True
			)

zero_is_neutral_for_addition		:: Q -> Property
zero_is_neutral_for_addition a		= name "zero_is_neutral_for_addition"
									       (zero + a == a && a == a + zero)

zero_is_neutral_for_subtraction		:: Q -> Property
zero_is_neutral_for_subtraction a	= name "zero_is_neutral_for_subtraction"
									       (a - zero == a && a == ~ (zero - a))

one_is_neutral_for_multiplication	:: Q -> Property
one_is_neutral_for_multiplication a	= name "one_is_neutral_for_multiplication" 
									       (one * a == a && a == a * one)

zero_is_zero_for_multiplication		:: Q -> Property
zero_is_zero_for_multiplication a	= name "zero_is_zero_for_multiplication"
									       (zero * a == zero && zero == a * zero)

one_is_neutral_for_division			:: Q -> Property
one_is_neutral_for_division a		= name "one_is_neutral_for_division"
									       (a / one == a)

negation_is_idempotent				:: Q -> Property
negation_is_idempotent a			= name "negation_is_idempotent" 
									       (~ (~ a) == a)

add_then_subtract_yields_identity	:: Q -> Property
add_then_subtract_yields_identity a	= name "add then subtract" ((a + a) - a == a)

subtract_then_add_yields_identity	:: Q -> Property
subtract_then_add_yields_identity a	= name "subtract then add" ((zero - a - a) + a + a == zero)

abs_is_positive                     :: Q -> Property
abs_is_positive a                   = name "abs is positive" (abs a >= zero)

isInt_holds_for_Ints				:: Q -> Property
isInt_holds_for_Ints a				= name "isInt holds for Ints" (isInt a && (a == zero || not (isInt (a / (a+a)))))

toQ_yields_rational					:: Int Int Int -> Property
toQ_yields_rational a b c			= name "toQ yields rational" 
									       ( (abs a > 2^30 || abs b > 2^30 || a*b == zero || toQ (a,b) * toQ b == toQ a)
									         &&
									         (abs a > 2^30 || abs b > 2^30 || abs c > 2^30 || a*b*c == zero || (toQ (c,a,b) - toQ c) * toQ b == toQ a)
									       )

instance fromInt Q where fromInt i	= toQ i
