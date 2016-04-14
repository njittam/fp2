module StdAssocListTest

/*	Test module StdAssocList
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only' en '2M' Maximum Heap Size
*/

import gast
import StdAssocList

Start
							= testn 1000
								(\x ->
								   newAssocList_is_leeg     /\
								   aantal_elementen_klopt x /\
								   lookup_after_update    x /\
								   lookup_after_update2   x /\
								   keys_zijn_uniek        x /\
								   True
								)

newIntStringAssocList		:: AssocList Int String
newIntStringAssocList		= newAssocList

vulIntStringAssocList		:: (AssocList Int String) Int -> AssocList Int String
vulIntStringAssocList l n	= seq [updateKey k (toString k) \\ k <- [1..n]] l

newAssocList_is_leeg		:: Property
newAssocList_is_leeg		= name "newAssocList_is_leeg"
							  (countValues newIntStringAssocList == 0)

aantal_elementen_klopt		:: Int -> Property
aantal_elementen_klopt n	= name "aantal_elementen_klopt"
							  (countValues (vulIntStringAssocList newIntStringAssocList n`) == max 0 n`)
where                  n`	= min n 100

lookup_after_update			:: Int -> Property
lookup_after_update n		= name "lookup_after_update"
							  (lookupKey k (updateKey k v (vulIntStringAssocList newIntStringAssocList n`)) == [v])
where                  n`	= min n 100
                       k	= n+1
                       v	= toString k

lookup_after_update2		:: Int -> Property
lookup_after_update2 n		= name "lookup_after_update"
							  (lookupKey k (vulIntStringAssocList (updateKey k v newIntStringAssocList) n`) == [v])
where                  n`	= min n 100
                       k	= n+1
                       v	= toString k

keys_zijn_uniek				:: Int -> Property
keys_zijn_uniek n			= name "keys_zijn_uniek"
							  (lookupKey k (removeKey k (vulIntStringAssocList newIntStringAssocList n`)) == [])
where                  n`	= min n 100
                       k	= n/2
