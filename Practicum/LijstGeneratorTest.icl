module LijstGeneratorTest

/*	Test module LijstGenerator
	Voor werken met Gast: 
		(*) gebruik Environment 'Gast'
		(*) zet Project Options op 'Basic Values Only' en '2M' Maximum Heap Size
*/

import gast
import LijstGenerator

Start
												= testn 1000
													(\x y z ->
													   eersten_gelijk                           x     /\
													   vanaf_verhoogt_met_one                   x     /\
													   vanaf_met_stap_verhoogt_met_stap         x y   /\
													   vanaf_tot_verhoogt_met_one               x y   /\
													   vanaf_tot_met_stap_verhoogt_met_stap     x y z /\
													   vanaf_tot_met_stap_0_is_leeg             x y   /\
													   True
													)

max_list_length									= 1000

eersten_gelijk									:: Int -> Property
eersten_gelijk x								= name "eersten in lijst zijn gelijk"
											       (let l` = take max_list_length (allemaal x) 
											            n  = length l`
											         in n == max_list_length && all ((==) x) l`
											       )

vanaf_verhoogt_met_one							:: Int -> Property
vanaf_verhoogt_met_one x						= name "vanaf verhoogt met one"
										           (let l` = take max_list_length (vanaf x) 
											            n  = length l`
										             in n == max_list_length && all ((==) one) (verschil l`)
										           )

vanaf_met_stap_verhoogt_met_stap				:: Int Int -> Property
vanaf_met_stap_verhoogt_met_stap x y			= name "vanaf_met_stap verhoogt met stap"
										           (let l` = take max_list_length (vanaf_met_stap x y) 
											            n  = length l`
										             in n == max_list_length && all ((==) y) (verschil l`)
										           )

vanaf_tot_verhoogt_met_one						:: Int Int -> Property
vanaf_tot_verhoogt_met_one x y					= name "vanaf_tot verhoogt met one"
										           (let l` = take max_list_length (vanaf_tot x y)
										                n  = length l`
										             in if (x > y) (n == 0) (all ((==) one) (verschil l`))
										           )

vanaf_tot_met_stap_verhoogt_met_stap			:: Int Int Int -> Property
vanaf_tot_met_stap_verhoogt_met_stap x y z	= name "vanaf_tot_met_stap verhoogt met stap"
										           (ok ==> let l` = take max_list_length (vanaf_tot_met_stap x y z)
										                       n  = length l`
										                    in if (x <= y && z > 0) (all ((==) z) (verschil l`))
										                      (if (x >= y && z < 0) (all ((==) z) (verschil l`))
										                                            (n == 0)
										                      )
										           )
	where ok = z <> 0
	             && 
	           all (\x->x <> abs x || x==0) [abs x, abs y, abs z]

vanaf_tot_met_stap_0_is_leeg					:: Int Int -> Property
vanaf_tot_met_stap_0_is_leeg x y 				= name "vanaf_tot_met stap 0 is leeg"
										           (isEmpty (vanaf_tot_met_stap x y 0))

verschil										:: [a] -> [a] | - a
verschil [a,b:as]								= [b-a : verschil [b:as]]
verschil _										= []
