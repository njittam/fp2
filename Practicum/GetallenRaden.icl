module GetallenRaden

/*	Dynamics werken alleen met de 32-bit versie van de Clean compiler.
	(*) Gebruik Environment 'Experimental'
	(*) In Project:Project Options: zet vlag 'Enable dynamics' aan
*/
import StdEnv
import StdDynamic, StdDynamicFileIO		// nodig voor dynamics en dynamics in files

Start :: *World -> *World
Start world
	= world
