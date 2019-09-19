Impedanzmessung - Frequenzeffekte
=================================

Zielsetzung
-----------

Das Ziel dieser Aktivität ist:

1. Messen Sie die Komponentenimpedanz und die Schaltungsimpedanz mit Hilfe der Impedanzanalysator-Applikation.
   
2. Untersuchen Sie die Größen- und Phasenänderungen mit der
   Frequenzänderung für eine RLC-Schaltung.
   

Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/index.html
.. _Impedanz: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _analysators: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _LCR: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/lcr_meter/lcr_meter.html
.. _Meter: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/lcr_meter/lcr_meter.html
.. _Frontend: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/lcr_meter/lcr_meter.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht. Die Anwendung des Impedanz_  analysators_ dient zur Messung der RLC-Schaltungsimpedanz :math:`Z(f)`. Neben der Impedanzanalysator-Anwendung zur Impedanzmessung haben wir ein LCR_ Meter_ Frontend_ eingesetzt. Obwohl das Frontend für LCR-Meter bei der Verwendung der LCR-Meteranwendung vorgesehen ist, kann es auch für die Anwendung des Impedanzanalysators verwendet werden. Die Anwendung Impedanzanalysator ermöglicht Messungen der Impedanz, Phase und anderer Parameter des ausgewählten Prüflings (Device Under Test). Messungen können im Frequenzsweep-Modus mit 1Hz Frequenzauflösung oder im Messsweep-Modus mit der gewünschten Anzahl von Messungen bei konstanter Frequenz durchgeführt werden. Der wählbare Frequenzbereich liegt zwischen 1 Hz und 60 MHz, obwohl der empfohlene Frequenzbereich bis zu 1 MHz beträgt. Der Impedanzbereich liegt zwischen 0.1 Ohm und 10 MOhm. Wenn Sie die Impedanzanalysator-Anwendung mit dem LCR-Erweiterungsmodul verwenden, fügen Sie 0 in das Feld Shuntwiderstand ein.


Hintergrund
-----------

Die Impedanz ist ein Widerstand des Wechselstroms. Es ist
die totale Widerwirkung, die eine Schaltung dem Stromfluss bei einer
bestimmten Frequenz bietet. Impedanz :math:`Z` wird als eine
Kombination aus Widerstand :math:`R` und Reaktanz :math:`X` ausgedrückt und
wird in :math:`\Omega` gemessen. Es kann als eine komplexe Größe ausgedrückt werden:


.. math::  Z = R + jX
   :label: 11_eq_1

Bei einem idealen Widerstand ist die Impedanz gleich dem Gleichstromwiderstand :math:`Z = R_ {DC}`.
Bei einem Kondensator ist die Impedanz (oder genauer gesagt die Reaktanz) :math:`X_C` der imaginäre
und **negativ** -reaktive Teil der Impedanz. Die Reaktanz des
Kondensators hängt von der Frequenz ab und ist gegeben als:


.. math:: X_C = \frac{1}{j \omega C}
   :label: 11_eq_2
	   
Bei einer Induktivität ist die Impedanz (oder genauer gesagt die Reaktanz)
:math:`X_L` der imaginäre und **positiv** -reaktive Teil der
Impedanz. Die Reaktanz der Induktivität hängt auch von der Frequenz
ab und ist gegeben als:
      

.. math:: X_L = j \omega L
   :label: 11_eq_3

Die Impedanz einer RLC-Reihenschaltung ist die Summe der Impedanzen
der jeweiligen Komponenten.


.. math:: Z = R + Z_L + Z_C
   :label: 11_eq_4

oder

.. math:: Z = R + jX_L - jX_C
   :label: 11_eq_5

Dies kann auch mit Hilfe eines komplexen Zeigers, mit der Größe :math:`|Z|`
und **phase** :math:`P` dargestellt werden, wobei :math:`Z=|Z|e^{jP}`
      

.. math:: \lvert Z \lvert = \sqrt{R ^ 2 + (X_L - X_C) ^ 2}
   :label: 11_eq_6

.. math:: P = \arctan\left(\frac{(X_L - X_C)}{R}\right)
   :label: 11_eq_7



.. _11_fig_01:
.. figure:: img/ Activity_11_Fig_01.png

   RLC-Reihenschaltung.

   
Materialien
-----------

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10
- Widerstand Rs: 1 k:math:`Omega`
- Kondensator Cs: 0,047 :math:`mu`F
- Induktor Ls: 22 mH

  
Verfahren
---------

