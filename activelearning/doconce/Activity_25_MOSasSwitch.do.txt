MOSFET-Transistor als Schalter
###############################

Zielsetzung
__________

Eine MOSFET-Vorrichtung (NMOS-Vorrichtung) kann in vielen Schaltungskonfigurationen verwendet werden, wie einem Verstärker, einem Oszillator, einem Filter, einem Gleichrichter oder einfach als Ein-Aus-Schalter verwendet werden. Wenn der FET in den Sättigungsbereich vorgespannt ist, arbeitet er als ein Verstärker oder eine andere lineare Schaltung, wenn er abwechselnd in dem linearen (Trioden) -Bereich und dem Sperrbereich vorgespannt wird, dann wird er als Schalter verwendet, der Strom fließen lässt oder nicht in anderen Teilen der Schaltung fließen. Diese Laboraktivität beschreibt das NMOS-Gerät, wenn es als Schalter betrieben wird.

Anmerkungen
______

..hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _simple: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _rectifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf
.. _inverting: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
.. _ZVN211: http://www.redrok.com/MOSFET_ZVN2110A_100V_320mA_4O_Vth2.4_TO-92_ELine.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya STEMlab-Board-Hardware beziehen.
Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.
Die für die Spannungsversorgung ** + 5V **, ** - 3.3V ** und ** + 3.3V ** verwendeten Steckerstifte sind in der Dokumentation hier aufgeführt.

.. note::
   Red Pitaya STEMlab-Ausgänge können Spannungssignale mit einem maximalen Ausgangsbereich von +/- 1V (2Vpp) erzeugen. Für dieses Experiment werden die höheren Signalamplituden benötigt, um den NMOS-Transistor "einzuschalten" ( :math:`V_ {TH}` voltage). Aus diesem Grund werden wir einen OP484_ in der inverting_opamp Konfiguration verwenden, um die Signalverstärkung von OUT1 / OUT2 zu ermöglichen und einen Spannungshub von +4,7V bis -3,2V zu erreichen. Ein OP484 wird von STEMlab + 5V und -3.3V Spannungsschienen geliefert. Die Verstärkung des invertierenden Verstärkers wird auf ~ 5 gesetzt, wobei gilt :math:`R_i = 2.2k \ Omega` und: math:` R_f = 10k \ Omega`.
   Versuchen Sie zu beantworten, warum wir ein OP484 anstelle von OP27 oder OP97 verwendet haben. (note "Schiene-zu-Schiene").
  
Hintergrund
___________

Schaltkreise unterscheiden sich wesentlich von linearen Schaltkreisen. Sie sind auch leichter zu verstehen. Bevor wir komplexere Schaltungen untersuchen, werden wir mit der Einführung diskreter Halbleiterschaltkreise beginnen: diejenigen, die um NMOS-Bausteine ​​herum gebaut sind.

Ein Schalter besteht aus einem NMOS-Transistor, der abwechselnd zwischen den Trioden- und Abschneidebereichen betrieben wird. Eine einfache Version des Schalters ist in Abbildung 1 dargestellt. Wenn der Eingang gleich ist :math:`-V_ {in}`, ist die Gate-Source-Spannung kleiner als die Schwellenspannung ( :math:`-V_ {TH}`) oder aus, so fließt kein Strom in den Drain. Dies wird durch die rote Lastlinie in der Abbildung veranschaulicht. Wenn der NMOS abgeschaltet ist, hat die Schaltung (idealerweise) die folgenden Werte:

.. math::
  
    V_ {DS} = V_ {DD} \ Quad \ Text {und} \ Quad I_D = 0 A \ Quad (1)


Dieser Zustand ähnelt einem offenen Schalter.
Wenn der Eingang gleich ist :math:`V_ {TH}`, wird der Transistor in die Triodenregion getrieben und die folgenden Bedingungen treten auf:

.. math::

    V_ {DS} \ approx 0 \ quad \ text {und} \ quad I_D = \ frac {V_ {DD}} {R_D} A \ quad (2)

