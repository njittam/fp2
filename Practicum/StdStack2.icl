implementation module StdStack2

import StdEnv

::	Stack2 elem = E.impl:	{ stack		:: impl
							, push		:: elem impl -> impl
							, pop		::      impl -> impl
							, top		::      impl ->  elem
							, elements	::      impl -> [elem]
							}

push :: elem (Stack2 elem) -> Stack2 elem
push ...

pop :: (Stack2 elem) -> Stack2 elem
pop ...

top :: (Stack2 elem) -> elem
top ...

elements :: (Stack2 elem) -> [elem]
elements ...
