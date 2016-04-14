implementation module Kogelbaan

import StdEnv

:: T :== Real       // T staat voor tijd (s). 
:: V :== Real       // R staat voor snelheid (m/s).
:: A :== Real       // A staat voor hoek (radialen).
:: G :== Real       // G staat voor valversnelling (m/s^2).
:: D :== Real       // M staat voor afstand (m).

// De valversnelling g is een 'echte' constante:
g                   :: G
g                   = 9.81

// De gevraagde functies:
v_x                 :: // geef type van v_x
v_x                 =  // geef functievoorschrift van v_x

v_y                 :: // geef type van v_y
v_y                 =  // geef functievoorschrift van v_y

x_at                :: // geef type van x_at
x_at                =  // geef functievoorschrift van x_at

y_at                :: // geef type van y_at
y_at                =  // geef functievoorschrift van y_at

h                   :: // geef type van h
h                   =  // geef functievoorschrift van h

// Het bepalen van de beste hoek uit {0.01*pi, 0.02*pi .. 0.5*pi}:
Start               = beste_hoek 5.0

pi                  = 3.1415926

beste_hoek          :: V -> ...
beste_hoek v_0      = 
