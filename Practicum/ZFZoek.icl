implementation module ZFZoek

import StdEnv

(??) infixl 9 :: ![a] !a -> Int | Eq a
//(??) ...

// Het resultaat moet True zijn.
Start = [ [1,2,3,4,5,6]   ?? 3
        , [1,2,3,4,5,6]   ?? 10
        , ['Hello world'] ?? 'o'
        ]
        ==
        [ 2, -1, 4 ]
