implementation module RomeinsGetal

import StdEnv

Start :: [Roman]
Start = [fromInt 42, fromInt 999, fromInt 1024]


:: RD    = M | D | C | L | X | V | I
:: Roman = Roman [RD]

instance toInt   Roman where // maak deze instantie af
instance fromInt Roman where // maak deze instantie af
