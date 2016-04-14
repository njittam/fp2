implementation module WF

import StdEnv, Woordfrequentie, SimpleFileIO
import FrequentielijstGUI

Start :: *World -> *World
Start world
# (fl,world) = wf "WF.icl" world
= toonFrequentielijst2 fl world

wf :: String *env -> ([(String,Int)],*env) | FileSystem env
wf ...
