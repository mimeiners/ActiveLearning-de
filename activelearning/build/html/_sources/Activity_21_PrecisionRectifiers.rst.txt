Präzisionsgleichrichter, Absolutwertschaltungen
===============================================

Zielsetzung
-----------

Ziel dieses Experiments ist es, Präzisionsgleichrichter oder Absolutwertschaltungen
zu untersuchen. Gleichrichter oder "Absolutwertschaltungen" werden häufig als
Detektoren verwendet, um die Amplituden von Wechselstromsignalen in leichter zu
messende Gleichstromwerte umzuwandeln. Bei dieser Art von Schaltung wird das
Wechselstromsignal zunächst hochpassgefiltert, um jegliche Gleichstromanteile zu
entfernen, dann gleichgerichtet und eventuell tiefpassgefiltert.


Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Signalgenerator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Operationsverstärkerschaltung: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
.. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab - Board - Hardware_ beziehen.

Oscilloscope & Signalgenerator_ Anwendung wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet.

Die für die Spannungsversorgung **-3.3V** und **+3.3V**
verwendeten Steckerstifte sind in der Dokumentation_ aufgeführt.


Materialien
-----------

- Red Pitaya STEMlab
- 1x OP484_ Quad-Rail-Rail-Operationsverstärker
- 5x 10 kΩ Widerstände
- 2x kleine Signaldioden (1N914 oder ähnlich)


Hintergrund
-----------

Wie wir in den einfachen Gleichrichterschaltungen mit Dioden gesehen haben,
reagiert die Schaltung nicht gut auf Signale, die  kleiner als die
Diodenschwellspannung (":math:`0,7\,V` für Siliziumdioden") sind. Dies schränkt ihren Einsatz in
Schaltungen ein, bei denen kleine Amplituden gemessen werden sollen. Für
Schaltungen, bei denen ein hohes Maß an Präzision gefordert ist, können
Operationsverstärker in Verbindung mit Dioden zum Bau von Präzisionsgleichrichtern
eingesetzt werden.

Die invertierende Operationsverstärkerschaltung_ kann durch Hinzufügen von zwei Dioden,
wie in :numref:`21_fig_02` dargestellt, in einen "idealen" (lineare Präzision) Einweggleichrichter
umgewandelt werden. Denn die negative Hälfte der Eingangsdiode D1 ist rückwärts vorgespannt
und die Diode D2 vorwärts vorgespannt und die Schaltung arbeitet wie ein konventioneller
Wechselrichter mit einer Verstärkung von :math:`-1`. Für die positive Hälfte des Eingangs ist die
Diode D1 vorwärts vorgespannt und schließt die Rückführung um den Verstärker herum. Die
Diode D2 ist eine umgekehrte Vorspannung, die den Ausgang vom Verstärker trennt.
Der Ausgang liegt auf dem virtuellen Massepotential ( - Eingangsklemme) durch den :math:`10\,k\Omega` Widerstand.




.. figure:: img/ Activity_21_Fig_01.png
   :name: 21_fig_01
   :align: center

   Anschlussplan für Präzisions-Einweggleichrichter


Verfahren
---------

1. Bauen Sie die Schaltung aus Abbildung 1 auf dem Steckbrett auf.

.. figure:: img/ Activity_21_Fig_02.png
   :name: 21_fig_02
   :align: center

   Verbindungen auf dem Steckbrett

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf :math:`0,5\,V`,
   den DC-Offset auf :math:`0,1\,V` und die Frequenz auf :math:`100\,Hz` ein, um die
   Eingangsspannung anzulegen. Wählen Sie im Wellenform-Menü SINE, deaktivieren Sie SHOW und
   wählen Sie Enable.
   
4. Stellen Sie sicher, dass IN1 und IN2 :math:`V/div` auf der linken unteren
   Seite des Bildschirms auf :math:`200\,mV/div` eingestellt sind (Sie können
   :math:`V/div` einstellen, indem Sie die gewünschten Kanal wählen und vertikalen +/- Regler verwenden)
   
5. Setze :math:`t/div` Wert auf :math:`2\,ms/div` (Du kannst :math:`t/div` mit horizontalen +/- Regler einstellen)


.. figure:: img/ Activity_21_Fig_03.png
   :name: 21_fig_03
   :align: center

   Präzisions-Einweggleichrichtermessungen


