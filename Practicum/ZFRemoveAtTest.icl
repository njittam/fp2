module ZFRemoveAtTest

/*	Test module ZFRemoveAt
	Voor werken met Gast:
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/
import gast
import ZFRemoveAt

Start
							= testn 1000
								(\m n ->
								    let l = [1 .. (n>>20)] in
								    identiek_aan_removeAt m l /\
								    True
								)

identiek_aan_removeAt		:: Int [Int] -> Property
identiek_aan_removeAt m l	= name "identiek aan removeAt" 
								(removeAt m l == removeAt2 m l)
								     /\
								(ForEach [1..length l] (\i -> removeAt i l == removeAt2 i l))
