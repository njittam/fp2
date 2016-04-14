definition module BoerZoektVrouw

::	Nr :== Int    // 1..N

/*	boer_zoekt_vrouw (voorkeuren_mannen,voorkeuren_vrouwen)
	berekent een 'stable marriage' oplossing tussen de populatie mannen en vrouwen middels het 
	Gale / Shapley algoritme mits de invoer aan de volgende voorwaarden voldoet:
	
	(1) de lengte N van voorkeuren_mannen is identiek aan de lengte van voorkeuren_vrouwen,
	    en is bovendien een even waarde
	(2) de voorkeuren van iedere man en iedere vrouw is een permutatie van [1..N]
	
	De oplossing is een lijst van koppels (man,vrouw) die stabiel is.
*/
boer_zoekt_vrouw :: ([[Nr]],[[Nr]]) -> [(Nr,Nr)]
