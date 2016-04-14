implementation module Frequentielijst

import StdEnv, FrequentielijstGUI

// Zonder GUI:
Start       = lijst
// Met GUI:
Start world = toonFrequentielijst lijst world

lijst       = sort (frequentielijst tekst)
tekst       = ['Hello world! Here I am!']


frequentielijst :: [a] -> [(a,Int)] | == a
frequentielijst ...
