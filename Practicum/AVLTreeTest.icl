module AVLTreeTest

import StdEnv, StdAVLTree, Subs

//	Test alle mogelijkheden:
Start			= filter (not o isAVLTree) (map (foldr deleteAVLTree tree) (subs elementen))
where
	elementen	= [3,2,1,0,1,2,3,2,1,0,1,2,3]
	tree		= foldr insertAVLTree mkAVLLeaf elementen
