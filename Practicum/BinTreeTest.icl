module BinTreeTest

/*	Test module BinTree
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only' en '2M' Maximum Heap Size
*/

import gast
import BinTree

Start
							= testn 1000
								(\n -> let n` = abs (n/2) in
								   nodes_vs_leaves  n` /\
								   leaves_vs_diepte n` /\
								   True
								)

nodes_vs_leaves				:: Int -> Property
nodes_vs_leaves n			= name "nodes_vs_leaves"
							  (nodes t == leaves t - 1)
where           t			= lego_tree n

leaves_vs_diepte			:: Int -> Property
leaves_vs_diepte n			= name "leaves_vs_diepte"
							  (leaves t <= 2^(diepte t))
where           t			= lego_tree n

//	Function to construct semi-random trees, using those from BinTree:
trees						=: [t0,t1,t2,t3,t4,t5,t6,t7]
nr_of_trees					=: length trees

lego_tree					:: Int -> Tree Int
lego_tree 0					= t0
lego_tree n					= glue n (trees !! (n rem nr_of_trees)) (lego_tree (n/10))
where
	glue					:: !Int !(Tree Int) !(Tree Int) -> Tree Int
	glue n t Leaf			= t
	glue n t (Node x l r)
	| isEven n				= Node x (glue (n/10) t l) r
	| otherwise				= Node x l (glue (n/10) t r)
