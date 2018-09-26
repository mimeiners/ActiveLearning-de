Impedanzmessung - Frequenzeffekte
=================================

Zielsetzung
-----------

Das Ziel dieser Aktivität ist:

1. Messen Sie die Impedanz und die Impedanz der Komponente mit der
   Impedanzanalysator-Anwendung.
   
2. Untersuchen Sie die Größen- und Phasenänderungen mit der
   Frequenzänderung für eine RLC-Schaltung.
   

Anmerkungen
_______

.. _hardware: http://redpitaya.readthedocs.io/en/latest/index.html
.. _Impedance: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _analyzer: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _LCR: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/lcr_meter/lcr_meter.html
.. _meter: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/lcr_meter/lcr_meter.html
.. _frontend: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/lcr_meter/lcr_meter.html

In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab-Board-Hardware beziehen.

Impedance_analysator_ Anwendung wird verwendet, um RLC-Schaltung
impedane zu messen :math:`Z (f)`. Neben Impedanzanalysator zur
Impedanzmessung

Wir haben ein LCR_ Meter_ Frontend_ verwendet. Obwohl das
LCR-Meter-Frontend bei der Verwendung von LCR-Meter-Anwendungen
vorgesehen ist, kann es auch für Impedance-Analyzer-Anwendungen
verwendet werden.

Die Impedanzanalysator-Anwendung ermöglicht Messungen von Impedanz,
Phase und anderen Parametern des ausgewählten DUT (Device Under
Test). Messungen können im Frequenz-Sweep-Modus mit 1 Hz
Frequenzauflösung oder im Sweep-Modus Messungen mit der gewünschten
Anzahl von Messungen bei konstanter Frequenz durchgeführt werden. Der
wählbare Frequenzbereich reicht von 1 Hz bis 60 MHz, obwohl der
empfohlene Frequenzbereich bis zu 1 MHz beträgt. Der Impedanzbereich
reicht von 0,1 Ohm bis 10 MOhm. Wenn Sie die
Impedanzanalysatoranwendung mit dem LCR-Erweiterungsmodul verwenden,
setzen Sie 0 in das Shunt-Widerstandsfeld ein.


Hintergrund
-----------

Die Impedanz ist der Widerstand gegen den Wechselstromfluss. Es ist
die totale Opposition, die eine Schaltung dem Stromfluss bei einer
bestimmten Frequenz bietet. Impedanz :math:`Z` wird als eine
Kombination aus Widerstand ausgedrückt :math:`R` und Reaktanz
:math:`X` und wird gemessen in :math:`\Omega`. Es kann als eine
 komplexe Menge ausgedrückt werden als:
      

.. math::
   Z = R + jX \ Quad (1)

Für einen idealen Widerstand ist die Impedanz die gleiche wie der
DC-Widerstand :math:`Z = R_ {DC}`. Bei einem Kondensator ist die
Impedanz (oder genauer gesagt die Reaktanz) :math:`X_C` ein imaginärer
und ** negativer ** reaktiver Teil der Impedanz. Die Reaktanz des
Kondensators hängt von der Frequenz ab und ist gegeben als:


.. math::
   X_C = \ frac {1} {j \ omega C} \ quad (2)

Bei einem Induktor ist die Impedanz (oder genauer gesagt die Reaktanz)
:math:`X_L` ein imaginärer und **positiver** reaktiver Teil der
Impedanz. Die Reaktanz des Induktors hängt auch von der Frequenz
ab und ist gegeben als:
      

.. math::
   X_L = j \ omega L \ quad (3)

Die Impedanz einer Reihen-RLC-Schaltung ist die Summe der Impedanzen
der jeweiligen Komponenten.


.. math::
   Z = R + Z_L + Z_C \ Vierer (4)

oder

.. math::
   Z = R + jX_L - jX_C \ quad (5)

Dies kann auch als ein Zeiger mit **Magnitude** dargestellt werden
:math:`|Z|` und **phase** :math:`P` wobei :math:`Z=|Z|e^{jP}`
      

.. math::
   | Z | = \ sqrt {R ^ 2 + (X_L - X_C) ^ 2} \ quad (6)

.. math::
   P = arctan (\ frac {(X_L - X_C)} {R}) \ quad (7)

.. figure:: img/ Activity_11_Fig_1.png

   Abbildung 1: Serie RLC-Schaltung.

   
