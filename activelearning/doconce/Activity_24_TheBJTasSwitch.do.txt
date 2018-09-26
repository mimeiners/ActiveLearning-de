BJT-Transistor als Schalter
#############################

Zielsetzung
__________

Ein bipolarer Sperrschichttransistor (BJT) kann in vielen Schaltungskonfigurationen verwendet werden, wie einem Verstärker, Oszillator, Filter, Gleichrichter oder einfach als Ein-Aus-Schalter verwendet werden. Wenn der Transistor in den linearen Bereich vorgespannt ist, wird er als ein Verstärker oder eine andere lineare Schaltung arbeiten, wenn er abwechselnd in den Sättigungs- und Sperrbereichen vorgespannt wird, dann wird er als Schalter verwendet, der Strom fließen lässt oder nicht fließt in anderen Teilen der Schaltung. Dieses Experiment beschreibt das BJT, wenn es als Schalter betrieben wird.


Anmerkungen
______

..hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _datasheet: https://www.sparkfun.com/datasheets/Components/2N3904.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya STEMlab-Board-Hardware beziehen.
Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.
Die für ** + 5V ** - Spannungsversorgung verwendeten Steckerstifte für die Verlängerung finden Sie in der Dokumentation hier_.


Hintergrund
___________

Schaltkreise unterscheiden sich wesentlich von linearen Schaltkreisen. Sie sind auch leichter zu verstehen. Bevor wir komplexere Schaltungen untersuchen, werden wir mit der Einführung diskreter Halbleiterschaltkreise beginnen: jene, die um BJTs herum gebaut sind.

Ein Schalter besteht aus einem BJT-Transistor, der abwechselnd zwischen dem Sättigungs- und dem Sperrbereich betrieben wird. Eine einfache Version des Schalters ist in Abbildung 1 dargestellt. Wenn der Eingang gleich ist :math:`-V_ {in}`, ist die Basis-Emitter-Verbindung in Sperrrichtung vorgespannt oder ausgeschaltet, so dass kein Strom im Kollektor fließt. Dies wird durch die rote Lastlinie in der Abbildung veranschaulicht. Wenn der BJT abgeschaltet ist, hat die Schaltung (idealerweise) die folgenden Werte:

.. math::
  
    V_ {CE} = V_ {CC} \ Quad \ Text {und} \ Quad I_C = 0 A \ Quad (1)

Dieser Zustand ähnelt einem offenen Schalter.
Wenn der Eingang gleich ist :math:`+ V_ {in}`, wird der Transistor in die Sättigung getrieben und die folgenden Bedingungen treten auf:

.. math::
  
    V_ {CE} \ approx 0 \ quad \ text {und} \ quad I_ {C_ {sat}} = \ frac {V_ {CC}} {R_C} A \ quad (2)

Dieser Zustand ähnelt einem geschlossenen Schalter, der den Boden von :math:`R_C` mit Masse verbindet.

.. figure:: img/ Activity_24_Fig_1.png

Abbildung 1: NPN BJT-Schalter und seine Lastlinie

Die Merkmale für einen BJT-Schalter gehen davon aus, dass

1. :math:`-V_ {in}` ist niedrig genug, um den Transistor in Abschaltung zu treiben.
2. :math:`+ V_ {in}` muss genug Basisstrom durch RB erzeugen, um den Transistor in Sättigung zu treiben.
3. Der Transistor ist eine ideale Komponente.

Diese Bedingungen können sichergestellt werden, indem die Schaltung so ausgelegt wird, dass:

1. :math:`-V_ {in} = V_ {BE}`
2. :math:`+ V_ {in} = V_ {BE} + I_B R_B` (: math:` V_ {CC} `ist ein gutes Maximum)
3. :math:`I_B> I_ {C_ {sat}} / \ beta`

