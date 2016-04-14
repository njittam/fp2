Zij gegeven:

	::	Nat	= Zero | Suc Nat
	
	(##) :: Nat -> Int
	(##) Zero		= 0				    (1)
	(##) (Suc n)	= 1 + ##n		    (2)

1. Zij bovendien gegeven:

	add				:: Nat Nat -> Nat
	add Zero    n	= n				    (3)
	add (Suc m) n	= Suc (add m n)	    (4)
	
Bewijs de volgende stelling voor alle Nat m en n:

	## (add m n) = ##m + ##n

Bewijs:
-------


2. Zij bovendien gegeven:

	mul				:: Nat Nat -> Nat
	mul m Zero		= Zero				(5)
	mul m (Suc n)	= add (mul m n) m	(6)


Bewijs de volgende stelling voor alle Nat m en n:

	## (mul m n) = ##m * ##n

Bewijs:
-------
