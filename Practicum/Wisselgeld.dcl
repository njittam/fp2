definition module Wisselgeld

::  Bedrag     :== Int      // een positief getal
::  Valuta     :== Int      // een positief getal
::  Valutas    :== [Valuta] // een niet-lege lijst
::  Munt       :== Int      // een positief getal
::  K          :== Int      // een positief getal
::  WisselGeld :== [Munt]

//	Implementeer en test onderstaande functie:
wissel :: Bedrag Valutas K -> [WisselGeld]
