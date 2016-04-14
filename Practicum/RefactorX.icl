implementation module RefactorX

import StdEnv

Start				= map toString [E1,E2,E3,E4,E5]

E1					= OP (LET "x" (OP (NR 42) MIN (NR 3)) (OP (VAR "x") DIV (NR 0))) PLUS (LET "y" (NR 6) (OP (VAR "y") MUL (VAR "y")))
E2					= LET "x" (NR 42) (OP (VAR "x") PLUS (LET "x" (NR 58) (VAR "x")))
E3					= LET "x" (NR 1) (LET "y" (NR 2) (LET "x" (NR 3) (NR 4)))
E4					= LET "x" (NR 1) (OP (VAR "x") PLUS (VAR "y"))
E5					= OP (LET "x" (NR 1) (VAR "x")) MUL (VAR "x")

::	Expr			= NR   Int
					| VAR  Name
					| OP   Expr Operator Expr
					| LET  Name     Expr Expr
::	Name			:== String
::	Operator		= PLUS | MIN | MUL | DIV
::	Val				= Result Int | Undef

//  expressies afdrukken:
instance toString Expr where
	toString ...

//	vrije variabelen:
free				:: Expr -> [Name]

//	verwijder deelexpressies met ongebruikte let-variabelen:
remove_unused_lets	:: Expr -> Expr

//	evaluator met tabel van naam-waarde paren:
eval				:: Expr -> Val
