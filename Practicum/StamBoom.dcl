definition module StamBoom

import GenTree

::  FamilyTree	:== GenTree Couple Single
::  Couple		  = Couple Person Person
::  Single		  = Single Person
::  Person		  = Person DateOfBirth Gender String
::  Gender		  = Male | Female
::  DateOfBirth	  = DoB Year Month Day
::  Year		:== Int
::  Month		:== Int
::  Day			:== Int

instance <  DateOfBirth
instance == DateOfBirth
instance == Couple
instance == Person
instance == Gender

okFamilyTree	::               FamilyTree -> Bool
rootAncestor	::               FamilyTree -> Person
inFamilyTree	:: Person        FamilyTree -> Bool
marry			:: Person Person FamilyTree -> FamilyTree
addChild		:: Person Couple FamilyTree -> FamilyTree
children		:: Person        FamilyTree -> [Person]
offspring		:: Person        FamilyTree -> [Person]