Materialien
-----------

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10
- Widerstand Rs: 1 kΩ
- Kondensator Cs: 0,047 μF
- Induktor Ls: 22 mH

  
Verfahren
---------

Komponenten messen
---------------------

Mit LCR-Meter-Anwendung können wir Induktivität, Widerstand und
Kapazität unserer Elemente in der Schaltung bei ausgewählter Frequenz
messen. LCR-Meter können Ihnen helfen, jede Komponente separat zu
messen, um ihren Wert zu extrahieren, wenn sie auf der Verpackung
nicht sichtbar / lesbar ist: 

1. Starten Sie das LCR-Messgerät
   
2. Schließen Sie die gemessene Komponente an die LCR-Messsonden an
   
3. Wählen Sie in der LCR-Meter-Anwendung Messmodus / Parameter
   
4. Wählen Sie die Messfrequenz auf 1 kHz
   
5. Wiederholen Sie die obigen Schritte für Rs, Ls und Cs


.. figure:: img/ Activity_11_Fig_2.png

   Abbildung 2: LCR-Meter-Anwendung

   
.. note::
   Tatsächliche (gemessene) Werte der Komponenten Rs, Cs, Ls sind
   anders als markiert (Farbcode für Widerstand und gedruckte Werte an
   Induktor und Kondensator). Der Unterschied liegt an den Toleranzen
   der Komponentenwerte

   
Messreihe RLC-Schaltung Impedanz
--------------------------------

1. Richten Sie die Schaltung wie in Abbildung 1 und Abbildung 2 auf
   Ihrem lötfreien Steckbrett mit den Komponentenwerten Rs = 1 KΩ, Cs
   = 0,047 μF, Ls = 22 mH ein.
   

.. figure:: img/ Activity_11_Fig_3.png

   Abbildung 3: STEMlab mit LCR-Meter-Frontend und Serien-RLC-Schaltung

   
2. Starten Sie die Anwendung Impedanzanalysator.

.. note::
   Der Impedanzanalysator ist eine Gemeinschaftsanwendung und muss
   vom Application Marketplace (Basar) heruntergeladen werden. 
   Klicken Sie auf Application marketplace icon und wählen Sie
   Install for Impedance analyzer.
    

3. Starten Sie den Impedanzanalysator und:
    - unter ** Menü Messeinstellungen ** Anzahl der Schritte einstellen: 20
    - unter ** Frequenz-Sweep ** Legen Sie die Startfrequenz auf 1 kHz und die Endfrequenz auf 50 kHz fest
    - Wählen Sie ** Messung starten **

.. figure:: img/ Activity_11_Fig_4.png

Abbildung 4: Graph der Impedanz der RLC-Schaltungsimpedanz, die mit der Impedanzanalysatoranwendung aufgenommen wurde

4. Plot mesured Phase
    - unter **Grafikeinstellungen** für **Y-Achse** wählen **P [Grad]**

.. figure:: img/Activity_11_Fig_5.png

   Abbildung 5: Diagramm der Impedanz der RLC-Schaltung mit der Anwendung des Impedanzanalysators

.. note::
   Die Frequenz, bei der dies auftritt ** (Phase = 0) ** wird als Resonanzfrequenz bezeichnet.
   Bei Resonanzfrequenz ist die Gesamtreaktanz Null und die Schaltung ist rein ohmsch.

Zum

.. math::
   Z = R + j (X_L - X_C) \ Vierer (8)

Ob

.. math::
   X_L - X_C = 0 \ Viereck (9)

dann

.. math::
   Z = R \ Vierer (10)

Die Resonanzfrequenz kann mathematisch unter Verwendung der folgenden Gleichung abgeleitet werden:

.. math::
     f_0 = \ frac {1} {2 \ pi \ sqrt {LC}} \ quad (11)


Fragen
------

1. Berechne die Resonanzfrequenz fo für die Serie RLC unter Verwendung
   von Gleichung (11) und vergleiche sie mit dem gemessenen Wert. Wie
   groß ist der prozentuale Fehler zwischen den beiden?
   
2. Geben Sie Ihre Schlussfolgerungen aus den Beobachtungen in Schritt
   3 des Verfahrens.
   
3. Berechnen Sie die Größe und Phase für die Reihen-RLC-Schaltung,
   wenn die reaktive Komponente gleich der ohmschen Komponente ist.
   





























































































































































