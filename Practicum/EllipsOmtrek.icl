implementation module EllipsOmtrek

import StdEnv

Start    = ( perimeter pr (4.0,3.0)	// approximated perimeter of ellipse with radii 4.0 and 3.0
           , perimeter pr (4.0,4.0)	// approximated perimeter of circle with radius 4.0
           , 2.0 * pi * 4.0			// perimeter of circle with radius 4.0
           )
where pr = 0.0001

/*	perimeter precision (r1,r2) approximates the perimeter of an ellipse with radii r1 and r2 given
	the requested precision.
	All arguments must be positive Reals.
*/
perimeter :: Real (Real,Real) -> Real
perimeter precision (r1,r2) ...
