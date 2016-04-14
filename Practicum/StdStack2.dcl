definition module StdStack2

::	Stack2 elem = E.impl:	{ stack		:: impl
							, push		:: elem impl -> impl
							, pop		::      impl -> impl
							, top		::      impl ->  elem
							, elements	::      impl -> [elem]
							}
