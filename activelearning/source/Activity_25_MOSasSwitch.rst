MOSFET-Transistor als Schalter
==============================

Zielsetzung
-----------

Ein MOS FET (NMOS) Bauelement kann in vielen Schaltungskonfigurationen wie Verstärker,
Oszillator, Filter, Gleichrichter oder einfach als Ein-/Ausschalter verwendet werden.
Wenn der FET in den Sättigungsbereich vorgespannt ist, arbeitet er als Verstärker oder
eine andere lineare Schaltung, wenn er abwechselnd im linearen (Trioden-)Bereich und im
Trennbereich vorgespannt ist, dann wird er als Schalter verwendet, der den Strom in anderen
Teilen der Schaltung fließen lässt oder nicht. Diese Übung beschreibt den NMOS-Transistor,
wenn es als Schalter betrieben wird.


Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Signalgeneratoranwendung: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _simple: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _rectifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf
.. _invertierenden: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
.. _ZVN211: http://www.redrok.com/MOSFET_ZVN2110A_100V_320mA_4O_Vth2.4_TO-92_ELine.pdf


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab - Board - Hardware_ beziehen.

Oszilloskope & Signalgeneratoranwendung_ wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet.

Die für die Spannungsversorgung **+5V**, **-3.3V** und **+3.3V**
verwendeten Steckerstifte sind in der Dokumentation_ aufgeführt.


.. note::
   Red Pitaya STEMlab-Ausgänge können Spannungssignale mit einem
   maximalen Ausgangsbereich von +/- 1V (2Vpp) erzeugen. Für dieses
   Experiment werden höhere Signalamplituden benötigt, um den
   NMOS-Transistor "einzuschalten" (:math:`V_ {TH}` - Spannung ). Aus
   diesem Grund werden wir einen OP484_ in der invertierenden_
   Konfiguration verwenden, um die Signalverstärkung von OUT1 / OUT2
   zu ermöglichen und einen Spannungshub von +4,7V bis -3,2V zu
   erreichen. Ein OP484 wird von STEMlab mit :math:`+5\,V` und :math:`-3.3\,V`
   Spannung über die Spannungsschienen versorgt. Der Verstärkungsfaktor des invertierenden
   Verstärkers wird auf :math:`\approx 5` gesetzt, wobei für :math:`R_1 = 2.2\,k\Omega`
   und :math:`R_f = 10\,k\Omega` eingesetzt werden. Versuchen Sie zu beantworten, warum wir
   einen OP484 verwendet haben, anstatt z.B. OP27 oder OP97. (Hinweis "Schiene zu Schiene").
   
   
Hintergrund
-----------

Schaltstromkreise unterscheiden sich deutlich von linearen Stromkreisen.
Sie sind auch leichter zu verstehen. Bevor wir komplexere Schaltkreise
untersuchen, beginnen wir mit der Einführung diskreter Halbleiter-Schaltkreise:
solche, die auf NMOS-Bauelementen aufbauen.

Ein Schalter besteht aus einem NMOS-Transistor, der abwechselnd zwischen Durchlass-
und Trennbereich angesteuert wird. Eine einfache Version des Schalters ist in :numref:`25_fig_01`
dargestellt. Wenn der Eingang gleich :math:`-V_{in}` ist, ist die Gate-Source-Spannung kleiner als
die Schwellenspannung (:math:`-V_{TH}`) oder nicht vorhanden, so dass kein Strom im Drain fließt.
Dies wird durch die in der :numref:`25_fig_01` dargestellte rote Belastungslinie veranschaulicht. Wenn das NMOS in
Abschaltung ist, hat die Schaltung (idealerweise) die folgenden Werte:

.. math::
   :label: 25_eq_01
  
   V_{DS} = V_{DD} \Quad \Text {und} \Quad I_D = 0 A \ Quad 

Dieser Zustand ist vergleichbar mit einem offenen Schalter. Wenn der Eingang
gleich :math:`V_{TH}` ist, wird der Transistor leitend und es treten die folgenden
Bedingungen auf:

.. math::
   :label: 25_eq_02

   V_{DS} \approx 0 \quad \ text {und} \ quad I_D = \ frac{V_{DD}}{R_D}A \quad

