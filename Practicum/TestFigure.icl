module TestFigure

/** Example library to demonstrate the use of Existential Types.
    The library implements a simple set of drawing objects.
    
    Create a new project. Set the Environment to "Object IO".
    Set "Project Options" to "No Console".
    
    Have fun.
    
    Peter Achten
    April 14 2008.
*/
import StdEnv, Figure

Start :: *World -> *World
Start world = drawFigure figure6 world

figure0     = mkFigures 
                [ rectangle a b
                , ellips    a b
                , text      "Hello" (movePoint {vx=(b.x-a.x)/5,vy=(b.y-a.y)/2} a)
                ]
where
    a       = {x=20, y=20 }
    b       = {x=180,y=180}

figure1     = mkFigures
                [ ellips a (movePoint {vx=r,vy=r} a) \\ r <- [10,20..400]]
where
    a       = {x=20,y=20}

figure2     = mkFigures
                [ text (toString c) {x=r,y=r} \\ c <- ['a'..'z'] & r <- [0,25..]]

figure3     = mkFigures [figure0,figure1,figure2]

figure4     = mkFigures 
                [  line c (movePoint {vx=toInt (r*(cos angle)),vy=toInt (r*(sin angle))} c) 
                \\ angle <- [0.0,2.0*PI/360.0..2.0*PI]
                ]
where
    c       = {x=200,y=200}
    r       = 180.0

figure5     = mkFigures 
                [  text (toString cc) (movePoint {vx=toInt (radius*(cos angle)),vy=toInt (radius*(sin angle))} c)
                \\ angle  <- [0.0,2.0*PI/(toReal nrchars)..2.0*PI] 
                 & cc     <- chars
                ]
where
    c       = {x=200,y=200}
    radius  = 180.0
    chars   = ['A'..'Z']
    nrchars	= length chars

figure5`    = mkFigures 
                [  mkFigures [pencolour colour, text (toString cc) (movePoint {vx=toInt (radius*(cos angle)),vy=toInt (radius*(sin angle))} c)]
                \\ angle  <- [0.0,2.0*PI/(toReal nrchars)..2.0*PI] 
                 & cc     <- chars
                 & colour <- [ RGB { r = begin.r + (eind.r-begin.r)*i/nrchars
                                   , g = begin.g + (eind.g-begin.g)*i/nrchars
                                   , b = begin.b + (eind.b-begin.b)*i/nrchars
                                   }
                             \\ i <- [1..nrchars]
                             ]
                ]
where
    c       = {x=200,y=200}
    radius  = 180.0
    chars   = ['A'..'Z']
    nrchars	= length chars
    begin	= {r=255, g= 20, b=200}
    eind	= {r=0,   g=234, b=100}

figure6		= mkFigures (
				[ pensize 3 ] ++
				[  move {vx=(edges-1)*(toInt (2.0 * radius)),vy=toInt (1.5 * radius)}
				   ( mkFigures [  line {x=toInt (cos ( i     *2.0*PI/(toReal edges))*radius), y=toInt (sin ( i     *2.0*PI/(toReal edges))*radius)}
				                       {x=toInt (cos ((i+1.0)*2.0*PI/(toReal edges))*radius), y=toInt (sin ((i+1.0)*2.0*PI/(toReal edges))*radius)}
				               \\ i <- map toReal [1..edges]
				               ]
				   )
				\\ edges <- [2..8]
				])
where
	radius	= 80.0
