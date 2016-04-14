implementation module LijstGenerator

import StdEnv

allemaal                 :: // meest algemene type
allemaal x               = ...

vanaf                    :: // meest algemene type
vanaf x                  = ...

vanaf_met_stap           :: // meest algemene type
vanaf_met_stap x z       = ...

vanaf_tot                :: // meest algemene type
vanaf_tot x y            = ...

vanaf_tot_met_stap       :: // meest algemene type
vanaf_tot_met_stap x y z = ...

Start                    = ( take 10 (allemaal 'H')
                           , '\n'
                           , take 26 (vanaf 'a')
                           , '\n'
                           , take 10 (vanaf_met_stap 0 -2)
                           , '\n'
                           , vanaf_tot 0 10
                           , '\n'
                           , vanaf_tot_met_stap 0 -10 -2
                           )
