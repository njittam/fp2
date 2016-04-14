definition module StdNum

import StdClass
import StdQ				// optioneel als je StdQ geimplementeerd hebt

::  Num

instance ==     Num
instance <      Num

instance +      Num
instance -      Num
instance zero   Num

instance *      Num
instance /      Num
instance one    Num

instance abs    Num
instance sign   Num
instance ~      Num

instance toInt  Num
instance toReal Num
instance toQ    Num		// optioneel als je StdQ geimplementeerd hebt

class    fromNum a :: !Num -> a
instance fromNum Int
instance fromNum Real
instance fromNum Q		// optioneel als je StdQ geimplementeerd hebt

class    toNum   a :: !a -> Num
instance toNum   Int
instance toNum   Real
instance toNum   Q		// optioneel als je StdQ geimplementeerd hebt

instance toString Num
