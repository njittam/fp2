module Twice

//	Zet de Maximum Heap Size *en* de Stack Size beide op 1M.

import StdEnv

Start = (                         inc 0
        ,                   twice inc 0
        ,             twice twice inc 0
        ,       twice twice twice inc 0
        , twice twice twice twice inc 0
        )
