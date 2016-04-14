definition module PropositieLogica2

import StdEnv

//	Definitie PropL moet gekopieerd worden uit PropositieLogica2.icl
::	PropL					=	Waar				// logische waarheid
							|	Onwaar				// logische onwaarheid
							|	Niet PropL			// ontkenning van een term
							|	En   PropL PropL	// logische conjunctie
							|	Of   PropL PropL	// logische disjunctie
							|	Var  Ident			// variabele v met gegeven index i
::	Ident					:== Int					// variabelen hebben een index i (> 0)
::	Valuatie				// valuatie van variabelen naar booleans

instance toString PropL

eval1						::          PropL -> Bool
eval2						:: Valuatie PropL -> Bool
vars						::          PropL -> [Ident]
vals						:: [Ident]        -> [Valuatie]
truths						::          PropL -> [Valuatie]
