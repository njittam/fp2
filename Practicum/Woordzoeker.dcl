definition module Woordzoeker

import VectorOverloading

::	Puzzel	:== [[Char]]		// lijst van rijen van leestekens (van links naar rechts, van boven naar beneden)
::	Woord	:== [Char]
::	Coord	:== Vector2 Int

woordZoeker :: Puzzel [Woord] -> Woord
