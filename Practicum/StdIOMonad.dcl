definition module StdIOMonad

//	Deze module verpakt een aantal StdFile functies in een monadische jas

import StdMonad, StdMaybeMonad

:: IO a
:: Void       = Void
:: Filemode   = Lees | Schrijf
:: Filenaam :== String
:: Filehandle

//	voer monadische I/O actie uit op de wereld:
doIO		:: (IO a) *World -> (a,*World)

//  IO is een monad:
instance return IO
instance >>=    IO

//	lees regel van de console:
read		:: IO String

//	schrijf regel naar de console:
write		:: String -> IO Void

//	open de file met gegeven filenaam en mode:
open		:: Filenaam Filemode -> IO (Maybe Filehandle)

//	sluit de file met gegeven filenaam:
close		:: Filehandle -> IO Bool

//	bepaal of het lezen van de file klaar is:
eof			:: Filehandle -> IO Bool

//	lees een regel van een file:
readline	:: Filehandle -> IO (Maybe String)

//	schrijf een regel naar een file:
writeline	:: String Filehandle -> IO Bool
