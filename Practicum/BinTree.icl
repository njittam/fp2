implementation module BinTree

import StdEnv

::  Tree a = Node a (Tree a) (Tree a) | Leaf

t0 :: Tree Int
t0 = Leaf
t1 :: Tree Int
t1 = Node 4 t0 t0
t2 :: Tree Int
t2 = Node 2 t0 t1
t3 :: Tree Int
t3 = Node 5 t2 t0
t4 :: Tree Int
t4 = Node 5 t2 t2
t5 :: Tree Int
t5 = Node 1 Leaf (Node 2 Leaf (Node 3 Leaf (Node 4 Leaf Leaf)))
t6 :: Tree Int
t6 = Node 1 (Node 2 (Node 3 (Node 4 Leaf Leaf) Leaf) Leaf) Leaf
t7 :: Tree Int
t7 = Node 4 (Node 1 Leaf Leaf) (Node 5 (Node 2 Leaf Leaf) Leaf)

//  2.
nodes :: // meest algemene type
nodes ...

//Start = map nodes [t0,t1,t2,t3,t4,t5,t6,t7]

leaves :: // meest algemene type
leaves ...

//Start = map leaves [t0,t1,t2,t3,t4,t5,t6,t7]

diepte :: // meest algemene type
diepte ...

//Start = map diepte [t0,t1,t2,t3,t4,t5,t6,t7]
