implementation module StdStringnum

import StdEnv
import Stringnum

:: Stringnum = Stringnum String

instance zero       Stringnum where // maak deze implementatie af
instance one        Stringnum where // maak deze implementatie af
instance <          Stringnum where // maak deze implementatie af
instance ==         Stringnum where // maak deze implementatie af
instance +          Stringnum where // maak deze implementatie af
instance -          Stringnum where // maak deze implementatie af
instance *          Stringnum where // maak deze implementatie af
instance /          Stringnum where // maak deze implementatie af
instance toString   Stringnum where // maak deze implementatie af
instance fromString Stringnum where // maak deze implementatie af
instance fromInt    Stringnum where // maak deze implementatie af
