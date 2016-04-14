module StdStackTest

/*	Test module StdStack
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only' en '2M' Maximum Heap Size
*/

import gast
import StdStack

Start
							= testn 1000
								(\x n ->
								   newStack_is_empty               /\
								   stack_is_reverse        n       /\
								   pop_empty_is_ok                 /\
								   top_na_push             n x     /\
								   pop_na_push               x     /\
								   count_counts            n x     /\
								   pop_maakt_stack_korter  n       /\
								   True
								)

newStack_is_empty			:: Property
newStack_is_empty			= name "newStack_is_empty" (isEmpty (elements empty))

stack_is_reverse			:: Int -> Property
stack_is_reverse n			= name "stack_is_reverse"
							  (elements (pushes [1..n`] newStack) == reverse [1..n`])
where            n`			= min (abs n) 100

pop_empty_is_ok				:: Property
pop_empty_is_ok				= name "pop_empty_is_ok" (count (pop empty) == 0)

top_na_push					:: Int Int -> Property
top_na_push x n				= name "top_na_push"
							  (top (push x (pushes [1..n`] newStack)) == x)
where         n`			= min (abs n) 100

pop_na_push					:: Int -> Property
pop_na_push a				= name "pop_na_push"
                              (top (pop (pop (pushes [a,b,c] newStack))) == a)
where b						= a + a + one
      c						= b + a + one

count_counts				:: Int Int -> Property
count_counts n x			= name "count_counts"
							  (length (elements stack) == count stack)
where stack					= pushes [1..n`] newStack
      n`					= min (abs n) 100

pop_maakt_stack_korter		:: Int -> Property
pop_maakt_stack_korter n	= name "pop_maakt_stack_korter"
							  (count stack == 0 || count (pop stack) == count stack - 1)
where stack					= pushes [1..n`] newStack
	  n`					= min (abs n) 100

empty						:: Stack Int
empty						= newStack
