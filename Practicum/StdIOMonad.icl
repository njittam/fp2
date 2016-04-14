implementation module StdIOMonad

//	Deze module verpakt StdFile in een monadische jas

import StdFile
import StdMonad

:: IO a			// kies een geschikte representatie voor IO
:: Filemode		= Lees | Schrijf
:: Filenaam	  :== String
:: Filehandle	// kies een geschikte representatie voor Filehandle

instance toInt Filemode where
	toInt Lees						= FReadText
	toInt Schrijf					= FWriteText