Dieser Zustand ist vergleichbar mit einem geschlossenen Schalter, der den unteren
Teil des :math:`R_D` mit der Masse verbindet.

.. figure:: img/ Activity_25_Fig_01.png
   :name: 25_fig_01
   :align: center

   NMOS-FET-Schalter und seine Ladeleitung

Die Eigenschaften eines Anreicherung Modus NMOS-Schalters gehen davon aus:

1. :math:`-V_{in}` ist niedrig genug, um den Transistor in
   Abschaltung zu treiben.
   
2. :math:`+ V_{in}` muss größer sein als :math:`V_{TH}` um den
   Transistor in Triodeden leitenden Zustand zu treiben
   
3. Der Transistor ist eine ideale Komponente. Diese Bedingungen können
   sichergestellt werden, indem die Schaltung so ausgelegt wird, dass:
   
   a. :math:`-V_{in} = V_{TH}`
      
   b. :math:`+ V_{in} = V_{TH}` (:math:`V_{DD}` ist ein gutes Maximum)
      
Bedingung 1 gewährleistet, dass die Schaltung durch den Eingang in den Sperrbereich
gefahren wird. Die Bedingungen 2 stellen sicher, dass der Transistor in den Durchlassbereich
gefahren wird.

Ein realer NMOS-Schalter unterscheidet sich in mehrfacher Hinsicht vom idealen Schalter.
In der Praxis kommt es auch in der Abschaltung zu einem kleinen Ableitstrom durch den Transistor.
Auch im Durchlassbereich gibt es immer einen Spannungsabfall über den Innenwiderstand(:math:`R_{ON}`)
des Transistors. Typischerweise liegt diese zwischen :math:`0,1` und :math:`0,2\,V` in Durchlassrichtung,
abhängig vom Drainstrom und der Größe des Bauteils. Diese Abweichungen vom Ideal sind bei
einem richtig dimensionierten Bauteil im Allgemeinen gering, so dass wir bei der Analyse
oder dem Design einer NMOS-Schalterschaltung von nahezu idealen Bedingungen ausgehen können.


.. figure:: img/ Activity_25_Fig_02.png
   :name: 25_fig_02
   :align: center

   NMOS-LED-Schalter

   
Materialien
-----------

- Red Pitaya STEMlab
- 1x :math:`10\,k\Omega` Widerstand
- 1x :math:`100\,Ω` Widerstand
- 1x 5mm LED (jede Farbe)
- 1x Kleinsignal-NMOS-Transistor ZVN211_
- 1x lötfreies Steckbrett

  
Verfahren
---------

Eine häufige Anwendung für einen NMOS-Schalter (oder einen anderen) ist die
Ansteuerung einer LED. Ein LED-Treiber ist in :numref:`25_fig_02` dargestellt. Der in
dieser Abbildung dargestellte Treiber(NMOS) wird verwendet, um mit kleinen Strömen
eine relativ hochstromigen Teil der Schaltung zu treiben. Wenn
der Ausgang des Niederstromkreises niedrig ist (:math:`0\,V`), befindet sich der Transistor
im Cutoff(Nichtleitend) und die LED ist aus. Wenn am Ausgang des Niederstromkreises eine
Spannung (:math:`V_{TH}`)angelegt wird, wird der Transistor leitend und die LED leuchtet. Der Treiber wird verwendet,
da die Niederstromschaltung möglicherweise nicht die Stromfähigkeit hat, um die 20 mA (typisch)
zu liefern, die erforderlich sind, um die LED auf volle Helligkeit zu bringen.

1. Bauen Sie den LED-Schalter-Schaltkreis, der in :numref:`25_fig_02` gezeigt
   wird, auf Ihrem lötfreien Steckbrett auf. :math:`R_D` dient zur
   Begrenzung des Stroms, der in der LED von der :math:`+5\,V` - Spannungversorgungsschiene
   fließt. Der Schalter wird durch den Spannungsausgang OUT1
   gesteuert, der durch den invertierenden Verstärker OP484 verstärkt
   wird. Der Scope-Kanal IN zeigt die Spannung an der LED an, wie in
   :numref:`25_fig_02` dargestellt.
   
