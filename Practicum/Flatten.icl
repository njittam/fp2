module Flatten

import StdEnv

//	1.
Start	= flatten [ [x 0,x 1,x 2], [x 3,x 4], [x 5], [] ]

//	2.
Start   = flatten [ [ [x 0,x 1,x 2], [x 3,x 4] ], [], [ [x 5], [] ] ]

//	3.
Start	= flatten (flatten [ [ [x 0,x 1,x 2], [x 3,x 4] ], [], [ [x 5],[] ] ] )

x i		= x +++ toString i
