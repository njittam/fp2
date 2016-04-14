implementation module Wisselgeld

import StdEnv

::  Bedrag     :== Int      // een positief getal
::  Valuta     :== Int      // een positief getal
::  Valutas    :== [Valuta] // een niet-lege lijst
::  Munt       :== Int      // een positief getal
::  K          :== Int      // een positief getal
::  WisselGeld :== [Munt]

//	Implementeer en test onderstaande functie:
wissel :: Bedrag Valutas K -> [WisselGeld]
wissel ...

//	Test-cases uit opdrachtenbundel:
Start = ( wissel 50 [100,50,20,10,5,1] 1, '\n'
        , wissel 50 [100,50,20,10,5,1] 2, '\n'
        , wissel 50 [100,50,20,10,5,1] 3, '\n'
        , wissel 50 [100,50,20,10,5,1] 4
        )
