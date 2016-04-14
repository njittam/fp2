Zij gegeven:

(++) :: [a] [a] -> [a]
(++) []     xs = xs                (1)
(++) [y:ys] xs = [y : ys ++ xs]    (2)

map :: (a -> b) [a] -> [b]
map f []       = []                (3)
map f [x:xs]   = [f x : map f xs]  (4)

flatten :: [[a]] -> [a]
flatten []     = []                (5)
flatten [x:xs] = x ++ (flatten xs) (6)

1. 
Te bewijzen: 
	voor iedere functie f, eindige lijst as en bs:
		
		map f (as ++ bs) = (map f as) ++ (map f bs)

Bewijs:


2. 
Te bewijzen:
	voor iedere functie f, voor iedere eindige lijst xs:
	
		flatten (map (map f) xs) = map f (flatten xs)

Bewijs:
