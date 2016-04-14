definition module FrequentielijstGUI

import StdEnv, StdIO

/** toonFrequentielijst [(a_1,f_1) ... (a_n,f_n)] world
	toont in een staafdiagram de elementen en hun frequentie.
	Voor n=0 worden alleen de assen van de grafiek getekend.	
*/
toonFrequentielijst  :: [(a,Int)] *World -> *World | toString a
toonFrequentielijst2 :: [(a,Int)] *World -> *World | toString a
