implementation module GenTree

import StdEnv

::  GenTree a b = Node a [GenTree a b] | Leaf b
::  Either  a b = This a | That b

root :: (GenTree a b) -> Either a b
root ...

trees :: (GenTree a b) -> [GenTree a b]
trees ...

isNodeMember :: a (GenTree a b) -> Bool | Eq a
isNodeMember ...

isLeafMember :: b (GenTree a b) -> Bool | Eq b
isLeafMember ...

allNodes :: (GenTree a b) -> [a]
allNodes ...

allLeaves :: (GenTree a b) -> [b]
allLeaves ...

allMembers :: (GenTree a a) -> [a]
allMembers ...

map2 :: (a -> c,b -> d) (GenTree a b) -> GenTree c d
map2 ...

Start = allLeaves (Node 5 [Node 3 [Node 6 [Leaf 42.42]],Leaf 3.14])
