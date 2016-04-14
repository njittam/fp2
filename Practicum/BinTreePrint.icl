implementation module BinTreePrint

import StdEnv
import BinTree
import TextCompose		// als je tree2D implementeert

Start								= map (flip (+++) "\n" o toString) [t0,t1,t2,t3,t4,t5,t6,t7]

instance toString (Tree a) | toString a where
	toString tree					= indentTree tree
//	toString tree					= tree2D tree

/******************************************************************************************
	version with indented trees
******************************************************************************************/
indentTree							:: !(Tree a) -> String | toString a
indentTree tree						= ...

/******************************************************************************************
	version with TextCompose
******************************************************************************************/
tree2D								:: !(Tree a) -> String | toString a
tree2D tree							= ...
