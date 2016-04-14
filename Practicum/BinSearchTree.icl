implementation module BinSearchTree

import StdEnv
import BinTree

z0 = Leaf
z1 = insertTree 50 z0
z2 = insertTree 10 z1
z3 = insertTree 75 z2
z4 = insertTree 80 z3
z5 = insertTree 77 z4
z6 = insertTree 10 z5
z7 = insertTree 75 z6
z8 = deleteTree 50 z7

//  Uit het diktaat, blz. 73:
insertTree :: a (Tree a) -> Tree a | Ord a
insertTree e Leaf = Node e Leaf Leaf
insertTree e (Node x le ri)
| e <= x = Node x (insertTree e le) ri
| e >  x = Node x le (insertTree e ri)

deleteTree :: a (Tree a) -> (Tree a) | Eq, Ord a
deleteTree e Leaf = Leaf
deleteTree e (Node x le ri)
| e <  x = Node x (deleteTree e le) ri
| e == x = join le ri
| e >  x = Node x le (deleteTree e ri)
where
	join :: (Tree a) (Tree a) -> (Tree a)
	join Leaf b2 = b2
	join b1 b2 = Node x b1` b2
	where
		(x,b1`) = largest b1
		
		largest :: (Tree a) -> (a,(Tree a))
		largest (Node x b1 Leaf) = (x,b1)
		largest (Node x b1 b2)   = (y,Node x b1 b2`)
		where
			(y,b2`) = largest b2


is_geordend :: // meest algemene type
is_geordend ...

Start = map is_geordend [t0,t1,t2,t3,t4,t5,t6,t7]


is_gebalanceerd :: // meest algemene type
is_gebalanceerd ...

//Start = map is_gebalanceerd [t0,t1,t2,t3,t4,t5,t6,t7]
