implementation module BoggleWoorden

import StdEnv
import Woordenlijst

:: Bord         :== [[Char]]
:: Woordenlijst :== [String]

Start :: Woordenlijst
Start = boggles bord woordenlijst

boggles :: Bord Woordenlijst -> Woordenlijst
boggles bord woorden
	= []

bord :: Bord
bord = [['IEFK']
       ,['BGHW']
       ,['AGAX']
       ,['EELP']
       ]
