Präzisionsgleichrichter, Absolutwertschaltungen
===============================================

Zielsetzung
-----------

Der Zweck dieses Experiments ist es, Präzisionsgleichrichter oder
Absolutwertschaltungen zu untersuchen. Gleichrichter oder
"Absolutwert" -Schaltkreise werden oft als Detektoren verwendet, um
die Amplituden von Wechselstromsignalen in Gleichstromwerte
umzuwandeln, um leichter gemessen zu werden. Für diese Art von
Schaltung wird das Wechselstromsignal zuerst hochpassgefiltert, um
jegliche Gleichstromkomponente zu entfernen, und dann gleichgerichtet
und möglicherweise tiefpassgefiltert.


Anmerkungen
-----------

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _simple: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _rectifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab-Board-Hardware beziehen.

Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet.

Die für die Spannungsversorgung ** - 3.3V ** und ** + 3.3V **
verwendeten Steckerstifte sind in der Dokumentation hier aufgeführt.


Materialien
-----------

- Rotes Pitaya STEMlab
- 1x OP484_ Quad-Rail-Rail-Operationsverstärker
- 5x 10 kΩ Widerstände
- 2x kleine Signaldioden (1N914 oder ähnlich)


Hintergrund
-----------

Wie man in den mit Dioden aufgebauten einfachen
Gleichrichterschaltungen gesehen hat, spricht die Schaltung nicht gut
auf Signale an, deren Größe kleiner als ein Diodenabfall ist (0,7 V
für Siliziumdioden). Dies beschränkt ihre Verwendung in
Konstruktionen, in denen kleine Amplituden gemessen werden sollen. Für
Designs, bei denen ein hoher Grad an Präzision benötigt wird, können
Operationsverstärker in Verbindung mit Dioden verwendet werden, um
Präzisionsgleichrichter zu bauen.


Die invertierende Operationsverstärkerschaltung kann durch Hinzufügen
von zwei Dioden, wie in 2 gezeigt, in einen "idealen" (linearen
Präzisions-) Einweggleichrichter umgewandelt werden. Für die negative
Hälfte der Eingangsdiode ist D1 in Sperrrichtung vorgespannt und die
Diode D2 ist in Durchlassrichtung vorgespannt und die Schaltung
arbeitet als ein herkömmlicher Inverter mit einer Verstärkung von
-1. Für die positive Hälfte des Eingangs ist die Diode D1 in
Vorwärtsrichtung vorgespannt, wodurch die Rückkopplung um den
Verstärker geschlossen wird. Die Diode D2 ist in Sperrrichtung
vorgespannt, um den Ausgang vom Verstärker zu trennen. Der Ausgang
wird durch den 10 kΩ Widerstand auf das virtuelle Massepotential (-
Eingangsanschluss) gebracht.



.. figure:: img/ Activity_21_Fig_01.png

Abbildung 1: Anschlussplan für Präzisions-Einweggleichrichter


Verfahren
---------

1. Erstellen Sie die Schaltung aus Abbildung 1 auf dem Steckbrett

.. figure:: img/ Activity_21_Fig_02.png

Abbildung 2: Verbindungen auf dem Steckbrett

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5
   V, den DC-Offset auf 0,1 V und die Frequenz auf 100 Hz ein, um die
   Eingangsspannung anzulegen.
   
   Wählen Sie im Wellenform-Menü SINE, deaktivieren Sie SHOW und
   wählen Sie enable.
   
4. Stellen Sie sicher, dass IN1 und IN2 V / div auf der linken unteren
   Seite des Bildschirms auf 200mV / div eingestellt sind (Sie können
   V / div einstellen, indem Sie die gewünschte Option auswählen
   
   Kanal und mit vertikalen +/- Kontrollen
   
5. Setze t / div Wert auf 2ms / div (Du kannst t / div mit horizontalen +/- Kontrollen einstellen)


.. figure:: img/ Activity_21_Fig_03.png

Abbildung 3: Präzisions-Einweggleichrichtermessungen


.. note::
    Aus den Messungen auf Bild 3 können wir folgendes beobachten:
    Die Spitze des gleichgerichteten Ausgangs sollte jetzt gleich dem
    Spitzenwert des Eingangs sein (nur AC-Spitze, beachten Sie, dass
    der DC-Pegel des Eingangssignals nicht zum Ausgang übertragen
    wird). Es gibt auch einen scharfen Übergang, da der Eingang Null
    kreuzt. Der Experimentator sollte die Wellenformen an
    verschiedenen Punkten der Schaltung untersuchen, um zu erklären,
    warum diese Schaltung besser funktioniert als der einfache
    Dioden-Halbwellengleichrichter.
    


Für dieses Experiment sollten Sie:

a) Versuchen Sie, den Offset und die Amplitude von OUT1 zu ändern und
   beobachten Sie die Ergebnisse.
   
