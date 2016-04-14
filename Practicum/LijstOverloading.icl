implementation module LijstOverloading

import StdEnv, LijstGenerator

instance zero [a] | zero a where 
instance one  [a] | one  a where 
instance ~    [a] | ~    a where 
instance +    [a] | +    a where 
instance -    [a] | -    a where 
instance *    [a] | *    a where 
instance /    [a] | /    a where 

Start  = (test [1,2,3], test [1.0,2.0,3.0])

test a = ( zero + a == a && a == a + zero
         , a - zero == a && a == ~ (zero - a)
         ,  one * a == a && a == a * one
         ,  a / one == a
         ,  ~ (~ a) == a
         )
