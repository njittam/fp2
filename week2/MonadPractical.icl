module MonadPractical
import StdEnv


//s4446402 s443697
// Mattijn Kreuzen David van  't wout
/// §1: The Monad Class and its Laws ///////////////////////////////////////////

class Monad m where
  pure           :: a -> m a
  (>>=) infixl 1 :: (m a) (a -> m b) -> m b

/// Left identity:
///   pure a >>= \x -> f x == f a
/// Right identity:
///   m >>= \x -> pure x == m
/// Associativity:
///   (m >>= \x -> f x) >>= \y -> g y == m >>= (\x -> (f x >>= \y -> g y))



/// §2: The Maybe monad ////////////////////////////////////////////////////////

:: Maybe a = Nothing | Just a

instance Monad Maybe where
  (>>=) Nothing  _    = Nothing
  (>>=) (Just x) next = next x

  pure x = Just x

/// §2.1: Safe division

divide :: Real Real -> Maybe Real
divide x y
  | y == 0.0  = Nothing
  | otherwise = Just (x / y)

/// §2.2: Music facts

allFacts :: [(String, String)]
allFacts =  [ ("Best singer",      "Ronnie James Dio")
            , ("Ronnie James Dio", "Dio")
            , ("Dio",              "Holy Diver") ]

lookup :: String [(String, String)] -> Maybe String
lookup key []   = Nothing
lookup key [(key`, value) : rest]
  | key` == key = Just value
  | otherwise   = lookup key rest

bestAlbum :: String -> Maybe String
bestAlbum category = lookup category allFacts
     >>= \answer1 -> lookup answer1  allFacts
     >>= \answer2 -> lookup answer2  allFacts

/// §2.3: Fitting the laws



/// §3: The Either monad ///////////////////////////////////////////////////////

:: Either e a = Left e | Right a

/// Person parser

:: Person  = {name :: String, age :: Int, gender :: Gender}
:: Gender  = Male | Female
:: Error :== String

parseAge :: String -> Either Error Int
parseAge ""              = Left "Nothing to parse as age"
parseAge str
  # x = toInt str
  | x == 0 && str <> "0" = Left (str +++ " is not a valid age")
  | otherwise            = Right x

parseGender :: String -> Either Error Gender
parseGender "m" = Right Male
parseGender "f" = Right Female
parseGender  _  = Left "Unknown gender"

parsePerson :: (String, String, String) -> Either Error Person
parsePerson (n, a, g) =
  case parseAge a of
    Left e    -> Left e
    Right age ->
      case parseGender g of
        Left e       -> Left e
        Right gender -> Right {name = n, age = age, gender = gender}



/// §4: The List monad /////////////////////////////////////////////////////////

/// Random Numbers

:: RandomSeed :== Int

newRandomSeed :: !*World -> *(!RandomSeed, !*World)
newRandomSeed world = (123456789, world) //time world

random :: !RandomSeed -> (!Int, !RandomSeed)
random seed = (newSeed, newSeed)
where
  newSeed = abs ((a * seed + c) rem m)
  m = 2147483648
  a = 6364136223846793005
  c = 1442695040888963407

/// Chess moves

:: Position :== (Int, Int)

moveKnight :: Position -> [Position]
moveKnight (x, y) = filter onBoard
  [ (x+2, y-1), (x+2, y+1), (x-2, y-1), (x-2, y+1)
  , (x+1, y-2), (x+1, y+2), (x-1, y-2), (x-1, y+2)
  ]

onBoard :: Position -> Bool
onBoard (x,y) = 0 < x && x < 9 &&
                0 < y && y < 9


/// §5: The State monad ////////////////////////////////////////////////////////

:: State s a = State (s -> (a, s))

eval :: (State s a) s -> a
eval (State f) s
  # (x, _) = f s
  = x

state :: (s -> (a, s)) -> State s a
state f = State f

/// Yahtzee
roll :: RandomSeed -> (Int, RandomSeed)
roll s
  # (x, seed) = random s
  = (x rem 6 + 1, seed)

isLargeStraight :: [Int] -> Bool
isLargeStraight dices = sorted == [1, 2, 3, 4, 5] ||
                        sorted == [2, 3, 4, 5, 6]
                        where sorted = sort dices

rollDices :: RandomSeed -> (Bool, RandomSeed)
rollDices seed
  # (d1, seed) = roll seed
  # (d2, seed) = roll seed
  # (d3, seed) = roll seed
  # (d4, seed) = roll seed
  # (d5, seed) = roll seed
  = (isLargeStraight [d1, d2, d3, d4, d5], seed)

multiply1c :: (Maybe a) a -> Maybe a | *a
multiply1c (Just x) b = pure (x * b)

//opdracht 2.1 
//a) (Just 14.0)
//b) Nothing
//c) Type error

//opdracht 2.2
//Start = (divide 42.0 3.0) >>= \result -> pure (result * 2.5)

//opdracht 2.3
//a)
//Start = bestAlbum "Best singer"
//(Just "holy driver")

//b)
//Start = bestAlbum "Ronnie James Dio"
//Nothing

//opdracht 2.4

// opdracht 3.1
instance Monad (Either e) where
 	(>>=) :: (Either e a) (a -> Either e b) -> Either e b
	(>>=) command next = case command of
		Left e  -> Left e
		Right a  -> next a
	pure :: a -> Either e a
	pure a = Right a

persons = [("Alice", "37", "f"), ("Bob", "2.5", "m"), ("Carol", "18", "o"), ("Dave", "", "f")]
pa = ("Alice", "37", "f")
// opdracht 3.2


//opdracht 3.3
//Start  
//  # mypersonparser = \(name, age, gender) -> parseAge age >>= \new_age -> parseGender gender >>= \new_gender -> pure {name = name, age = new_age, gender = new_gender}
//  # mymap = (\[x:t] -> [mypersonparser x: (\[x1:t1] -> [mypersonparser x1: (\[x2:t2] -> [mypersonparser x2: (\[x3:t3] -> [mypersonparser x3: []]) t2]) t1]) t])
//  = mymap persons

// opdracht 4.1
in3 :: Position -> [Position]
in3 pos = flatten (map moveKnight (flatten (map moveKnight (moveKnight pos))))
//Start = in3 (0,0)

:: List a = Nil | Cons a (List a)

//opdracht 4.2
instance Monad List where 
  (>>=) :: (List a) (a -> List b) -> (List b)
  (>>=) command next = case command  of 
    Nil -> Nil 
    Cons e f -> toList (flatten (map (new_next next) (fromList command)))
  pure :: a ->  (List a)
  pure a = Cons a (Nil)

new_next :: (a -> List b) -> (a -> [b])
new_next next = \x -> fromList (next x)

toList :: [a] -> List a
toList [] = Nil
toList [x:t] = Cons x (toList t)

fromList :: (List a) -> [a]
fromList l = case l of 
        Nil -> []
        Cons x (y) -> [x: fromList y]

moveKnight2 :: Position -> List Position
moveKnight2 pos = toList (moveKnight pos)

//opdracht 4.3
in32 :: Position -> List Position
in32 pos = (moveKnight2 pos)
 >>= moveKnight2
 >>= moveKnight2

Start = (in3 (0,0)) == (fromList (in32 (0,0)))
/*
instance Monad (State s) where
  (>>=) :: (State s a) (a -> State s b) -> State s b
  (>>=) command next = case command of 
    State f -> \state -> (next a) state
      where (a,s) = f state

  pure :: a -> State s a
  pure a = State (\state -> (a, state))
  */
  /* en nu kom ik op een error die zegt
  Type error [MonadPractical.icl,241,>>=]: near (let ... ) or # : cannot unify types:
 State v2 v1
 v15 -> v13
maar ik heb geen let of # in de buurt van regel 241
opdrachgt 5.2 kan ik niet testen*/