b) Studiere die Schaltung und finde heraus, wie sie funktioniert. Es
   gibt ein sehr grundlegendes Konzept, das helfen sollte zu
   verstehen, wie dieser Schaltkreis funktioniert. Wenn ein
   Operationsverstärker mit negativer Rückkopplung konfiguriert wird,
   versuchen die invertierenden und nichtinvertierenden
   Eingangsanschlüsse, den gleichen Spannungspegel zu erreichen, der
   oft als "virtuelle Masse" bezeichnet wird.
   
c) Planen Sie einige Tests, um festzustellen, ob diese Schaltung
   tatsächlich eine Gleichrichterschaltung ist. Führen Sie diese Tests
   durch und dokumentieren Sie alle Tests und Ergebnisse vollständig
   in Ihrem Laborbericht.
   
d) Messen und notieren Sie sorgfältig die Spannungen an allen Knoten
   im Stromkreis.
   
 

Fragen
------
Was passiert, wenn die Richtung der Dioden umgekehrt wird?
Wiederholen Sie den Versuch mit umgekehrter Richtung der beiden
Dioden.
   

Vollwellengleichrichter
-----------------------

Wir können den Halbwellengleichrichter modifizieren, um einen
Vollwellengleichrichter- oder Absolutwertschaltkreis zu schaffen.

Die in 4 gezeigte Schaltung ist eine Absolutwertschaltung, die oft als
Präzisions-Vollweggleichrichter bezeichnet wird. Es sollte wie eine
Vollwellengleichrichterschaltung arbeiten, die mit idealen Dioden
aufgebaut ist (die Spannung über der Diode, in Durchlassrichtung, ist
gleich 0 Volt). Die tatsächlichen Dioden, die in der Schaltung
verwendet werden, haben eine Vorwärtsspannung von ungefähr 0,6 V.



.. figure:: img/ Activity_21_Fig_04.png

Abbildung 4: Präzisions-Vollweggleichrichter


Verfahren
---------

1. Erstellen Sie die Schaltung aus Abbildung 1 auf dem Steckbrett

.. Warnung::
   Bevor Sie den Stromkreis an die STEMlab -3.3V und + 3.3V Anschlüsse
   anschließen, überprüfen Sie Ihren Stromkreis. Die
   Spannungsversorgungsstifte -3,3 V und + 3,3 V haben keinen
   Kurzschluss und können im Falle eines Kurzschlusses beschädigt
   werden.
   

.. figure:: img/ Activity_21_Fig_05.png

Abbildung 5: Verbindungen auf dem Steckbrett

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5
   V, den DC-Offset auf 0,1 V und die Frequenz auf 100 Hz ein, um die
   Eingangsspannung anzulegen.
   
   Wählen Sie im Wellenformmenü SINE, deaktivieren Sie SHOW und wählen
   Sie enable.
   
4. Stellen Sie sicher, dass IN1 und IN2 V / div auf der linken unteren
   Seite des Bildschirms auf 200mV / div eingestellt sind (Sie können
   V / div einstellen, indem Sie die gewünschte Option auswählen
   Kanal und mit vertikalen +/- Kontrollen
   
5. Setze t / div Wert auf 2ms / div (Du kannst t / div mit
   horizontalen +/- Kontrollen einstellen)
   


.. figure:: img/ Activity_21_Fig_06.png

Abbildung 6: Präzisions-Vollweggleichrichtermessungen - Absolutwertschaltung


.. note::
   Wie aus der Fig. 6 ersichtlich ist, ist die in Fig. 4 gezeigte
   Schaltung tatsächlich ein Vollwellengleichrichter, bei dem
   Diodenschwellenspannungen KEINE Auswirkungen verursachen, wie dies
   bei Diodengleichrichtern der Fall ist. Wir können auch sehen, dass
   der DC-Offset-Wert nicht vom Gleichrichtungsprozess ausgeschlossen
   ist, was diese Schaltung zu einer ** Absolutwert-Schaltung **
   macht. Der Name ** Absolutwert-Schaltung ** kommt daher, wie wir
   aus der Abbildung 6 sehen können das Ausgangssignal (IN2) ist ein
   absoluter Wert des Eingangssignals (IN1).
   

Fragen
------

1. Was passiert, wenn die Richtung der Dioden umgekehrt wird?
   Wiederholen Sie den Versuch mit umgekehrter Richtung der beiden
   Dioden.
   
2. Was passiert, wenn die Richtung einer Diode entgegengesetzt ist?
   Wiederholen Sie den Versuch mit der umgekehrten Richtung einer
   Diode (D1).
   
