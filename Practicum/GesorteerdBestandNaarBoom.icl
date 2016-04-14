implementation module GesorteerdBestandNaarBoom

import StdEnv
import SimpleFileIO

Start :: *World -> (BTree String,*World)
Start world = readSortedFile pad world

cleanpad :== // padnaam naar je Clean-distributie (directory waarin CleanIDE.exe staat)
pad      :== cleanpad +++ "Examples\\ObjectIO Examples\\scrabble\\Nederlands\\Nederlands_lexicon"

::	BTree a = // type definitie van binaire zoekboom

readSortedFile :: String *env -> (BTree String,*env) | FileSystem env
readSortedFile ...

writeSortedFile :: String (BTree String) *env -> *env | FileSystem env
writeSortedFile ...
