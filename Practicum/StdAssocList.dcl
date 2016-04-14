definition module StdAssocList

import StdClass

::  AssocList k a

newAssocList ::      AssocList k a          // lege associatie lijst
countValues  ::     (AssocList k a) -> Int  // aantal elementen
lookupKey    :: k   (AssocList k a) -> [a]           | Eq, Ord k // elementen met sleutelwaarde
updateKey    :: k a (AssocList k a) -> AssocList k a | Eq, Ord k // verander waarde van key-value paar
removeKey    :: k   (AssocList k a) -> AssocList k a | Eq, Ord k // verwijder elementen
