definition module Kaart

import StdEnv

::	Kaart = // maak het type af

instance ==         Kaart
instance toString   Kaart
instance fromString Kaart

kaartspel			:: [Kaart]
sorteer_naar_waarde	:: [Kaart] -> [Kaart]
sorteer_naar_kleur	:: [Kaart] -> [Kaart]
