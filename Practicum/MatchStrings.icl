implementation module MatchStrings

import StdEnv

head				:: String -> Char
head s				= abort "head is nog niet geimplementeerd"

tail				:: String -> String
tail s				= abort "tail is nog niet geimplementeerd"

is_gelijk			:: String String -> Bool
is_gelijk a b		= abort "is_gelijk is nog niet geimplementeerd"

is_deelstring		:: String String -> Bool
is_deelstring a b	= abort "is_deelstring is nog niet geimplementeerd"

is_deel				:: String String -> Bool
is_deel a b			= abort "is_deel is nog niet geimplementeerd"

is_match			:: String String -> Bool
is_match a b		= abort "is_match is nog niet geimplementeerd"

//Start				= (head pink_floyd, tail pink_floyd)
//Start				= is_gelijk     "" " "
//Start				= is_deelstring "there"          pink_floyd
//Start				= is_deelstring "there"          marillion
//Start				= is_deel       "there"          marillion
//Start				= is_deel       "she and her"    pink_floyd
//Start				= is_deel       radiohead        pink_floyd
//Start				= is_match      "*.here*.here*." pink_floyd
//Start				= is_match      ".here.here."    pink_floyd

pink_floyd			= "Is there anybody in there?"
marillion			= "Just for the record"
radiohead			= "There there"
