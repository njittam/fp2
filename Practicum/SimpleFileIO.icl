implementation module SimpleFileIO

import StdBool, StdFile, StdList, StdMaybe

// 1.
readFile :: String *env -> (Maybe String,*env) | FileSystem env
readFile ...

writeFile :: String String *env -> (Bool,*env) | FileSystem env
writeFile ...

// 2.
readLines :: String *env -> (Maybe [String],*env) | FileSystem env
readLines ...

writeLines :: String [String] *env -> (Bool,*env) | FileSystem env
writeLines ...

// 3.
mapFile :: String String (a -> b) *env -> (Bool,*env) | FileSystem env & ... a & ... b
mapFile ...
