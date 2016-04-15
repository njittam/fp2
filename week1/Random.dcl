definition module Random

 // Random number generator voor Linux gebruikers
 // interface compatible met Random.dcl (helaas)
 // -- mschool@science.ru.nl

import StdFile

:: RandomSeed 

// nullRandomSeed generates a fixed RandomSeed
nullRandomSeed :: RandomSeed

// GetNewRandomSeed generates a good RandomSeed, using /dev/urandom
getNewRandomSeed :: !*env -> (!RandomSeed, !*env) | FileSystem env

// Given a RandomSeed, Random generates a random number and a new RandomSeed.
random :: !RandomSeed -> .(!Int, !RandomSeed)

