module StdSortListTest

/*	Test module StdSortList
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only' en '16M' Maximum Heap Size.
*/

import gast
import GenLexOrd
import StdSortList

Start = testn 10000 
		(\n` n2` m -> let	n  = lst2slst (cast [A,B,C] n` )
							n2 = lst2slst (cast [A,B,C] n2`) 
			           in 
							leeg_is_leeg                   /\
							count_matches_elems     n      /\
							is_sorted_elems         n      /\
							member_is_member        n m    /\
							member_na_insert        n m    /\
							member_na_remove        n m    /\
							insert_remove_invariant n m    /\
							minimum_property        n      /\
							maximum_property        n      /\
							merge_additive          n n2   /\
							merge_member            n n2 m /\
							True
		)

:: Enum = A | B | C 

derive bimap []
derive ggen Enum
derive genShow Enum
derive gEq Enum
derive gLexOrd Enum
instance == Enum where (==) x y = gEq{|*|} x y
instance <  Enum where  (<) x y = gEq{|*|} (gLexOrd{|*|} x y) LT

// clean should have something like this!
cast :: a a -> a
cast _ x = x

leeg_is_leeg :: Property
leeg_is_leeg 
 = name "leeg_is_leeg"
    (count newSortList == 0)

count_matches_elems :: (SortList a) -> Property | Eq, Ord a
count_matches_elems n 
 = name "count_matches_elems" 
    (length (elements n) == count n)

is_sorted_elems :: (SortList a) -> Property | Eq, Ord a
is_sorted_elems n
 = name "is_sorted_elems"
    (isSorted (elements n))
    where isSorted lst = and [ x<=y \\ x<-lst & y<-tl lst ]

member_is_member :: (SortList a) a -> Property | Eq, Ord a
member_is_member lst e
 = name "member_is_member"
    ((isMember e (elements lst)) <==> (memberSort e lst))

member_na_insert :: (SortList a) a -> Property | Eq, Ord a
member_na_insert lst e
 = name "member_na_insert"
    (memberSort e (insertSort e lst))

member_na_remove :: (SortList a) a -> Property | Eq, Ord a
member_na_remove lst e
 = name "member_na_remove"
    (not (memberSort e (removeAll e lst)))

insert_remove_invariant :: (SortList a) a -> Property | Eq, Ord a
insert_remove_invariant lst e
 = name "insert_remove_invariant"
    (memberSort e lst <==> memberSort e lst`)
    where lst` = removeFirst e (insertSort e lst)

minimum_property :: (SortList a) -> Property | Eq,Ord a
minimum_property n
 = name "minimum_property"
    (count n > 0 ==> (memberSort min n /\ all ((<=) min) (elements n)))
    where min = minimum n

maximum_property :: (SortList a) -> Property | Eq,Ord a
maximum_property n
 = name "maximum_property"
    (count n > 0 ==> (memberSort max n /\ all ((>=) max) (elements n)))
    where max = maximum n

merge_member :: (SortList a) (SortList a) a -> Property | Eq,Ord a
merge_member n m e
 = name "merge_member"
	(memberSort e nm <==> (memberSort e n \/ memberSort e m))
	where nm = mergeSortList n m

merge_additive :: (SortList a) (SortList a) -> Property | Eq,Ord a
merge_additive n m 
 = name "merge_additive"
	(count n + count m == count nm)
	where nm = mergeSortList n m

lst2slst :: [a] -> SortList a | Eq,Ord a
lst2slst xs = seq (map insertSort xs) newSortList
