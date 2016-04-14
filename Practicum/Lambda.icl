implementation module Lambda

import StdEnv

:: Term		= C Value											// constante  v            (C v)
			| X Index											// variabele  x_i          (X i)
			| (@.) infixl 7 Term  Term							// applicatie (t1 t2)      (t1 @. t2)
			|  \.           Index Term							// abstractie (\x_i . t)   (\. i t)
:: Value  :== Int												// willekeurige integer waarde
:: Index  :== Int												// index (gebruikelijk i >= 0)

t0			= (C 42)											// 42
t1			= (X 0)												// x_0
t2			= (\.0 (X 0))										// (\x_0 . x_0)
t3			= (\.0 (X 0)) @. (C 42)								// (\x_0 . x_0) 42
t4			= (\.0 ((X 0) @. (X 0))) @. (\.1 ((X 1) @. (X 1)))	// (\x_0 . x_0 x_0) (\x_1 . x_1 x_1)
t5			= (\.0 (\.1 (X 0)))									// (\x_0 . (\x_1 . x_0))
t6			= (\.0 (\.1 (X 0))) @. (C 42) @. t4					// ((\x_0 . (\x_1 . x_0)) 42) ((\x_0 . x_0 x_0) (\x_1 . x_1 x_1))

terms							= [t0, t1, t2, t3, t4, t5, t6]

instance toString Term where
	toString ...

Start = foldr (\s1 s2 -> s1 +++ "\n" +++ s2) "\n" (map toString terms)

nf :: Term -> Bool
nf ...

//Start = map nf terms


vars :: Term -> [Index]
vars ...

//Start = map vars terms

fresh :: [Term] -> Index
fresh ...

//Start = fresh terms


(<:) infixl 6 :: Term (Index,Term) -> Term
(<:) ...

//Start = (((X 2) @. t1) @. (\.0 t1)) <: (0,C 50)

beta_reduce :: Term Term -> Term
beta_reduce ...

//Start = beta_reduce (\.0 ((X 0) @. (X 0))) (\.0 ((X 0) @. (X 0)))


normal_order :: Term -> Term
normal_order ...

applicative_order :: Term -> Term
applicative_order ...

/*
Start = (       toString t
		, '\n', toString (normal_order      t)
		, '\n', toString (applicative_order t)
		)
where
	t = (\.0 (\.1 (X 0))) @. ((\.0 (X 0)) @. (C 42)) @. (C 50)
*/

herschrijf :: (Term -> Term) Term -> Term
herschrijf ...

//Start = herschrijf normal_order t3
