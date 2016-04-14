definition module StdStack

:: Stack a

newStack :: Stack a                        // lege stack
push     ::  a  (Stack a) -> Stack a       // plaats nieuw element bovenop de stack
pushes   :: [a] (Stack a) -> Stack a       // plaats elementen achtereenvolgens bovenop stack
pop      ::     (Stack a) -> Stack a       // haal top element van stack
popn     :: Int (Stack a) -> Stack a       // haal bovenste $n$ top elementen van stack
top      ::     (Stack a) -> a             // geef top element van stack
topn     :: Int (Stack a) -> [a]           // geef bovenste $n$ top elementen van stack
elements ::     (Stack a) -> [a]           // geef alle elementen van stack
count    ::     (Stack a) -> Int           // tel aantal elementen in stack
