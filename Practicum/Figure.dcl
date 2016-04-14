definition module Figure

/** Example library to demonstrate the use of Existential Types.
    The library implements a simple set of drawing objects.
    
    Author:  Peter Achten
    Version: April 14 2008
*/
import StdPicture

::  Figure

//  drawFigure f creates a window in which f is displayed
drawFigure      ::          Figure -> *World -> *World

//  convenient lifting operations on the methods of a figure to the figure self
move            :: Vector2  Figure -> Figure

//  Specialized Figure constructor functions:
//  mkFigures figs combines all figs in left-to-right order
mkFigures       :: [Figure]      -> Figure

//  line a b draws a line from a to b
line            :: Point2 Point2 -> Figure

//  rectangle a b forms a rectangle with diagonal-points a and b
rectangle       :: Point2 Point2 -> Figure

//  ellips a b forms an ellips that fits in the rectangle with diagonal-points a and b
ellips          :: Point2 Point2 -> Figure

//  text t a shows a text t with left-top corner at a
text            :: String Point2 -> Figure
