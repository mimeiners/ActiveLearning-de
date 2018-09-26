Spannungsteilung
================


Zielsetzung
-----------
Das Ziel dieser Labortätigkeit ist es, die Spannungsteilung zu überprüfen Eigenschaften von Widerstandsnetzwerken.


Notizen
-------
In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch wenn es um die Anschlüsse an die Red Pitaya STEMlab-Karte geht Hardware. Die als 5V-Spannungsquelle verwendeten Verlängerungsstecker-Pins sind dargestellt in der Dokumentation hier. 


Hintergrund
-----------
Die Spannungsteilung ermöglicht es uns, die Aufgabe der Analyse einer
Schaltkreis. Die Spannungsteilung ermöglicht es uns, zu berechnen, welcher Anteil des Gesamtspannung über einer Reihe von Widerständen wird über eine Reihe von Widerständen abgefallen einen einzigen Widerstand. Für die Schaltung von Figur 1 ist die Spannungsteilung Formeln sind:

.. math::

	V_1 = V_S \frac{R_1}{R_1 + R_2}

	V_2 = V_S \frac{R_2}{R_1 + R_2}

	
.. figure:: img/Activity_03_Fig_01.png
   
   Abbildung 1: Spannungsteilung.

   
Materialien
-----------
- Rote Pitaya STEMlab 125-14 oder STEMlab 125-10 

- Verschiedene Widerstände:
  
  - :math:`470 \Omega`, 
    
  - :math:`1 k\Omega`, 

  - :math:`4,7 k\Omega`,

  - :math:`1,5 k\Omega`.


Vorgehensweise
--------------

a) Konstruieren Sie die Schaltung wie in Abb. 1 dargestellt. Setzen Sie    :math:`R_1 = 4.7 k\Omega`, :math:`R_2 = 1,5 k\Omega` und verwenden Sie das feste Netzteil 5 V-Pin vom Erweiterungsstecker als Spannungsquelle V\ :sub:`s`\. Verwenden Sie die Oszilloskopanwendung, um die Spannungen V\ zu messen. :sub:`1`\ und V\ :sub:`2`\ Wiederholen Sie diesen Schritt für R\ :sub:`1`\ = R\ :sub:`2`\ = :math:`4.7 k\Omega` und notiere die Messungen. 

b) Berechnen Sie die Spannungen V\ :sub:`1`\ und V\ :sub:`2`\unter Verwendung von Die Gl. (1) und (2) jeweils.

c) Vergleichen Sie die Ergebnisse der Schritte a und 1.






































