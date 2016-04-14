Zij gegeven:

	map :: (a -> b) [a] -> [b]
	map f []      = []                 (1)
	map f [x:xs]  = [f x : map f xs]   (2)
	
	(f o g) x     = f (g x)            (3)

Bewijs de volgende stelling voor alle eindige lijsten xs en functies f en g:

	map (f o g) xs = map f (map g xs)

