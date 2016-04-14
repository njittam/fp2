definition module PropositieLogica3

import StdBool2, StdClass

//	Definitie PropL moet gekopieerd worden uit PropositieLogica3.icl
::	PropL d		=	Con  d						// constante d (2-waardig of 3-waardig)
				|	Var  Ident					// variabele met gegeven naam
				|	Niet (PropL	d)				// ontkenning van een term
				|	En   (PropL d) (PropL d)	// logische conjunctie
				|	Of   (PropL d) (PropL d)	// logische disjunctie
::	Ident		:== Int					// variabelen hebben een index i (> 0)
::	Valuatie d	// valuatie van variabelen naar booleans

::	Bool3		=	Waar | Onwaar | Onbekend

class domein d	:: [d]
class true   d	::  d

instance domein   Bool
instance domein   Bool3
instance true     Bool
instance true     Bool3
instance ==       Bool3
instance ~~       Bool3
instance |||      Bool3
instance &&&      Bool3
instance toString Bool3
instance toString (PropL d) | toString d


vars			::              (PropL d) -> [Ident]
vals			:: [Ident]                -> [Valuatie d] | domein d
eval			:: (Valuatie d) (PropL d) -> d            | ~~, |||, &&& d
truths			::              (PropL d) -> [Valuatie d] | ~~, |||, &&&, ==, domein, true d
