implementation module StdT

import StdEnv

::	T = // implementeer een algebraisch type *of* een record type

instance ==			T where ==			// maak implementatie af
instance <			T where <			// maak implementatie af

instance zero		T where zero		// maak implementatie af
instance +			T where +			// maak implementatie af
instance -			T where -			// maak implementatie af

instance toInt		T where toInt		// maak implementatie af
instance fromInt	T where fromInt		// maak implementatie af

instance toString	T where toString	// maak implementatie af
instance fromString	T where fromString	// maak implementatie af
