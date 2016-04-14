definition module Lambda

import StdEnv

:: Term				= C Value					// constante  v            (C v)
					| X Index					// variabele  x_i          (X i)
					| (@.) infixl 7 Term  Term	// applicatie (t1 t2)      (t1 @. t2)
					|  \.           Index Term	// abstractie (\x_i . t)   (\. i t)
:: Value		  :== Int						// willekeurige integer waarde
:: Index		  :== Int						// index (gebruikelijk i >= 0)

instance toString Term

nf					:: Term              -> Bool
vars				:: Term              -> [Index]
(<:) infixl 6		:: Term (Index,Term) -> Term

normal_order		::                Term -> Term
applicative_order	::                Term -> Term
herschrijf			:: (Term -> Term) Term -> Term
