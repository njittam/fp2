module FQL

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
# (ok,dbs,world)	    = fopen "Nummers.dbs" FReadText world
| not ok	        	= abort "Kon bestand 'Nummers.dbs' niet openen."
# (inhoud,dbs)			= filelines dbs
# (ok,world)			= fclose dbs world
| not ok				= abort "Kon bestand 'Nummers.dbs' niet sluiten na lezen."
# nummersDB				= [  { groep = group
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
= (alle_groepen nummersDB,world)
where
	nr_of_fields		= 8

alle_groepen			:: [Nummer] -> [String]
alle_groepen db			= abort "alle_groepen nog niet geimplementeerd\n"

alle_jaarblokken		:: [Nummer] -> [String]
alle_jaarblokken db		= abort "alle_jaarblokken nog niet geimplementeerd\n"

alle_albums_van			:: String [Nummer] -> [(Int,String)]
alle_albums_van band db	= abort "alle_albums_van nog niet geimplementeerd\n"

alle_tracks				:: String String [Nummer] -> [(Int,String,T)]
alle_tracks  cd band db	= abort "alle_tracks nog niet geimplementeerd\n"

speelduur_albums		:: [Nummer] -> [(T,String,String)]
speelduur_albums     db	= abort "speelduur_albums nog niet geimplementeerd\n"

totale_speelduur		:: [Nummer] -> T
totale_speelduur     db = abort "totale_speelduur nog niet geimplementeerd\n"

nederlandse_metal		:: [Nummer] -> [String]
nederlandse_metal    db = abort "nederlandse_metal nog niet geimplementeerd\n"


/*  De volgende functies zijn nodig in de Start functie om het bestand 'Nummers.dbs' in te lezen. 
    Je hoeft op dit moment nog niet te begrijpen wat hier staat.
*/

//  filelines leest alle regels in van file.
filelines				:: !*File -> (![String],!*File)
filelines file
# (end,file)			= fend file
| end                   = ([],file)
# (line,file)           = freadline file
# (lines,file)          = filelines file
= ([line:lines],file)

//  initString verwijdert laatste teken aan het einde van een regel.
initString			    :: !String -> String
initString str		    = str%(0,size str-2)

/*  collect n [x_1, ..., x_n, x_{n+1}, ... x_{2n}, ..., x_{mn+1} ... x_{mn+k}]
        = [[x_1, ..., x_n], [x_{n+1}, ... x_{2n}], ..., [x_{(m-1)n+1} ... x_{mn}]]
    waar:
        n > 0 /\ m >= 0 /\ k <= n
*/
collect					:: !Int ![x] -> [[x]]
collect n list
| length groupN < n	    = []
| otherwise			    = [groupN:collect n list`]
where
    (groupN,list`)		= splitAt n list

symbol_separated_list	:: !Char !String -> [String]
symbol_separated_list c str
						= filter (\str -> str <> "" && str <> (toString c)) [toString cs \\ cs <- group ((==) c) (fromString str)]
