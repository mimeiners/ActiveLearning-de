Diodengleichrichter
===================

Zielsetzung
-----------


Das Ziel dieses Experiments ist die Untersuchung von Halb- und
Vollwellen-Diodengleichrichtern, die zur Umwandlung von Wechselstrom
in Gleichstrom verwendet werden. 

Anmerkungen
-----------

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab-Board-Hardware beziehen.

Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet. 

Materialien
-----------

- Rotes Pitaya STEMlab
  
- Widerstand: 1 x 1 :math:`k \ Omega`
  
- Kleinsignaldiode: 4 x (1N914 oder ähnlich)



Halbwellengleichrichter
-----------------------

Richtungen
----------

Stellen Sie das Steckbrett mit OUT1- und IN2-Kanälen auf, die an einem
Ende der Diode angebracht sind. Das andere Ende der Diode ist mit
einem Ende des 1 kΩ-Lastwiderstands verbunden, wie in 2 gezeigt. Das
andere Ende des Widerstands ist mit der GND-Schiene verbunden. Der
Eingang des Oszilloskopkanals IN2 ist mit dem Ende des Widerstands
verbunden, der nicht mit der GND-Schiene verbunden ist. 

.. figure:: img/Activity_20_Fig_01.png

   Abbildung 1: Anschlussplan für Halbwellen-Diodengleichrichter

Aus der obigen Konfiguration folgt, dass die Eingangswechselspannung
und die gleichgerichtete "Gleichspannung" in der Oszilloskopanwendung
als mathematisch dargestellt werden :math:`V_ {AC} = IN_1` und :math:`V_
{rec} = IN_2`. 


1. Erstellen Sie die Schaltung aus Abbildung 1 auf dem Steckbrett

   
.. figure:: img/Activity_20_Fig_02.png

   Abbildung 2: Verbindungen auf dem Steckbrett

   
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,9 V
   und den DC-Offset auf 0 V ein, um die Eingangsspannung
   anzulegen. Wählen Sie im Wellenformmenü SINE, Deaktivieren Sie den
   SHOW-Button und wählen Sie enable.
   
4. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V / div auf 200mV / div eingestellt ist (Sie können V /
   div einstellen, indem Sie den gewünschten Kanal und die vertikalen
   +/- Regler auswählen
   
5. Stellen Sie sicher, dass IN2 V / div am linken unteren
   Bildschirmrand auf 200mV / div eingestellt ist (Sie können V / div
   einstellen, indem Sie den gewünschten Kanal und die vertikalen +/-
   Regler auswählen)
   
6. Setzen Sie t / div Wert auf 200us / div (Sie können t / div mit
   horizontalen +/- Kontrollen einstellen)
   

.. figure:: img/Activity_20_Fig_03.png

   Abbildung 3: Halbwellen-Diodengleichrichtermessungen

Wie man in Abbildung 3 sehen kann, wird die positive Halbperiode des
Eingangssignals auf die Last übertragen. Dies bedeutet, dass die
negative Halbperiode nicht an der Leistungsübertragung beteiligt ist.


Fragen
------

1. Warum ist der Spitzenwert der gleichgerichteten Ausgabe kleiner als
   der Spitzenwert der AC-Eingabe und um wie viel? 

2. An welchem Punkt der Eingangswellenform wird die gleichgerichtete
   Wellenform positiv, d. H. Etwas anderes als Null? 

3. Was passiert, wenn die Richtung der Diode umgekehrt wird?
   Wiederholen Sie das Experiment mit umgekehrter Richtung der Diode. 


Vollwellengleichrichter
-----------------------

Hier untersuchen wir die Verwendung von zwei Dioden als Vollwellengleichrichter.

Unter Verwendung von 1N914-Dioden wird das Steckbrett mit OUT1 an
einem Ende der ersten Diode D1 und OUT2 an einem Ende der zweiten
Diode D2 aufgebaut. Beide Dioden sollten in die gleiche Richtung
weisen wie in 5 gezeigt. Das andere Ende jeder Diode ist mit einem
Ende des 1 k & OHgr; Lastwiderstandes RL verbunden. Das andere Ende
des Widerstands ist mit der GND V-Schiene verbunden.


.. figure:: img/Activity_20_Fig_04.png

   Abbildung 4: Anschlussplan für Vollwellen-Diodengleichrichter

   
Verfahren
---------

1. Erstellen Sie die Schaltung aus Abbildung 4 auf dem Steckbrett

   
.. figure:: img/Activity_20_Fig_05.png

   Abbildung 5: Verbindungen auf dem Steckbrett

   
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator

3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf
   0,9 V und den DC-Offset auf 0 V ein, um die Eingangsspannung
   anzulegen. Wählen Sie im Wellenform-Menü SINE und aktivieren
   Sie.
      
4. Stellen Sie im Menü OUT2-Einstellungen den Amplitudenwert auf 0,9
   V, DC-Offset auf 0 V, ** Phase auf 180 ° ** ein, um die
   Eingangsspannung anzulegen. Aus dem Wellenformmenü
   
   Wählen Sie SINE, und wählen Sie Aktivieren.
   
5. Deaktivieren Sie im Einstellungsmenü der IN1 SHOW
   
6. Stellen Sie sicher, dass IN2, OUT1 und OUT2 V / div auf der linken
   Seite des Bildschirms auf 200mV / div eingestellt sind (Sie können
   V / div einstellen, indem Sie die gewünschte Option auswählen
   Kanal und mit vertikalen +/- Kontrollen
   
7. Setzen Sie t / div Wert auf 200us / div (Sie können t / div mit
   horizontalen +/- Kontrollen einstellen)
   
8. Stellen Sie im Trigger-Einstellungsmenü die Triggerquelle auf IN2,
   den Triggerpegel auf 0,2 V, den Triggermodus auf Normal und den
   Triggeroffset auf -0,12 ms
   

Wenn sowohl 0-Grad- als auch 180-Grad-Phasen des AC-Eingangssignals
(OUT1 und OUT2) verfügbar sind, kann eine zweite Diode die fehlende
Halbwelle des Eingangs füllen und das vollweggleichgerichtete Signal
erzeugen. Wiederum ist die Vorwärtsspannung der Dioden offensichtlich,
und die Ausgangswellenform wird aufgrund der
Nicht-Null-Einschaltspannung der Dioden am Nulldurchgang nicht zu
einem scharfen Punkt kommen.


.. figure:: img/Activity_20_Fig_06.png

   Abbildung 6: Vollweggleichrichtermessungen

   
Fragen
------

1. Was passiert, wenn die Richtung der Dioden umgekehrt wird?
   Wiederholen Sie den Versuch mit umgekehrter Richtung der beiden
   Dioden.
   
2. Was passiert, wenn die Richtung einer Diode entgegengesetzt ist?
   Wiederholen Sie den Versuch mit der umgekehrten Richtung einer
   Diode (D1).
   
3. Wie können sowohl 0-Grad- als auch 180-Grad-Phasen aus einer
   einzigen Quelle erstellt werden? (Wie wäre es mit einem
   Transformator?)
   


Brückengleichrichter
--------------------

Hier untersuchen wir die Verwendung von vier Dioden als
Brückengleichrichter.

Brückengleichrichter ist ein Vollwellengleichrichter und wir sollten
dieselben Signale wie in Abbildung 6 erwarten. Der Unterschied ist
hier

Brückengleichrichter füllen die negative Halbwelle ohne zusätzliche um
180 Grad verschobene Spannungsquelle. Stattdessen Brückengleichrichter
verwenden 4 Dioden, um Vollwellengleichrichter zu machen, ohne eine
zusätzliche Spannungsquelle zu benötigen. 


.. figure:: img/Activity_20_Fig_07.png

   Abbildung 7: Brückenvollwellen-Diodengleichrichter


.. note::
    In der Brückendiodenkonfiguration muss die "AC" -Seite
    potentialfrei sein, d. H. Wir können keine DC-Erdungsreferenz von
    unserem Signalgenerator-Ausgang (OUT1) zu der AC-Seite der
    Diodenkonfiguration. Wenn wir dies tun, befinden sich die Punkte 3
    und 4 (7) auf dem gleichen GND-Bezug, wodurch D3 effektiv
    abgekürzt wird. Die Abkürzung von D3 wird im Fall einer negativen
    OUT1-Halbwelle einfach durch diesen Punkt vorwärtspolarisiert D4,
    Bypass-Stromfluss direkt durch D4 und nicht den Lastwiderstand
    RL. Aus diesem Grund wird ein Trenntransformator benötigt, um die
    gemeinsame Masse der "DC" -Seite der Diodenbrücke zu trennen. 

In Abbildung 8 ist die Brückengleichrichterkonfiguration mit
Transformator dargestellt. Dies ist die gebräuchlichste Verwendung des
Brückengleichrichters. Wie aus der Abbildung 8 zu ersehen ist, sind
die Punkte 1 und 3 des Brückengleichrichters der Differenzspannung des
Transformators ausgesetzt, was einen korrekten Betrieb des
Gleichrichters ermöglicht. Punkt 3 wird nicht auf GND gelegt, wenn der
IN2-Fühler angeschlossen ist und D3 nicht überbrückt wird, da die "AC"
(Transformator) -Seite isoliert ist.



.. figure:: img/Activity_20_Fig_08.png

   Abbildung 8: Brückenvollwellen-Diodengleichrichter mit Transformator

   
.. note::
   Hier haben wir einen 1: 6 Transformator verwendet. Die Auswahl des
   Transformators ist abhängig von den Spannungspegeln usw. Hier
   verwenden wir einen 1: 6-Wandler, um die Versorgungsspannung OUT1
   (+/- 1V) zu erhöhen. Dieser Spannungsanstieg, d. H. Das
   Transformatorverhältnis, beeinträchtigt nicht die Brückenoperation
   selbst. Sie können 1: 1,1: 2 oder verschiedene
   Übersetzungstransformatoren verwenden.
   

Verfahren
---------

1. Baue die Schaltung aus Abbildung 8 auf dem Steckbrett

   
.. figure:: img/Activity_20_Fig_09.png

   Abbildung 9: Brückengleichrichter auf dem Steckbrett

   
2. Stellen Sie die IN2-Sondendämpfung auf x10

3. Starten Sie die Applikation Oszilloskop & Signalgenerator
   
4. Stellen Sie im Menü OUT1-Einstellungen Amplitudenwert auf 0,9 V,
   DC-Offset auf 0 V und Frequenz auf 100 Hz ein, um die
   Eingangsspannung anzulegen. Wählen Sie im Wellenformmenü SINE,
   
   Deaktivieren Sie SHOW und wählen Sie Aktivieren.
   
5. Stellen Sie im IN2-Eingangsmenü die Sondendämpfung auf x10 ein
   
6. Vergewissern Sie sich auf der linken Seite des Bildschirms, dass
   IN1 auf 200mV / Div steht (Sie können V / Div einstellen, indem Sie
   den gewünschten Wert auswählen
   
   Kanal und mit vertikalen +/- Kontrollen
   
7. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN2 auf 2V / Div eingestellt ist (Sie können V / Div
   einstellen, indem Sie den gewünschten Wert auswählen
   
   Kanal und mit vertikalen +/- Kontrollen
   
8. Setze t / div Wert auf 2ms / div (Du kannst t / div mit
   horizontalen +/- Kontrollen einstellen)
   

.. figure:: img/Activity_20_Fig_10.png

   Abbildung 10: Brückengleichrichtermessungen

   
.. note::
   Das in Fig. 10 gezeigte Signal IN1 ist das Spannungssignal auf der
   Primärseite des Transformators (Fig. 8). Diese Spannung (IN1)
   multipliziert mit dem Transformatorverhältnis und um 180º
   verschoben ist das tatsächliche Wechselstromsignal am
   Brückengleichrichter. Warum haben wir die IN1-Sonde nicht auf die
   Sekundärseite des Transformators gelegt? Schau dir die Abbildung 7
   und ihre Erklärung an. 

Wie aus Abbildung 10 ersichtlich, ist die Brückenkonfiguration
tatsächlich ein Vollwellengleichrichter, der nur eine Spannungsquelle
verwendet. Bei Verwendung von STEMlab wurde ein zusätzlicher
Transformator benötigt. Bei Verwendung eines Transformators mit dem
zentralen Abgriff können wir einen Vollwellengleichrichter mit nur
zwei Dioden herstellen. Erkunde wie!

Der Nachteil dieser Schaltung besteht darin, dass jetzt zwei
Diodenabfälle in Reihe mit der Last liegen und der Spitzenwert des
gleichgerichteten Ausgangs weniger als der Wechselstromeingang von 1,2
Volt ist als die 0,6 V in den vorherigen Schaltungen. Versuchen Sie,
diesen Spannungsabfall zu messen.
