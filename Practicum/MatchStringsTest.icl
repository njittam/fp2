module MatchStringsTest

/*	Test module MatchStrings
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/

import StdEnv
import MatchStrings
import gast

Start
					= testn 1000
						(\s t -> 
							eigenschap_waar_voor_gelijke_argumenten is_gelijk     s   /\
							eigenschap_onwaar_voor_groter_argument  is_gelijk     s   /\
							eigenschap_onwaar_voor_groter_argument  is_deelstring s   /\
							eigenschap_waar_voor_gelijke_argumenten is_deelstring s   /\
							eigenschap_waar_voor_gelijk_begin       is_deelstring s t /\
							eigenschap_waar_voor_gelijk_midden      is_deelstring s t /\
							eigenschap_waar_voor_gelijk_eind        is_deelstring s t /\
							eigenschap_onwaar_voor_groter_argument  is_deel       s   /\
							eigenschap_waar_voor_gelijke_argumenten is_deel       s   /\
							eigenschap_waar_voor_gelijk_begin       is_deel       s t /\
							eigenschap_waar_voor_gelijk_midden      is_deel       s t /\
							eigenschap_waar_voor_gelijk_eind        is_deel       s t /\
							eigenschap_waar_voor_uitbreiding        is_deel       s t /\
							kleenes_matcht_altijd                                 s   /\
							dots_matcht_zelfde_lengte                             s   /\
                            dots_mag_niet_meer_matchen                            s   /\
							True
						)

eigenschap_onwaar_voor_groter_argument :: (String String -> Bool) String -> Property
eigenschap_onwaar_voor_groter_argument f a
					= name "eigenschap_onwaar_voor_groter_argument" (not (f (a +++ ".") a))

eigenschap_waar_voor_gelijke_argumenten :: (String String -> Bool) String -> Property
eigenschap_waar_voor_gelijke_argumenten f a
					= name "eigenschap_waar_voor_gelijke_argumenten" (f a a)

eigenschap_waar_voor_gelijk_begin :: (String String -> Bool) String String -> Property
eigenschap_waar_voor_gelijk_begin f a b
					= name "eigenschap_waar_voor_gelijk_begin" (f a (a +++ b))

eigenschap_waar_voor_gelijk_midden :: (String String -> Bool) String String -> Property
eigenschap_waar_voor_gelijk_midden f a b
					= name "eigenschap_waar_voor_gelijk_midden" (f a (b +++ a +++ b))

eigenschap_waar_voor_gelijk_eind :: (String String -> Bool) String String -> Property
eigenschap_waar_voor_gelijk_eind f a b
					= name "eigenschap_waar_voor_gelijk_eind" (f a (b +++ a))

eigenschap_waar_voor_uitbreiding :: (String String -> Bool) String String -> Property
eigenschap_waar_voor_uitbreiding f a extra
					= name "eigenschap_waar_voor_uitbreiding" 
					       ((extra <> "") ==> f a (breid_string_uit extra a))

breid_string_uit :: String String -> String
breid_string_uit extra string
					= toString (flatten [[c:cs] \\ c <-: string])
where
	cs				= fromString extra

kleenes_matcht_altijd :: String -> Property
kleenes_matcht_altijd s
					= name "kleenes_matcht_altijd"
					       (ForEach [{# '*' \\ _ <- [1..n]} \\ n <- [1..10]] (flip is_match s))

dots :: String -> String
dots s			= {# '.' \\ _ <-: s}


dots_matcht_zelfde_lengte :: String -> Property
dots_matcht_zelfde_lengte s
					= name "dots_matcht_zelfde_lengte"
					       (is_match (dots s) s)

dots_mag_niet_meer_matchen :: String -> Property
dots_mag_niet_meer_matchen s = name "dots_mag_niet_meer_matchen"
                                (not (is_match ("." +++ dots s) s) 
                                    && 
                                 not (is_match (dots s) (s+++".")))

