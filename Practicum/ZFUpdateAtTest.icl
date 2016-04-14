module ZFUpdateAtTest

/*	Test module ZFUpdateAt
	Voor werken met Gast:
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only'
*/
import gast
import ZFUpdateAt

Start
										= testn 1000
											(\m n x ->
											    let l = [1 .. n bitand 0xFF] in
											    identiek_aan_updateAt m l x /\
											    True
											)

identiek_aan_updateAt					:: Int [Int] Int -> Property
identiek_aan_updateAt m l x				= name "identiek aan updateAt" 
											(updateAt m x l == updateAt2 m x l)
											     /\
											(ForEach [1 .. length l] (\i -> updateAt i x l == updateAt2 i x l))