Dieser Zustand ähnelt einem geschlossenen Schalter, der die Unterseite von :math:`R_D` mit Masse verbindet.

.. figure:: img/ Activity_25_Fig_1.png

Abbildung 1: NMOS-FET-Schalter und seine Ladeleitung

Die Eigenschaften für einen Enhancement-Modus-NMOS-Schalter setzen voraus, dass:

1. :math:`-V_ {in}` ist niedrig genug, um den Transistor in Abschaltung zu treiben.
2. :math:`+ V_ {in}` muss größer sein als :math:`V_ {TH}` um den Transistor in Triode zu treiben
3. Der Transistor ist eine ideale Komponente.

Diese Bedingungen können sichergestellt werden, indem die Schaltung so ausgelegt wird, dass:

1. :math:`-V_ {in} = V_ {TH}`
2. :math:`+ V_ {in} = V_ {TH}` ( :math:`V_ {DD}` ist ein gutes Maximum)

Bedingung 1 garantiert, dass die Schaltung durch den Eingang in den Abschaltbereich getrieben wird. Die Bedingungen 2 stellen sicher, dass der Transistor angesteuert wird
in die Triodenregion.

Ein tatsächlicher NMOS-Schalter unterscheidet sich von dem idealen Schalter in mehreren Aspekten. In der Praxis gibt es selbst im Sperrbereich einen kleinen Leckstrom durch den Transistor. In der Triode fällt auch immer eine gewisse Spannung über den internen Widerstand des Transistors ab :math:`R_ {ON}`. Typischerweise liegt diese in Abhängigkeit von dem Drain-Strom und der Größe des Geräts zwischen 0,1 und 0,2 V in Triode. Diese Abweichungen vom Ideal sind bei einem Gerät mit einer geeigneten Größe im Allgemeinen geringfügig, so dass wir nahezu ideale Bedingungen annehmen können, wenn ein NMOS-Schaltkreis analysiert oder entworfen wird.


.. figure:: img/ Activity_25_Fig_2.png

Abbildung 2: NMOS-LED-Schalter

Materialien
__________

- Rotes Pitaya STEMlab
- 1x 10kΩ Widerstand
- 1x 100Ω Widerstand
- 1x 5mm LED (jede Farbe)
- 1x Kleinsignal-NMOS-Transistor ZVN211_
- 1x lötfreies Steckbrett

Verfahren
___________

Die übliche Anwendung für einen NMOS (oder irgendeinen anderen) Schalter ist das Ansteuern einer LED. Ein LED-Treiber ist in Fig. 2 gezeigt. Der Treiber, der in dieser Figur gezeigt ist, wird verwendet, um einen Niedrigstromteil der Schaltung an ein Gerät mit relativ hohem Strom (die LED) zu koppeln. Wenn der Ausgang von der Niedrigstromschaltung niedrig ist (0 V), ist der Transistor abgeschaltet und die LED ist aus. Wenn der Ausgang des Niederstromkreises hoch geht (oben :math:`V_ {TH}`), wird der Transistor in Triode getrieben und die LED leuchtet. Der Treiber wird verwendet, da der stromsparende Teil der Schaltung möglicherweise nicht über die Stromfähigkeit verfügt, um die 20 mA (typisch) zu liefern, die erforderlich sind, um die LED auf volle Helligkeit zu bringen.


1. Bauen Sie den LED-Schalter-Schaltkreis, der in Abbildung 2 gezeigt wird, auf Ihrem lötfreien Steckbrett auf.  :math:`R_D` dient zur Begrenzung des Stroms, der in der LED von der +5 V-Spannung fließt
   liefern. Der Schalter wird durch den Spannungsausgang OUT1 gesteuert, der durch den invertierenden Verstärker OP484 verstärkt wird. Der Scope-Kanal IN zeigt die Spannung an der LED an, wie in Abbildung 2 dargestellt.
