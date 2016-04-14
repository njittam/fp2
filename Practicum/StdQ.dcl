definition module StdQ

import StdOverloaded

::	Q

instance ==		Q			// gelijkheid van rationale getallen
instance <  	Q			// ordening op rationale getallen

instance +		Q			// optellen van rationale getallen
instance -  	Q			// aftrekken van rationale getallen
instance zero	Q			// het neutrale element van optellen (x+zero = zero+x = x)

instance *  	Q			// vermenigvuldigen van rationale getallen
instance /		Q			// delen van rationale getallen
instance one	Q			// het neutrale element van vermenigvuldigen (x*one = one*x = x)

instance abs	Q			// de absolute waarde van een rationaal getal
instance sign	Q			// het teken van het rationale getal
instance ~		Q			// teken-omkering van het rationale getal

isInt :: Q -> Bool			// test of het rationale getal een geheel getal representeert
instance toInt  Q			// zet een rationaal getal om naar een Int (met evt. afronding)
instance toReal Q			// zet een rationaal getal om naar een Real (bij benadering)

class toQ a :: a -> Q
instance toQ Int			// zet een Int om naar een rationaal getal
instance toQ Real			// zet een Real om naar een rationaal getal
instance toQ (Int,Int)		// zet een (t,n) om naar rationaal getal met t de teller, en n de noemer
instance toQ (Int,Int,Int)	// zet een (x,t,n) om naar het rationale getal toQ (x*n+t,n)
instance toString Q			// toon een rationaal getal q als "s(x+t/n)" zodanig dat:
							// q = x + t/n (volgens wiskundige regels)
							// 0 < abs (t/n) < 1
							// s = "" als q>=0; s = -1 anders
							// vb: toString (toQ  11 2) = "(5+1/2)"
							// vb: toString (toQ -11 2) = "-(5+1/2)"
							
							// als abs (t/n) == 0, toon dan alleen x
							// vb: toString (toQ 10 2) = "5"
