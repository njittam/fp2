implementation module Map

import BinTree		// voor het type Tree en voorbeelden t0 t/m t7
import Maybe        // voor het type Maybe
import StdList      // voor de standaard map functie

class Map c :: ...            // maak deze type constructor class af

instance Map []    where ...  // maak deze instance af
instance Map Maybe where ...  // maak deze instance af
instance Map Tree  where ...  // maak deze instance af

// voorgegeven functie, specifiek voor Maybe:
mapMaybe 		        :: (a -> b) (Maybe a) -> Maybe b
mapMaybe f Nothing	    = Nothing
mapMaybe f (Just x)	    = Just (f x)

// voorgegeven functie, specifiek voor Tree:
mapTree 			    :: (a -> b) (Tree a) -> Tree b
mapTree f Leaf		    = Leaf
mapTree f (Node x l r)	= Node (f x) (mapTree f l) (mapTree f r)
