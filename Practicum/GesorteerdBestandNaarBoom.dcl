definition module GesorteerdBestandNaarBoom

import StdFile

::	BTree a // type definitie van binaire zoekboom

readSortedFile	:: String *env -> (BTree String,*env) | FileSystem env
writeSortedFile	:: String (BTree String) *env -> *env | FileSystem env
