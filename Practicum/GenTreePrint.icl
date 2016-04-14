implementation module GenTreePrint

import StdEnv
import GenTree
import TextCompose

instance toString (GenTree a b) | toString a & toString b where
	toString tree					= indentTree tree
//	toString tree					= tree2D tree

/******************************************************************************************
	version with indented trees
******************************************************************************************/
indentTree :: !(GenTree a b) -> String | toString a & toString b
indentTree tree = ...

/******************************************************************************************
	version with TextCompose
******************************************************************************************/
tree2D :: !(GenTree a b) -> String | toString a & toString b
tree2D tree = ...
