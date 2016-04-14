definition module RomeinsGetal

import StdEnv

:: RD    = M | D | C | L | X | V | I
:: Roman = Roman [RD]

instance toInt   Roman
instance fromInt Roman
