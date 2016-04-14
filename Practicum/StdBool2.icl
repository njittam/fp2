implementation module StdBool2

import StdEnv

lift0					:: // meest algemene type
lift0 f          a		= f a

lift1					:: // meest algemene type
lift1 f g1       a		= f (g1 a)

lift2					:: // meest algemene type
lift2 f g1 g2    a		= f (g1 a) (g2 a)

lift3					:: // meest algemene type
lift3 f g1 g2 g3 a		= f (g1 a) (g2 a) (g3 a)

instance ~~  Bool        where ...
instance ||| Bool        where ...
instance &&& Bool        where ...

instance ~~  (a -> Bool) where ...
instance ||| (a -> Bool) where ...
instance &&& (a -> Bool) where ...

Start = ( filter ((<) 3 &&& (>) 8) [1 .. 10]
        , filter (~~ ((==) 5))     [1 .. 10]
        )
