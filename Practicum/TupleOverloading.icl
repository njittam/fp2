implementation module TupleOverloading

import StdEnv

instance +    (a,b)   | + a & + b                where
instance +    (a,b,c) | + a & + b & + c          where


instance -    (a,b)   | - a & - b                where
instance -    (a,b,c) | - a & - b & - c          where

instance *    (a,b)   | * a & * b                where
instance *    (a,b,c) | * a & * b & * c          where

instance /    (a,b)   | / a & / b                where
instance /    (a,b,c) | / a & / b & / c          where

instance zero (a,b)   | zero a & zero b          where
instance zero (a,b,c) | zero a & zero b & zero c where

instance one  (a,b)   | one a & one b            where
instance one  (a,b,c) | one a & one b & one c    where

instance ~    (a,b)   | ~ a & ~ b                where
instance ~    (a,b,c) | ~ a & ~ b & ~ c          where

Start  = (test (1,2), test (1,2,3))

test a = ( zero + a == a    && a    == a + zero
         , a - zero == a    && a    == ~ (zero - a)
         ,  one * a == a    && a    == a * one
         , zero * a == zero && zero == a * zero
         ,  a / one == a
         ,  ~ (~ a) == a
         )
