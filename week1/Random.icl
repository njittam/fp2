implementation module Random

import StdFile, StdList, StdMisc, StdArray, Random

:: RandomSeed :== Int

nullRandomSeed :: RandomSeed
nullRandomSeed = 0

getNewRandomSeed :: !*env -> (!RandomSeed, !*env) | FileSystem env
getNewRandomSeed env
# (ok, src, env) = sfopen "/dev/urandom" FReadData env
| not ok => abort "could not open /dev/urandom"
# (bytes, src)   = sfreads src 4
  seed           = foldl (\x y->(x<<8)+toInt y) 0 [c \\ c<-:bytes]
| otherwise => (seed, env)

random :: !RandomSeed -> .(!Int, !RandomSeed)
random seed = (seed>>16 bitand 0xFFFF, seed*0x08088405+1)

