implementation module VectorOverloading

import StdEnv

:: Vector2 a = {x0 :: a, x1 :: a}

instance ==   (Vector2 a) | == a   where // maak instantie af
instance zero (Vector2 a) | zero a where // maak instantie af
instance one  (Vector2 a) | one a  where // maak instantie af
instance ~    (Vector2 a) | ~ a    where // maak instantie af
instance +    (Vector2 a) | + a    where // maak instantie af
instance -    (Vector2 a) | - a    where // maak instantie af
instance *    (Vector2 a) | * a    where // maak instantie af
instance /    (Vector2 a) | / a    where // maak instantie af