Mit LCR-Meter-Anwendung können wir Induktivität, Widerstand und
Kapazität unserer Elemente in der Schaltung bei ausgewählter Frequenz
messen. LCR-Meter kann Ihnen helfen, jede Komponente einzeln zu
messen, um ihren Wert zu extrahieren, wenn sie auf der Verpackung
nicht sichtbar / lesbar ist: 

1. Starten Sie das LCR-Messgerät
   
2. Schließen Sie die zu messenede Komponente an die LCR-Messsonden an
   
3. Wählen Sie in der LCR-Meter-Anwendung Messmodus/Parameter
   
4. Stellen Sie die Messfrequenz auf 1 kHz ein
   
5. Wiederholen Sie die obigen Schritte für Rs, Ls und Cs


.. _11_fig_02:
.. figure:: img/ Activity_11_Fig_02.png

   LCR-Meter-Anwendung

   
   
.. note:: Tatsächliche (gemessene) Werte der Komponenten Rs, Cs, Ls sind
	  anders als markiert (Farbcode für Widerstand und gedruckte Werte an
	  Induktor und Kondensator). Der Unterschied liegt an den Toleranzen
	  der Komponentenwerte

   
Messreihe RLC-Schaltung Impedanz
--------------------------------

1. Bauen Sie die Schaltung wie in :numref:`11_fig_01` und :numref:`11_fig_02` auf
   Ihrem lötfreien Steckbrett mit den Komponentenwerten Rs = 1 K:math:`Omega`, Cs
   = 0,047 :math:`mu`F, Ls = 22 mH auf.
   

   .. _11_fig_03:
   .. figure:: img/ Activity_11_Fig_03.png

      STEMlab mit LCR-Meter-Frontend und Serien-RLC-Schaltung

   
2. Starten Sie die Anwendung Impedanzanalysator.

   .. note:: Der Impedanzanalysator ist eine Gemeinschaftsanwendung und muss
	     vom Application Marketplace (Basar) heruntergeladen werden. 
	     Klicken Sie auf Application-Marketplace-Icon und wählen Sie
	     Install for Impedance analyzer.
    

3. Starten Sie den Impedanzanalysator und:
    - unter **Menü Messeinstellungen** Anzahl der Schritte einstellen: 20
    - unter **Frequenz-Sweep** legen Sie die Startfrequenz auf 1 kHz und die Endfrequenz auf 50 kHz fest
    - Wählen Sie **Messung starten**

      .. _11_fig_04:
      .. figure:: img/ Activity_11_Fig_04.png

	 Graph der Impedanz der RLC-Schaltungsimpedanz, die mit der Impedanzanalysatoranwendung aufgenommen wurde
      

4. Ploten gemessener Phase
   - unter **Plot settings Menu** für **Y-Achse**  **P [deg]** wählen
   
     .. _11_fig_05:
     .. figure:: img/Activity_11_Fig_05.png

	Diagramm der Impedanz der RLC-Schaltung mit der Anwendung des Impedanzanalysators

   
   .. note:: Die Frequenz, bei der dies auftritt **(Phase = 0)**
	     wird als Resonanzfrequenz bezeichnet.
	     Bei Resonanzfrequenz ist die Gesamtreaktanz Null und die
	     Schaltung ist rein ohmscher Natur.
	     
   Also

   .. math:: Z = R + j(X_L - X_C)
      :label: 11_eq_8

   Wenn

   .. math:: X_L - X_C = 0
      :label: 11_eq_9

   dann

   .. math:: Z = R
      :label: 11_eq_10
	   

   Die Resonanzfrequenz kann mathematisch unter Verwendung der
   folgenden Gleichung abgeleitet werden:
   

   .. math:: f_0 = \frac{1}{2 \pi \sqrt {LC}}
      :label: 11_eq_11


Fragen
------

1. Berechne die Resonanzfrequenz :math:`f_{o}` für die Serie RLC unter Verwendung
   von Gl. :eq:`11_eq_11` und vergleiche sie mit dem gemessenen Wert. Wie
   groß ist der prozentuale Fehler zwischen den beiden?
   
2. Geben Sie Ihre Schlussfolgerungen aus den Beobachtungen in Schritt
   3 des Verfahrens.
   
3. Berechnen Sie die Größe und Phase für die Reihen-RLC-Schaltung,
   wenn die reaktive Komponente gleich der ohmschen Komponente ist.
   

























































































































































