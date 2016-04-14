implementation module Woordfrequentie

import StdEnv, Frequentielijst, Words, FrequentielijstGUI

// Zonder GUI:
Start			= lijst
// Met GUI:
Start world		= toonFrequentielijst2 lijst world

woordfrequentie	:: String -> [(String,Int)]
woordfrequentie ...

lijst			= woordfrequentie tekst
tekst			= foldl (+++) "" regels
where
	regels		= ["Far out in the uncharted backwaters of the unfashionable end of the western spiral\n"
				  ,"arm of the Galaxy lies a small unregarded yellow sun.\n"
				  ,"\n"
				  ,"Orbiting this at a distance of roughly ninety-two million miles is an utterly\n"
				  ,"insignificant little blue-green planet whose ape-descended life forms are so \n"
				  ,"amazingly primitive that they still think digital watches are a pretty neat idea.\n"
				  ,"\n"
				  ,"This planet has - or rather had - a problem, which was this: most of the people\n"
				  ,"living on it were unhappy for pretty much of the time.\n"
				  ,"Many solutions were suggested for this problem, but most of these where largely\n"
				  ,"concerned with the movements of small green pieces of paper, which is odd because\n"
				  ,"on the whole it wasn�t the small green pieces of paper that were unhappy.\n"
				  ]
