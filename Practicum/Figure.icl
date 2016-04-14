implementation module Figure

/** Example library to demonstrate the use of Existential Types.
    The library implements a simple set of drawing objects.
    
    Author:  Peter Achten
    Version: April 14 2008
*/
import StdEnv, StdIO

::  Figure					= E.s: 
				              { data :: s
				              , impl :: FigureI s 
				              }
::  FigureI s				= { show :: s -> *Picture -> *Picture
				              , move :: Vector2 s -> s
				              }

//  drawFigure f creates a window in which f is displayed
drawFigure					:: Figure -> *World -> *World
drawFigure figure	    	= startIO SDI Void initGUI [ProcessClose closeProcess]
where
    initGUI					:: (PSt .ps) -> PSt .ps
    initGUI pSt
        # (niceFont,pSt)	= accPIO (accScreenPicture (openFont {SerifFontDef & fSize=36} `bind` \(_,f) -> return f)) pSt
        # wDef          	= Window "Figure" NilLS 
	                            [ WindowClose    (noLS closeProcess)
	                            , WindowLook     True (look figure)
	                            , WindowPen      [PenFont niceFont]
	                            , WindowViewSize maxFixedWindowSize
	                            ]
        = snd (openWindow undef wDef pSt)
    where
        look				:: Figure SelectState UpdateState -> *Picture -> *Picture
        look figure _ updSt	= show figure o unfill updSt.newFrame

//  Lifting methods to functions:
show						:: Figure *Picture -> *Picture
show {data,impl} picture	= impl.show data picture

move						:: Vector2 Figure -> Figure
move v fig=:{data,impl}		= {fig & data=impl.move v data}

//  General Figure constructor function:
mkFigure					:: s (FigureI s) -> Figure
mkFigure data impl			= { data=data, impl=impl }

//  Specialized Figure constructor functions:
//  mkFigures figs combines all figs in left-to-right order
mkFigures					:: [Figure] -> Figure
mkFigures figs				= mkFigure figs
			                           { show = flip (foldl (flip show))
			                           , move = \vector -> map (move vector)
			                           }

//  line a b draws a line from a to b
line						:: Point2 Point2 -> Figure
line a b					= mkFigure (a,b) 
					                   { show = \(a,b) = drawLine a b
					                   , move = \v (a,b) = (movePoint v a,movePoint v b)
					                   }

//  rectangle a b forms a rectangle with diagonal-points a and b
rectangle					:: Point2 Point2 -> Figure
rectangle a b				= mkFigure {corner1=a,corner2=b}
				                       { show = \r   = draw r
				                       , move = \v r = {corner1=movePoint v r.corner1,corner2=movePoint v r.corner2}
				                       }

//  ellips a b forms an ellips that fits in the rectangle with diagonal-points a and b
ellips						:: Point2 Point2 -> Figure
ellips a b					= mkFigure {corner1=a,corner2=b}
				                       { show = \r   = let (pos,oval) = toOval r in drawAt pos oval
				                       , move = \v r = {corner1=movePoint v r.corner1,corner2=movePoint v r.corner2}
				                       }
where
    toOval					:: Rectangle -> (Point2,Oval)
    toOval {corner1,corner2}= ({x=cx,y=cy},{oval_rx=abs rx,oval_ry=abs ry})
    where
        (rx,ry)				= ((corner2.x-corner1.x)/2,(corner2.y-corner1.y)/2)
        (cx,cy)				= (corner1.x+rx,corner1.y+ry)

//  text t a shows a text t with left-top corner at a
text						:: String Point2 -> Figure
text line pos				= mkFigure (pos,line)
				                       { show = \(pos,line) = getPenFontMetrics `bind` \fMetrics -> 
				                                              drawAt {pos & y=pos.y+fMetrics.fAscent+fMetrics.fLeading} line
				                       , move = \v (pos,line) = (movePoint v pos,line)
				                       }
