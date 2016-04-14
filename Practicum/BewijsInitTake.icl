Zij gegeven:

	init :: [a] -> [a]
	init [x]		= []						(1)
	init [x:xs]		= [x:init xs]				(2)
	
	take :: Int [a] -> [a]
	take 0 xs		= []						(3)
	take n []		= []						(4)
	take n [x:xs]	= [x : take (n-1) xs]		(5)
	
	length :: [a] -> Int
	length []		= 0							(6)
	length [x:xs]	= 1 + length xs				(7)
	
	(f o g) x		= f (g x)					(8)

Bewijs de volgende stelling voor alle eindige, niet-lege lijsten xs:

	init xs = take (length xs - 1) xs

Je mag aannemen dat het Int-bereik onbeperkt is.
