implementation module WC

import StdEnv, Words, SimpleFileIO

Start :: *World -> (Int,*World)
Start world = wc "WC.icl" world

wc :: String *env -> (Int,*env) | FileSystem env
wc ...
