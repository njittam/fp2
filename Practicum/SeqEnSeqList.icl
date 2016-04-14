module SeqEnSeqList

import StdEnv, StdStack

Start         = and
                [ elements` s1           == elements s2
                , elements` (popn` 3 s1) == elements (popn 3 s2)
                ,            topn` 3 s1  ==           topn 3 s2
                , elements` s1           == elements s2
                ]
where (s1,s2) = (pushes` [1..5] newStack, pushes [1..5] newStack)

pushes`       = // expressie met seq en push
popn`         = // expressie met seq en pop
topn`   n s   = // expressie met seqList, top en pop
elements` s   = // expressie met seqList, top en pop
