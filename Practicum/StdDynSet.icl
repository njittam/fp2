implementation module StdDynSet

import StdEnv
import StdDynamic

class Set a | TC, ==, toString a

:: Set = Set [Dynamic]

instance zero     Set
where zero = abort "zero instance voor Set nog niet geimplementeerd.\n"

instance toString Set
where toString a = abort "toString instance voor Set nog niet geimplementeerd.\n"

instance == Set
where == a b = abort "== instance voor Set nog niet geimplementeerd.\n"

toSet :: a -> Set | Set a
toSet a = abort "toSet nog niet geimplementeerd.\n"

nrOfElts :: Set -> Int
nrOfElts a = abort "nrOfElts nog niet geimplementeerd.\n"

isEmptySet :: Set -> Bool
isEmptySet a = abort "isEmptySet nog niet geimplementeerd.\n"

memberOfSet :: a Set -> Bool | Set a
memberOfSet x a = abort "memberOfSet nog niet geimplementeerd.\n"

isSubset :: Set Set -> Bool
isSubset a b = abort "isSubset nog niet geimplementeerd.\n"

isStrictSubset :: Set Set -> Bool
isStrictSubset a b = abort "isStrictSubset nog niet geimplementeerd.\n"

union :: Set Set -> Set
union a b = abort "union nog niet geimplementeerd.\n"

intersection :: Set Set -> Set
intersection a b = abort "intersection nog niet geimplementeerd.\n"

without :: Set Set -> Set
without a b = abort "without nog niet geimplementeerd.\n"
