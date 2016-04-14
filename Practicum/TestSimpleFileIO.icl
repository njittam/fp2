module TestSimpleFileIO

import SimpleFileIO, StdEnv

bestand n :== "TestSimpleFileIO" +++ toString n +++ ".icl"

Start :: *World -> (String,*World)

/*	Test onderdeel 1: */
Start world
	= case readFile (bestand "") world of
		(Just inhoud,world)
			= case writeFile (bestand 1) inhoud world of
				(True,world)	= ("Bestand '" +++ bestand 1 +++ "' geschreven.\n",    world)
				(_,   world)	= ("Bestand '" +++ bestand 1 +++ "'niet geschreven.\n",world)
		(nothing,    world) = ("Kon '" +++ bestand "" +++ "' niet lezen.\n",world)

/*	Test onderdeel 2: */
Start world
	= case readLines (bestand 1) world of
		(Just regels,world)
			= case writeLines (bestand 2) (reverse regels) world of
				(True, world)	= ("Bestand '" +++ bestand 2 +++ "' geschreven.\n",     world)
				(False,world)	= ("Bestand '" +++ bestand 2 +++ "' niet geschreven.\n",world)
		(nothing,world)	= ("Kon '" +++ bestand 1 +++ "' niet lezen.\n",world)

/*	Test onderdeel 3: */
Start world
	= case mapFile (bestand 2) (bestand 3) (map toUpper) world of
		(False,world)	= ("Kon '" +++ bestand 2 +++ "' niet lezen of '" +++ bestand 3 +++ "' niet schrijven.\n",world)
		(_,    world)	= ("Bestand '" +++ bestand 3 +++ "' geschreven.\n",world)
