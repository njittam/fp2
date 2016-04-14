module FQL2

import StdEnv
import StdT
import Group

::  Nummer          =   { groep :: String         // De naam van de groep
                        , album :: String         // De naam van het album
                        , jaar  :: Int            // Het jaar van uitgave
                        , track :: Int            // Track nummer van het nummer (1 ..)
                        , titel :: String         // Naam van het nummer
                        , tags  :: [String]       // Beschrijvende tags van het nummer / album
                        , lengte:: T              // Lengte van het nummer
                        , land  :: [String]       // Land van oorsprong van groep
                        }

Start world
# (ok,dbs,world)	= fopen "Nummers.dbs" FReadText world
| not ok	        = abort "Kon bestand 'Nummers.dbs' niet openen."
# (inhoud,dbs)		= filelines dbs
# (ok,world)		= fclose dbs world
| not ok			= abort "Kon bestand 'Nummers.dbs' niet sluiten na lezen."
# nummersDB			= [  { groep = group
	                     , album = cd
	                     , jaar  = toInt year
	                     , track = toInt track
	                     , titel = title
	                     , tags  = sort (symbol_separated_list ',' tags)
	                     , lengte= fromString length
	                     , land  = sort (symbol_separated_list ',' countries)
	                     }
	                  \\ [_,group,cd,year,track,title,tags,length,countries] <- collect (nr_of_fields+1)		// verzamel alle elementen van een entry
	                                                                            (drop (nr_of_fields+1) 			// verwijder eerste elementen (headers)
	                                                                            (map initString inhoud))		// verwijder alle \n
	                  ]
# (io,world)        = stdio world
# io                = fql io
= snd (fclose io world)
where
	nr_of_fields	= 8

fql :: *File -> *File
fql io = io			// dit is de te implementeren functie om de commando's af te handelen