2. Für :math:`R_D` nehmen Sie einen 100 :math:`\Omega` Widerstand. Für
   :math:`R_G` nehmen Sie :math:`10\,k\Omega` Widerstand. Gate-Widerstand mit
   der GND verbunden ist eine gute Praxis, um verhindert eine
   unerwünschte Transistorumschaltung durch statische
   Elektrizität.
	 

.. figure:: img/ Activity_25_Fig_03.png

   Abbildung 3: NMOS LED-Schalter auf dem Steckbrett

   
3. Starten Sie die Applikation Oszilloskop & Signalgenerator
   
4. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5
   V, den DC-Offset auf -0,5 V und die Frequenz auf 10 Hz ein, um die
   Eingangsspannung anzulegen. Wählen Sie im Wellenform-Menü SQUARE,
   deaktivieren Sie SHOW und wählen Sie enable.
   
5. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V / div auf 2V / div und IN2 auf 1V / div eingestellt ist
   (Sie können V / div einstellen, indem Sie die gewünschte Option
   auswählen   Kanal und mit vertikalen +/- Kontrollen)
   
6. Setze t / div Wert auf 20ms / div (Du kannst t / div mit
   horizontalen +/- Kontrollen einstellen)
   
7. Stellen Sie unter den Menüeinstellungen IN2 und IN1 den Messtaster
   auf x10 und den vertikalen Offset auf 0.
   

.. figure:: img/ Activity_25_Fig_04.png

   Abbildung 4: NMOS als Switch-Messungen

   
Aus Abbildung 4 können wir das Verhalten des NMOS-Transistors
beobachten, wenn es als Schalter arbeitet. Wenn die Basisspannung
"hoch" ist, wird der Transistor "eingeschaltet", wodurch ein
Stromfluss von +5 V Spannungsschiene durch die Diode zu GND ermöglicht
wird. Wenn der Strom zu fließen beginnt, blinkt die LED.

In diesem "eingeschalteten" Zustand können wir sehen, dass IN2
(LED-Spannung nicht auf 0 V geht). Dies ist der Effekt der
Vorwärtsabfallsspannungen der LED-Diode und des M1-Transistors. Aus
Abbildung 4 können wir diese Drop-Down-Spannung von ~ 1,9 V
messen. Versuchen Sie zu messen, wie viel Drop-Down-Spannung durch M1
verursacht wird und welche Menge durch LED. Wenn die Basisspannung
"niedrig" ist, wird der Transistor "ausgeschaltet", wodurch der
Stromfluss gesperrt wird, weshalb die LED-Spannung gleich ist wie
R1, d. H. 5 V.


Wir können das "Einschalt-Ereignis" von M1 beobachten, indem wir die
TRIANGLE-Wellenform von OUT1 auswählen. Aus Abbildung 5 können wir
sehen, wenn Gate-Signal übergeht :math:`V_ {TH}` der Transistor ist
eingeschaltet.


.. figure:: img/ Activity_25_Fig_05.png

   Abbildung 5: NMOS-Schaltereignis

   
.. note::
   Mehrheit der NMOS-Transistoren haben :math:`V_ {TH}` größer als 2V.

   
Durch Umschalten des Oszilloskop-Sensors IN2 auf den
Drain-Anschluss (D) des M1 können wir den Spannungsabfall am
M1-Transistor messen (Abbildung 6).


.. figure:: img/ Activity_25_Fig_06.png

   Abbildung 6: NMOS-Spannungsabfall.

   
.. note::
   Versuchen Sie aus dem M1 Spannungsabfall zu berechnen :math:`R_
   {ON}` des NMOS ZVN211_ Transistors und vergleichen Sie die
   Ergebnisse mit den Werten aus dem Datenblatt.
   
   Tipp: Berechnen Sie den Strom durch M1, messen Sie den
   Spannungsabfall an M1, berechnen Sie :math:`R_ {ON}`.
   

.. warning::
   Transistor :math:`R_ {ON}` Parameter ist entscheidend in
   Hochstromanwendungen, da die Verlustleistung vom Stromfluss durch
   den Transistor und :math:`R_ {ON}` Wert abhängig ist.
   

.. math::

   P_ {dis} = I ^ 2_D R_ {ON} \ quad
















































































































































