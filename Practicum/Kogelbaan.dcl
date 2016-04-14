definition module Kogelbaan

:: T :== Real       // T staat voor tijd (s). 
:: V :== Real       // R staat voor snelheid (m/s).
:: A :== Real       // A staat voor hoek (radialen).
:: G :== Real       // G staat voor valversnelling (m/s^2).
:: D :== Real       // M staat voor afstand (m).

// De valversnelling g is een 'echte' constante:
g                   :: G

v_x                 :: // geef type van v_x
v_y                 :: // geef type van v_y
x_at                :: // geef type van x_at
y_at                :: // geef type van y_at
h                   :: // geef type van h

beste_hoek          :: V -> ...
