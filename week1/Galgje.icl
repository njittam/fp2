module Galgje

import StdEnv, RandomGetallen

Start = galgje woord where
	woord = vraag_woord

galgje :: String -> String
galgje woord = woord

vraag_woord = woord where
	woord = "hier moet io komen"

