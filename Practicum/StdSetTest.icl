module StdSetTest

/*	Test module StdSet
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only' en '8M' Maximum Heap Size.
*/

import gast
import GenLexOrd
import StdSet

Start = testn 2000 
        (\n` n2` m -> let n  = cast [A,B,C] n`
                          n2 = cast [A,B,C] n2`
                       in 
							membership            m n  /\
							conversion_invariant  n    /\
							length_property       n    /\
							subset_property       n n2 /\
							strictsubset_property n n2 /\
							empty_properties      m n  /\
							disjoint_properties   n n2 /\
							product_properties    n n2 /\
							intersect_properties  n n2 /\
							setminus_properties   n n2 /\
							union_properties      n n2 /\
							powset_properties     n    /\
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

membership :: Enum [Enum] -> Property
membership x xs
 = name "membership"
   ( memberOfSet x s <==> isMember x xs )
  where s = toSet xs

conversion_invariant :: [Enum] -> Property
conversion_invariant xs
 = name "conversion_invariant" 
   ( toSet (fromSet xs`) == xs` )
   where xs` = toSet xs

length_property :: [Enum] -> Property
length_property xs
 = name "length_property"
   ( nrOfElements s == length (removeDup xs) )
 where s = toSet xs

subset_property :: [Enum] [Enum] -> Property
subset_property xs ys
 = name "subset_property"
   ( (isSubset u v) <==> all (flip isMember ys) xs)
  where (u,v) = (toSet xs, toSet ys)

strictsubset_property :: [Enum] [Enum] -> Property
strictsubset_property xs ys
 = name "strictsubset_property"
   ( (isStrictSubset u v) <==> (all (flip isMember ys) xs && not (all (flip isMember xs) ys)) )
  where (u,v) = (toSet xs, toSet ys)

// everything you alwys wanted to know about the empty set...
// ... but were afraid to ask
empty_properties :: Enum [Enum] -> Property
empty_properties x xs
 = name "empty_properties"
   ( isEmptySet (cast dummy zero) /\ isEmptySet (toSet (cast [A] [])) /\
     ((nrOfElements s == 0) <==> isEmptySet s) /\ 
           ((zero == s)     <==> isEmptySet s) )
 where s = toSet xs
       dummy :: Set Enum
       dummy = undef

product_properties :: [Enum] [Enum] -> Property
product_properties xs ys
 = name "product_properties"
   ( product u v == toSet [(x,y) \\ x<-xs, y<-ys ] )
 where (u,v) = (toSet xs, toSet ys)

powset_properties :: [Enum] -> Property
powset_properties xs
 = name "powset_properties"
   ( powerSet s == toSet (map toSet (subs xs)) )
 where s = toSet xs
       subs [] = [[]]
       subs [x:xs] = subs xs ++ [ [x:xs`] \\ xs` <- subs xs ]

union_properties :: [Enum] [Enum] -> Property
union_properties xs ys
 = name "union_properties"
   ( union u v == toSet (xs++ys) )
 where (u,v) = (toSet xs, toSet ys)

intersect_properties :: [Enum] [Enum] -> Property
intersect_properties xs ys
 = name "intersect_properties"
   ( intersection u v == toSet [ x \\ x<-xs | isMember x ys ] )
 where (u,v) = (toSet xs, toSet ys)

setminus_properties :: [Enum] [Enum] -> Property
setminus_properties xs ys
 = name "setminus_properties"
   ( without u v == toSet [ x \\ x<-xs | not (isMember x ys) ])
 where (u,v) = (toSet xs, toSet ys)

disjoint_properties :: [Enum] [Enum] -> Property
disjoint_properties xs ys
 = name "disjoint_properties"
   ( isDisjoint u v <==> (nrOfElements u + nrOfElements v == nrOfElements (union u v)) )
 where (u,v) = (toSet xs, toSet ys)
