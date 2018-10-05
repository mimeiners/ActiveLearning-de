Diodengleichrichter
===================

Zielsetzung
-----------


Das Ziel dieser Übung ist die Untersuchung von Halb- und
Vollwellen-Diodengleichrichtern, die zur Umwandlung von Wechselstrom
in Gleichstrom verwendet werden. 

Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signalgenerator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab - Board - Hardware_ beziehen.

Oszilloskop_ & Signalgenerator_ Anwendung wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet. 

Materialien
-----------

- Red Pitaya STEMlab
  
- Widerstand: 1 x 1 :math:`k\Omega`
  
- Kleinsignaldiode: 4 x (1N914 oder ähnlich)



Halbwellengleichrichter
-----------------------

Einleitung
----------

Richten Sie die Steckplatine so ein, dass die Kanäle OUT1 und IN2 an einem Ende
der Diode angebracht sind. Das andere Ende der Diode ist mit einem Ende des
Lastwiderstandes :math:`1 \, k\Omega` verbunden, wie in :numref:`20_fig_02` dargestellt. Das andere Ende
des Widerstandes ist mit der GND-Schiene verbunden. Der Eingang des Scope Kanals
IN2 ist mit dem Ende des Widerstandes verbunden, der nicht mit der GND-Schiene verbunden ist.

.. figure:: img/Activity_20_Fig_01.png
   :name: 20_fig_01
   :align: center

   Anschlussplan für Halbwellen-Diodengleichrichter

Aus der obigen Konfiguration folgt, dass die Eingangswechselspannung und die
gleichgerichtete Gleichspannung im Scope als :math:`V_{AC} = IN_1`
und :math:`V_{rec} = IN_2` dargestellt werden. 


1. Bauen Sie die Schaltung aus :numref:`20_fig_01` auf dem Steckbrett auf.

   
.. figure:: img/Activity_20_Fig_02.png
   :name: 20_fig_02
   :align: center

   Verbindungen auf dem Steckbrett

   
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf :math:`0,9\,V`
   und den DC-Offset auf :math:`0\,V` ein, um die Eingangsspannung
   anzulegen. Wählen Sie im Wellenformmenü SINE, Deaktivieren Sie den
   SHOW-Button und wählen Sie Enable.
   
4. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 :math:`V/div` auf :math:`200\,mV/div` eingestellt ist (Sie können
   :math:`V/div` einstellen, indem Sie den gewünschten Kanal und die vertikalen
   +/- Regler auswählen)
   
5. Stellen Sie sicher, dass IN2 :math:`V/div` am linken unteren
   Bildschirmrand auf :math:`200\,mV/div` eingestellt ist (Sie können :math:`V/div`
   einstellen, indem Sie den gewünschten Kanal und die vertikalen +/-
   Regler auswählen)
   
6. Setzen Sie :math:`t/div` Wert auf :math:`200\,us/div` (Sie können :math:`t/div` mit
   horizontalen +/- Regler einstellen)
   

.. figure:: img/Activity_20_Fig_03.png
   :name: 20_fig_03
   :align: center

   Halbwellen-Diodengleichrichtermessungen

Wie man in :numref:`20_fig_03` sehen kann, wird nur die positive Halbperiode des
Eingangssignals auf die Last übertragen. Dies bedeutet, dass die
negative Halbperiode nicht an der Leistungsübertragung beteiligt ist.


Fragen
------

1. Warum ist der Spitzenwert des gleichgerichteten Ausgangs kleiner als
   der Spitzenwert des AC-Eingangs und um wie viel? 

2. An welcher Stelle in der Eingangswellenform wird die gleichgerichtete
   Wellenform positiv, d.h. etwas anderes als Null? 

3. Was passiert, wenn die Richtung der Diode umgekehrt wird?
   Wiederholen Sie das Experiment mit umgekehrter Richtung der Diode. 


Vollwellengleichrichter
-----------------------

Hier untersuchen wir die Verwendung von zwei Dioden als Vollwellengleichrichter.

Unter Verwendung von 1N914-Dioden wird das Steckbrett mit OUT1 an
einem Ende der ersten Diode D1 und OUT2 an einem Ende der zweiten
Diode D2 aufgebaut. Beide Dioden sollten in die gleiche Richtung
weisen wie in :numref:`20_fig_05` gezeigt. Das andere Ende jeder Diode ist mit einem
Ende des :math:`1\,k\Omega`  Lastwiderstandes :math:`R_L` verbunden. Das andere Ende
des Widerstands ist mit der GND - Schiene verbunden.


.. figure:: img/Activity_20_Fig_04.png
   :name: 20_fig_04
   :align: center

   Anschlussplan für Vollwellen-Diodengleichrichter

   
