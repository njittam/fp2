implementation module ZFUpdateAt

import StdEnv

Start = updateAt2 300 42 [100,90 .. 0] == updateAt 300 42 [100,90 .. 0]

updateAt2 :: !Int a ![a] -> [a]
updateAt2 ...
