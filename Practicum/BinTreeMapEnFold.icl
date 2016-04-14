module BinTreeMapEnFold

import StdEnv

:: BTree a				= Tip a | Bin (BTree a) (BTree a)

testboom				= Bin (Bin (Bin (Tip 1) (Tip 2)) (Tip 3)) (Bin (Bin (Tip 4) (Tip 5)) (Bin (Tip 6) (Bin (Tip 7) (Tip 8))))

mapbtree				:: (a -> b) (BTree a) -> BTree b
mapbtree f (Tip a)		= Tip (f a)
mapbtree f (Bin t1 t2)	= Bin (mapbtree f t1) (mapbtree f t2)

foldbtree				:: (a a -> a) (BTree a) -> a
foldbtree f (Tip a)		= a
foldbtree f (Bin t1 t2)	= f (foldbtree f t1) (foldbtree f t2)

f1						:: // meest algemene type
f1						= foldbtree (+)

f2						:: // meest algemene type
f2						= foldbtree (+) o (mapbtree (const 1))

f3						:: // meest algemene type
f3						= foldbtree (\x y -> 1 + max x y) o (mapbtree (const 0))

f4						:: // meest algemene type
f4						= foldbtree (++) o (mapbtree (\x -> [x]))

Start :: (Int,Char,Int,Char,Int,Char,[Int],Char)
Start = (f1 testboom, '\n'
        ,f2 testboom, '\n'
        ,f3 testboom, '\n'
        ,f4 testboom, '\n'
        )
