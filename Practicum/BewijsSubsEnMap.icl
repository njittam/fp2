Zij gegeven de volgende functie-definities:

subs             :: [a] -> [[a]]
subs []          = [[]]                              (1.)
subs [x:xs]      = subs xs ++ map (cons x) (subs xs) (2.)

map              :: (a -> b) [a] -> [b]
map f []         = []                                (3.)
map f [x:xs]     = [f x : map f xs]                  (4.)

(++)             :: [a] [a] -> [a]
(++) []     ys   = ys                                (5.)
(++) [x:xs] ys   = [x : xs ++ ys]                    (6.)

cons             :: a [a] -> [a]
cons x xs        = [x : xs]                          (7.)


Bewijs de volgende stelling voor alle functies f en eindige lijsten xs:

    subs (map f xs) = map (map f) (subs xs).

Je kunt gebruik maken van de volgende hulpstellingen (lemma's) die gelden voor alle
functies f, g en eindige lijsten xs en ys:

map f (xs ++ ys)       = map f xs ++ map f ys        (8.)
map g (map f xs)       = map (g o f) xs              (9.)
(cons (f a)) o (map f) = (map f) o (cons a)          (10.)
(g o f) x              = g (f x)                     (11.)


Bewijs:
-------