.. note::
    Aus den auf :numref:`21_fig_03` gezeigten Messungen können wir folgendes beobachten:
    Die Spitze des gleichgerichteten Ausgangs sollte nun gleich dem Spitzenwert
    des Eingangs sein (nur Wechselspannungsspitze, beachten Sie, dass der
    Gleichstrompegel des Eingangssignals nicht auf den Ausgang übertragen wird).
    Es gibt auch einen scharfen Übergang, da der Eingang den Wert Null überschreitet.
    Der Laborant sollte die Wellenformen an verschiedenen Stellen in der
    Schaltung untersuchen, um zu erklären, warum diese Schaltung besser funktioniert
    als der einfache Dioden-Halbwellengleichrichter.
    

Für diesen Versuch sollten Sie:

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

Wir können den Halbwellen-Gleichrichter modifizieren, um einen Vollwellen-Gleichrichter
oder eine Absolutwertschaltung herzustellen. Die in :numref:`21_fig_04` dargestellte Schaltung ist
eine Absolutwertschaltung, die oft als Präzisions-Vollwellengleichrichter bezeichnet wird.
Es sollte wie eine Vollwellen-Gleichrichterschaltung funktionieren, die mit idealen
Dioden aufgebaut ist (die Spannung über der Diode, in Vorwärtsleitung, entspricht 0 Volt).
Die in der Schaltung verwendeten Dioden haben eine Durchlassspannung von ca. :math:`0,6\,V`.

.. figure:: img/ Activity_21_Fig_04.png
   :name: 21_fig_04
   :align: center

   Präzisions-Vollweggleichrichter


Verfahren
---------

1. Bauen Sie die Schaltung aus :numref:`21_fig_04` auf dem Steckbrett auf. 

.. warning::
   Bevor Sie die Schaltung an die STEMlab-Pins -3,3V und +3,3V anschließen,
   überprüfen Sie Ihre Schaltung nochmals. Die Spannungsversorgungsstifte -3,3V
   und +3,3V haben keine Schutzschaltung und können im Falle eines
   Kurzschlusses beschädigt werden.

 
.. figure:: img/ Activity_21_Fig_05.png
   :name: 21_fig_05
   :align: center

   Verbindungen auf dem Steckbrett

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf :math:`0,5\,V`,
   den DC-Offset auf :math:`0,1\,V` und die Frequenz auf :math:`100\,Hz` ein, um die
   Eingangsspannung anzulegen. Wählen Sie im Wellenformmenü SINE, deaktivieren Sie SHOW
   und wählen Sie Enable.
   
4. Stellen Sie sicher, dass IN1 und IN2 :math:`V/div` auf der linken unteren
   Seite des Bildschirms auf :math:`200\,mV/div` eingestellt sind (Sie können
   :math:`V/div` einstellen, indem Sie die gewünschten Kanal auswählen und
   vertikalen +/- Regler verwenden. 
   
5. Setze :math:`t/div` Wert auf :math:`2\,ms/div` (Du kannst :math:`t/div` mit
   horizontalen +/- Reglern einstellen)
   

.. figure:: img/ Activity_21_Fig_06.png
   :name: 21_fig_06
   :align: center

   Präzisions-Vollweggleichrichtermessungen - Absolutwertschaltung


.. note::
   Wie aus der Fig. 6 ersichtlich ist, ist die in Fig. 4 gezeigte
   Schaltung tatsächlich ein Vollwellengleichrichter, bei dem
   Diodenschwellenspannungen KEINE Auswirkungen verursachen, wie dies
   bei Diodengleichrichtern der Fall ist. Wir können auch sehen, dass
   der DC-Offset-Wert nicht vom Gleichrichtungsprozess ausgeschlossen
   ist, was diese Schaltung zu einer **Absolutwertschaltung**
   macht. Der Name **Absolutwertschaltung** ergibt sich aus der Tatsache,
   dass, wie aus der Abbildung 6 ersichtlich, das Ausgangssignal (IN2)
   ein Absolutwert des Eingangssignals (IN1) ist.
   

Fragen
------

1. Was passiert, wenn die Richtung der Dioden umgekehrt wird?
   Wiederholen Sie den Versuch mit umgekehrter Richtung der beiden
   Dioden.
   
2. Was passiert, wenn die Richtung einer Diode entgegengesetzt ist?
   Wiederholen Sie den Versuch mit der umgekehrten Richtung einer
   Diode (D1).
   
