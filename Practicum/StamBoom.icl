implementation module StamBoom

import StdEnv, GenTree

Start							= 0

::  FamilyTree					:== GenTree Couple Single
::  Couple						  = Couple Person Person
::  Single						  = Single Person
::  Person						  = Person DateOfBirth Gender String
::  Gender						  = Male | Female
::  DateOfBirth					  = DoB Year Month Day
::  Year						:== Int
::  Month						:== Int
::  Day							:== Int


okFamilyTree					:: FamilyTree -> Bool
okFamilyTree ...

rootAncestor					:: FamilyTree -> Person
rootAncestor ...

inFamilyTree					:: Person FamilyTree -> Bool
inFamilyTree ...

marry							:: Person Person FamilyTree -> FamilyTree
marry ...

addChild						:: Person Couple FamilyTree -> FamilyTree
addChild ...

children						:: Person FamilyTree -> [Person]
children ...

offspring						:: Person FamilyTree -> [Person]
offspring ...
