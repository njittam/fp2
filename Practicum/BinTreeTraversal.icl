module BinTreeTraversal

import StdEnv
import BinTree

testboom = Node 10 
			(Node 6 
				(Node 2 Leaf (Node 4 Leaf (Node 5 Leaf Leaf)))
				(Node 7 Leaf Leaf)
			) 
			(Node 14 
				(Node 12
					(Node 11 Leaf Leaf)
					(Node 13 Leaf Leaf)
				)
				(Node 17 Leaf Leaf)
			)

lijstOplopend :: (Tree a) -> [a]
lijstOplopend ...

lijstAflopend :: (Tree a) -> [a]
lijstAflopend ...

lijstNaarBladen :: (Tree a) -> [a]
lijstNaarBladen ...

Start = (lijstOplopend   testboom, '\n'
        ,lijstAflopend   testboom, '\n'
        ,lijstNaarBladen testboom
        )
