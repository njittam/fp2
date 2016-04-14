module ReducerenVanLijsten

import StdEnv

//	1.
Start
= [] ++ []


//	2.
Start
= [] ++ [x 0,x 1] ++ []


//	3.
Start
= [[]] ++ [x 0,x 1]


//	4.
Start
= [[x 0,x 1]] ++ [[]]


// 5.
Start
= [x 0,x 1,x 2] ++ ([x 3,x 4] ++ ([x 5] ++ []))


// 6.
Start
= (([x 0,x 1,x 2] ++ [x 3,x 4]) ++ [x 5]) ++ []

x i = "x" +++ toString i
