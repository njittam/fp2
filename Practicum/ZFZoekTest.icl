module ZFZoekTest

/*	Test module ZFZoek
	Voor werken met Gast:
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/
import gast
import ZFZoek

Start
										= testn 1000
											(\m n ->
											    let l = [1 .. n bitand 0xFF] in
											    elementen_worden_gevonden             l /\
											    niet_elementen_worden_niet_gevonden m l /\
											    True
											)

elementen_worden_gevonden				:: [Int] -> Property
elementen_worden_gevonden l				= name "elementen worden gevonden" 
											(ForEach l (\x -> let i = l??x in 0 <= i && i < length l && l!!i == x))

niet_elementen_worden_niet_gevonden		:: Int [Int] -> Property
niet_elementen_worden_niet_gevonden m l	= name "niet-elementen worden niet gevonden"
											(not (isMember m l)) ==> l??m == -1
