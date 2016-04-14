implementation module Group

import StdEnv

Start = ( group isEven  [1 .. 10]
        , group isOdd   [1 .. 10]
        , group isDigit ['7 Dwergen en 11 princessen zoenden 3 kikkerprinsen.']
        )

group :: (a -> Bool) [a] -> [[a]]
group ...