Durchführung
------------

1. Bauen Sie die Schaltung aus :numref:`20_fig_04` auf dem Steckbrett auf. 

   
.. figure:: img/Activity_20_Fig_05.png
   :name: 20_fig_05
   :align: center

   Verbindungen auf dem Steckbrett

   
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator

3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf
   :math:`0,9\,V` und den DC-Offset auf :math:`0\,V` ein, um die Eingangsspannung
   anzulegen. Wählen Sie im Wellenform-Menü SINE und wählen
   Sie Enable. 
      
4. Stellen Sie im Menü OUT2-Einstellungen den Amplitudenwert auf
   :math:`0,9\,V`, DC-Offset auf :math:`0\,V`, **Phase auf 180 °** ein, um die
   Eingangsspannung anzulegen. Aus dem Wellenformmenü wählen Sie SINE, und wählen Sie Enable.
   
5. Deaktivieren Sie im Einstellungsmenü der IN1 SHOW
   
6. Stellen Sie sicher, dass IN2, OUT1 und OUT2 :math:`V/div` auf der linken
   Seite des Bildschirms auf :math:`200\,mV/div` eingestellt sind (Sie können
   :math:`V/div` einstellen, indem Sie den gewünschten Kanal auswählen
   und vertikale +/- Regler verwenden)
   
7. Setzen Sie :math:`t/div` Wert auf :math:`200\,us/div` (Sie können :math:`t/div` mit
   horizontalen +/- Regler einstellen)
   
8. Stellen Sie im Trigger-Einstellungsmenü die Triggerquelle auf IN2,
   den Triggerpegel auf :math:`0,2\,V`, den Triggermodus auf Normal und den
   Triggeroffset auf :math:`-0,12\,ms` ein. 
   

Wenn sowohl 0-Grad- als auch 180-Grad-Phasen des AC-Eingangssignals
(OUT1 und OUT2) verfügbar sind, kann eine zweite Diode die fehlende
Halbwelle des Eingangs füllen und das vollwellige gleichgerichtete Signal
erzeugen. Auch hier wird die Durchlassspannung der Dioden sichtbar und die
Ausgangswellenform wird aufgrund der ungleich Null-Einschaltspannung der
Dioden nicht zu einem scharfen Punkt am Nulldurchgang kommen.

.. figure:: img/Activity_20_Fig_06.png
   :name: 20_fig_06
   :align: center

   Vollweggleichrichtermessungen

   
Fragen
------

1. Was passiert, wenn die Richtung der Dioden umgekehrt wird?
   Wiederholen Sie den Versuch mit umgekehrter Richtung der beiden
   Dioden.
   
2. Was passiert, wenn die Richtung einer Diode entgegengesetzt ist?
   Wiederholen Sie den Versuch mit der umgekehrten Richtung der
   Diode (D1).
   
3. Wie können sowohl 0-Grad- als auch 180-Grad-Phasen aus einer
   einzigen Quelle erstellt werden? (Wie wäre es mit einem
   Transformator?)
   


Brückengleichrichter
--------------------

Hier untersuchen wir den Einsatz von vier Dioden als Brückengleichrichter.
Brückengleichrichter ist ein Vollwellengleichrichter und wir sollten die gleichen
Signale erwarten, wie in :numref:`20_fig_06` dargestellt. Der Unterschied besteht darin,
dass der Brückengleichrichter die negative Halbwelle ohne zusätzliche um 180 Grad
versetzte Spannungsquelle ausfüllt und stattdessen 4 Dioden verwendet, um einen
Vollwellengleichrichter ohne zusätzliche Spannungsquelle herzustellen.

.. figure:: img/Activity_20_Fig_07.png
   :name: 20_fig_07
   :align: center

   Brückenvollwellen-Diodengleichrichter

.. note::
   In der Brückendiodenkonfiguration muss die "AC"-Seite potentialfrei sein,
   d.h. wir können keine DC-Masse-Referenz von unserem Signalgeneratorausgang
   (OUT1) auf die AC-Seite der Diodenkonfiguration bringen. Wenn wir das tun,
   werden die Punkte 3 und 4 (:numref:`20_fig_07`) auf der gleichen GND-Referenz liegen,
   wodurch D3 effektiv abgekürzt wird. Die Abkürzung von D3 wird im Falle einer
   negativen OUT1-Halbwelle einfach, an dieser Stelle vorwärts polarisiert D4
   durchlaufen, den Stromfluss direkt durch D4 und nicht durch den Lastwiderstand :math:`R_L`
   umgehen. Aus diesem Grund wird ein Trenntrafo benötigt, um die gemeinsame Masse
   der "DC"-Seite der Diodenbrücke zu trennen.