2. Für :math:`R_D` nehmen 100: math:` \ Omega` Widerstand. Für :math:`R_G` nehmen Sie 10: math:` k \ Omega`. Gate-Widerstand mit der GND verbunden ist eine gute Praxis, um
   verhindert eine unerwünschte Transistorumschaltung durch statische Elektrizität.

.. figure:: img/ Activity_25_Fig_3.png

Abbildung 3: NMOS LED-Schalter auf dem Steckbrett

3. Starten Sie die Applikation Oszilloskop & Signalgenerator
4. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5 V, den DC-Offset auf -0,5 V und die Frequenz auf 10 Hz ein, um die Eingangsspannung anzulegen.
   Wählen Sie im Wellenform-Menü SQUARE, deaktivieren Sie SHOW und wählen Sie enable.
5. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms, dass IN1 V / div auf 2V / div und IN2 auf 1V / div eingestellt ist (Sie können V / div einstellen, indem Sie die gewünschte Option auswählen
   Kanal und mit vertikalen +/- Kontrollen)
6. Setze t / div Wert auf 20ms / div (Du kannst t / div mit horizontalen +/- Kontrollen einstellen)
7. Stellen Sie unter den Menüeinstellungen IN2 und IN1 den Messtaster auf x10 und den vertikalen Offset auf 0.


.. figure:: img/ Activity_25_Fig_4.png

Abbildung 4: NMOS als Switch-Messungen

Aus Abbildung 4 können wir das Verhalten des NMOS-Transistors beobachten, wenn es als Schalter arbeitet. Wenn die Basisspannung "hoch" ist, wird der Transistor "eingeschaltet", wodurch ein Stromfluss von +5 V Spannungsschiene durch die Diode zu GND ermöglicht wird. Wenn der Strom zu fließen beginnt, blinkt die LED.
In diesem "eingeschalteten" Zustand können wir sehen, dass IN2 (LED-Spannung nicht auf 0 V geht). Dies ist der Effekt der Vorwärtsabfallsspannungen der LED-Diode und des M1-Transistors. Aus Abbildung 4 können wir diese Drop-Down-Spannung von ~ 1,9 V messen. Versuchen Sie zu messen, wie viel Drop-Down-Spannung durch M1 verursacht wird und welche Menge durch LED. Wenn die Basisspannung "niedrig" ist, wird der Transistor "ausgeschaltet", wodurch der Stromfluss gesperrt wird, weshalb die LED-Spannung gleich ist wie R1, d. H. 5 V.

Wir können das "Einschalt-Ereignis" von M1 beobachten, indem wir die TRIANGLE-Wellenform von OUT1 auswählen. Aus Abbildung 5 können wir sehen, wenn Gate-Signal übergeht :math:`V_ {TH}` der Transistor ist eingeschaltet.

.. figure:: img/ Activity_25_Fig_5.png

Abbildung 5: NMOS-Schaltereignis

.. note::
    Mehrheit der NMOS-Transistoren haben :math:`V_ {TH}` größer als 2V.

Durch Umschalten des Oszilloskop-Sensors IN2 auf den Drain-Anschluss (D) des M1 können wir den Spannungsabfall am M1-Transistor messen (Abbildung 6).

.. figure:: img/ Activity_25_Fig_6.png

Abbildung 6: NMOS-Spannungsabfall.

.. note::
    Versuchen Sie aus dem M1 Spannungsabfall zu berechnen :math:`R_ {ON}` des NMOS ZVN211_ Transistors und vergleichen Sie die Ergebnisse mit den Werten aus dem Datenblatt.
    Tipp: Berechnen Sie den Strom durch M1, messen Sie den Spannungsabfall an M1, berechnen Sie :math:`R_ {ON}`.

.. Warnung::
    
    Transistor :math:`R_ {ON}` Parameter ist entscheidend in Hochstromanwendungen, da die Verlustleistung vom Stromfluss durch den Transistor und :math:`R_ {ON}` Wert abhängig ist.

    .. math::

         P_ {dis} = I ^ 2_D R_ {ON} \ quad
















































































































































