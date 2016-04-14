module IKS

import StdEnv
import StdMaybe
import StdDynamic, StdDynamicFileIO

/**	Een interpreter voor IKS.
*/
//	1. Creeer de dynamics op disk
Start :: *World -> *World
Start world 
# (_,world) = writeDynamic "I" (dynamic i :: A. a: a -> a) world
  ...
= world

i :: a -> a
i x = x

k :: a b -> a
k x y = x

s :: (a -> b -> c) (a -> b) a -> c
s x y z = x z (y z)


//	2. Parseren van IKS expressies
::	IKS = I | K | S | N Int | App IKS IKS

pIKS :: [Char] -> Maybe IKS
pIKS ...


//	3. Interpreteren van IKS expressies
interp :: (Dynamic,Dynamic,Dynamic) IKS -> Dynamic
interp ...


//	4. console
Start :: *World -> *World
Start ...