In :numref:`20_fig_08` ist die Brückengleichrichterkonfiguration mit
Transformator dargestellt. Dies ist die gebräuchlichste Verwendung des
Brückengleichrichters. Wie aus der :numref:`20_fig_08` zu ersehen ist, sind
die Punkte 1 und 3 des Brückengleichrichters der Differenzspannung des
Transformators ausgesetzt, was einen korrekten Betrieb des
Gleichrichters ermöglicht. Punkt 3 wird nicht auf GND gelegt, wenn der
IN2-Fühler angeschlossen ist und D3 nicht überbrückt wird, da die "AC"
(Transformator) -Seite isoliert ist.



.. figure:: img/Activity_20_Fig_08.png
   :name: 20_fig_08
   :align: center

   Brückenvollwellen-Diodengleichrichter mit Transformator

   
.. note::
   Hier haben wir einen 1: 6 Transformator verwendet. Die Auswahl des
   Transformators ist abhängig von den Spannungspegeln usw. Hier
   verwenden wir einen 1: 6-Wandler, um die Versorgungsspannung OUT1
   (:math:`+/-\, 1\,V`) zu erhöhen. Diese Spannungserhöhung, d.h. das Übersetzungsverhältnis,
   hat keinen Einfluss auf den Brückenbetrieb selbst. Sie können 1:1,1:2 oder
   verschiedene Verhältniswandler verwenden.
   

Durchführung
------------

1. Bauen Sie die  chaltung aus :numref:`20_fig_08` auf dem Steckbrett auf.

   
.. figure:: img/Activity_20_Fig_09.png
   :name: 20_fig_09
   :align: center

   Brückengleichrichter auf dem Steckbrett

   
2. Stellen Sie die IN2-Sondendämpfung auf x10

3. Starten Sie die Applikation Oszilloskop & Signalgenerator
   
4. Stellen Sie im Menü OUT1-Einstellungen Amplitudenwert auf :math:`0,9\,V`,
   DC-Offset auf :math:`0\,V` und Frequenz auf :math:`100\,Hz` ein, um die
   Eingangsspannung anzulegen. Wählen Sie im Wellenformmenü SINE,
   Deaktivieren Sie SHOW und wählen Sie Enable.
   
5. Stellen Sie im IN2-Eingangsmenü die Sondendämpfung auf x10 ein
   
6. Vergewissern Sie sich auf der linken Seite des Bildschirms, dass
   IN1 auf :math:`200\,mV/Div` steht (Sie können :math:`V/Div` einstellen, indem Sie
   den gewünschten Kanal auswählen und vertikale +/- Regler verwenden)
   
7. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN2 auf :math:`2\,V/Div` eingestellt ist (Sie können :math:`V/Div`
   einstellen, indem Sie den gewünschten Kanal auswählen und vertikale +/- Regler verwenden)
   
8. Setze :math:`t/div` Wert auf :math:`2\,ms/div` (Du kannst :math:`t/div` mit
   horizontalen +/- Kontrollen einstellen)
   

.. figure:: img/Activity_20_Fig_10.png
   :name: 20_fig_10
   :align: center

   Brückengleichrichtermessungen

.. note::
   Das in :numref:`20_fig_10` gezeigte Signal IN1 ist das Spannungssignal auf der
   Primärseite des Transformators (:numref:`20_fig_08`). Diese Spannung (IN1)
   multipliziert mit dem Transformatorverhältnis und um 180º
   verschoben ist das tatsächliche Wechselstromsignal am
   Brückengleichrichter. Warum haben wir die IN1-Sonde nicht auf die
   Sekundärseite des Transformators gelegt? Betrachten Sie die :numref:`20_fig_07`
   und Ihre Erklärung. 

Wie aus :numref:`20_fig_10` ersichtlich, ist die Brückenkonfiguration
tatsächlich ein Vollwellengleichrichter, der nur eine Spannungsquelle
verwendet. Bei Verwendung von STEMlab wurde ein zusätzlicher
Transformator benötigt. Bei Verwendung eines Transformators mit dem
zentralen Abgriff können wir einen Vollwellengleichrichter mit nur
zwei Dioden herstellen. Erkunden Sie, wie!

Der Nachteil dieser Schaltung ist, dass nun zwei Diodenabfälle mit der Last in
Reihe geschaltet sind und der Spitzenwert des gleichgerichteten Ausgangs um :math:`1,2\,Volt`
geringer ist als der AC-Eingang und nicht mehr die :math:`0,6\,V` in den vorherigen Schaltungen.
Versuchen Sie, diesen Spannungsabfall zu messen.
