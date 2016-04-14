implementation module Kaart

import StdEnv

Start :: [Kaart]
Start = sorteer_naar_kleur kaartspel

::	Kaart  // maak het type af
::	Kleur  // maak het type af
::	Waarde // maak het type af

instance ==         Kaart where // maak de instantie af
instance toString   Kaart where // maak de instantie af
instance fromString Kaart where // maak de instantie af

kaartspel :: [Kaart]
kaartspel = // genereer alle kaarten zonder duplicaten

sorteer_naar_waarde :: [Kaart] -> [Kaart]
sorteer_naar_waarde kaarten = // sorteer naar waarde, dan kleur

sorteer_naar_kleur :: [Kaart] -> [Kaart]
sorteer_naar_kleur kaarten = // sorteer naar kleur, dan waarde