Bedingung 1 garantiert, dass die Schaltung durch den Eingang in den Abschaltbereich getrieben wird. Die Bedingungen 2 und 3 stellen sicher, dass der Transistor in den Sättigungsbereich getrieben wird. Ein tatsächlicher BJT-Schalter unterscheidet sich von dem idealen Schalter in mehreren Aspekten. In der Praxis gibt es selbst im Sperrbereich einen kleinen Leckstrom durch den Transistor. Auch in der Sättigung fällt immer eine gewisse Spannung über den Innenwiderstand des Transistors ab. In der Regel liegt die Sättigung zwischen 0,2 und 0,4 V, abhängig vom Kollektorstrom und der Größe des Geräts. Diese Abweichungen vom Ideal sind bei einem Gerät mit richtiger Größe im Allgemeinen geringfügig, so dass wir bei der Analyse oder Konstruktion eines BJT-Schaltkreises nahezu ideale Bedingungen annehmen können.

.. figure:: img/ Activity_24_Fig_2.png

Abbildung 2: NPN-LED-Schalter

Materialien
__________

- Rotes Pitaya STEMlab
- 1x 1kΩ Widerstand
- 1x 100Ω Widerstand
- 1x 5mm LED (jede Farbe)
- 1x kleinsignal NPN-Transistor (2N3904)
- 1x lötfreies Steckbrett

Verfahren
___________

1. Erstellen Sie die Schaltung aus Abbildung 2 auf dem Steckbrett. Set :math:`R_B` = 1kΩ,: math:` R_C` = 100Ω

.. figure:: img/ Activity_24_Fig_3.png

Abbildung 3: NPN LED-Schalter auf dem Steckbrett

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5 V, den DC-Offset auf 0,5 V und die Frequenz auf 10 Hz ein, um die Eingangsspannung anzulegen.
   Wählen Sie im Wellenform-Menü SQUARE, deaktivieren Sie SHOW und wählen Sie enable.
4. Stellen Sie sicher, dass IN1 V / div am linken unteren Bildschirmrand auf 200mV / div und IN2 auf 1V / div eingestellt ist (Sie können V / div einstellen, indem Sie die gewünschte Option auswählen
   Kanal und mit vertikalen +/- Kontrollen)
5. Setze t / div Wert auf 20ms / div (Du kannst t / div mit horizontalen +/- Kontrollen einstellen)
6. Stellen Sie unter IN2-Menüeinstellungen Sonde auf x10 und vertikalen Offset auf 0 ein.
7. Setzen Sie unter IN1 den vertikalen Offset auf 0.

.. figure:: img/ Activity_24_Fig_4.png

Abbildung 4: NPN als Schalter Messungen

Aus Abbildung 4 können wir das Verhalten des NPN-Transistors beobachten, wenn es als Schalter arbeitet. Wenn die Basisspannung "hoch" ist, wird der Transistor "eingeschaltet", wodurch ein Stromfluss von +5 V Spannungsschiene durch die Diode zu GND ermöglicht wird. Wenn der Strom zu fließen beginnt, blinkt die LED.
In diesem "eingeschalteten" Zustand können wir sehen, dass IN2 (LED-Spannung nicht auf 0 V geht). Dies ist der Effekt der Vorwärtsabfallsspannungen der LED-Diode und des Q1-Transistors. Aus Abbildung 4 können wir diese Drop-Down-Spannung von ~ 2,2 V messen. Versuchen Sie zu messen, wie viel Drop-Down-Spannung von Q1 verursacht wird und welche Menge von LED. Wenn die Basisspannung "niedrig" ist, wird der Transistor "ausgeschaltet", wodurch der Stromfluss gesperrt wird, weshalb die LED-Spannung gleich ist wie R1, d. H. 5 V.


Fragen
__________

1. Wieviel Strom fließt in den Widerständen :math:`R_C` und: math:`
   R_B` wenn die LED an ist und wenn die LED aus ist?
   
2. Berechnen Sie :math:`\ beta`, wenn Q1 gesättigt ist. Wie
   vergleicht sich dieser Wert mit der im Datenblatt angegebenen
   Spezifikation?
   










































































































