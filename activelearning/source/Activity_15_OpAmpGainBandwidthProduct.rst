OPAMP Verstärkungsbandbreite Produkt :math:`GBW`
################################################

Zielsetzung
___________

Ziel dieser Übung ist es, einen Schlüsselparameter zu untersuchen, der die Leistung von Operationsverstärkern bei hohen Frequenzen beeinflusst. Der Parameter ist der **Verstärkungsbandbreitenprodukt** (:mazh:`GBW`) oder die Verstärkungsbandbreite der Einheit.

Anmerkungen
___________

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _hier: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Bode: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/bode/bode.html
.. _finite: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity14_OPAMPOpenLoopGain.html#opamp-open-loop-gain
.. _inverting: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
.. _amplifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
.. _voltage: https://en.wikipedia.org/wiki/Voltage_divider
.. _divider: https://en.wikipedia.org/wiki/Voltage_divider

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht. Die Erweiterungsstecker-Pins für die Spannungsversorgung -3,3V und +3,3V sind in der Dokumentation hier_ zu entnehmen. Die Anwendung des Bode_ - Analysators wird verwendet, um den Frequenzgang der Operationsverstärker-Schaltung zu messen.


Materialien
___________

- Rotes Pitaya STEMlab
- OPAMP: 1x OP97
- Widerstand: 2x 100 :math:`\Omega`
- Widerstand: 1x 47 :math:`k\Omega`
- Widerstand: 1x 100 :math:`k\Omega`
- Widerstand: 2x 10 :math:`k\Omega`

Hintergrund
___________

Die Vorwärtsverstärkung,: math: "G" ist definiert als die Verstärkung des Operationsverstärkers, wenn ein Signal differentiell in den Verstärker eingespeist wird, ohne dass eine negative Rückkopplung angelegt ist. Diese Verstärkung ist bei allen Frequenzen idealerweise unendlich, aber bei einem echten Operationsverstärker ist sie endlich und hängt von der Frequenz ab. Bei niedriger Frequenz ist die Verstärkung maximal, nimmt linear mit steigender Frequenz ab und hat einen Wert von eins bei der Frequenz, die allgemein als die Einheitsverstärkung oder Grenzfrequenz bezeichnet wird :math:`f_ {c}` (in der Gleichungsform, :math:`G (f_c) = 1`). Für den Operationsverstärker ** OP97 ** beträgt die Verstärkungsfrequenz ** 900 kHz **, die Verstärkung ** Open-Loop bei dieser Frequenz ist einfach eins **. Dies ist auch die Closed-Loop-Bandbreite oder die maximale Frequenz, wenn die Rückkopplung mit einer Regelkreisverstärkung von 1 konfiguriert ist :math:`G_f` ist definiert als das ** Verstärkungs-Bandbreite-Produkt **,
 :math:`GBW`, und für alle Eingangsfrequenzen ist dieses Produkt konstant und gleich :math:`f_c`. Die Verstärkung kann als einfache Zahl (Magnitude) oder in dB (Dezibel) angegeben werden.

.. math::
GBW = Gewinn * f_c

oder

GBW = Gewinn * BW

Dabei gilt :math:`f_c` ist die Grenzfrequenz (bei :math:`f_c` wird um -3dB verringert (-3dB = :math:`1 / \ sqrt {2}` drob in der Signalamplitude))
und :math:`BW` Frequenzbandbreite in diesem Fall gegeben als: math:` BW = f_c`

Abbildung 1 aus dem OP97-Datenblatt veranschaulicht diese Beziehung grafisch. Wenn eine Rückkopplung bereitgestellt wird, wie in einem invertierenden Verstärker, ist die Verstärkung gegeben durch G = -R2 / R1; Es muss jedoch erkannt werden, dass die Größe dieser Verstärkung niemals die Verstärkung übersteigen kann, die durch das Verstärkungs-Bandbreite-Produkt gegeben ist.

.. figure:: img/ Activity_15_Fig_01.png

Abbildung 1: OP97 Open-Loop-Verstärkung, Phase vs. Frequenz

.. note::

    Sie sollten folgendes beachten: Die maximale Frequenz des "normalen Betriebs" (dh Frequenzbandbreite, dh Grenzfrequenz, dh Frequenz, bei der die Verstärkung um 3 dB abfällt) Ihrer Operationsverstärkerschaltung (Verstärker) in nicht invertierender oder invertierender Konfiguration ist IMMER abhängig von der GAIN. ** Wenn Sie eine höhere Verstärkung wählen, ist die Frequenzbandbreite geringer und umgekehrt. **

    Beispielsweise:
    Wenn wir einen invertierenden Verstärker mit Verstärkung = 100 basierend auf OP97 haben wollen, wird unsere Frequenzbandbreite wie folgt angegeben:
    
    .. math::
        BW = GBW_ {OP927} / 100 = 900 kHz / 100 = 9 kHz
    
    für Verstärkung = 1000
    
    .. math::
         BW = GBW_ {OP927} / 1000 = 900 kHz / 1000 = 900 Hz




Verfahren
_________

Bauen Sie die in Abbildung 2 gezeigte Schaltung auf Ihrem lötfreien Steckbrett auf, um den Frequenzgang eines invertierenden Verstärkers mit einer Verstärkung von 1000 zu messen. Da die Verstärkung der Schaltung so hoch ist, muss die Schaltung mit einem sehr kleinen Eingangssignal betrieben werden. Um ein kleines Signal mit dem STEMlab-Generator zu erzeugen, wird ein 1/1000-Spannungsteiler [R3 - (R4 || R1)] verwendet, um das 2 V p2p-Sinussignal auf 2 mV p2p am invertierenden Verstärkereingang zu reduzieren. R4 und R1 sind aufgrund der "virtuellen Masse" an Pin 2 effektiv parallel. Die parallele Kombination von R4 und R1 beträgt 50 Ω, was bei 47 KΩ R3 zu einem Teilerverhältnis nahe 1/1000 führt.


.. figure:: img/ Activity_15_Fig_02.png

Abbildung 2: Invertierender Verstärker mit Verstärkung von 1000

.. Warnung::
      Bevor Sie den Stromkreis an die STEMlab -3.3V und + 3.3V Anschlüsse anschließen, überprüfen Sie Ihren Stromkreis. Die Spannungsversorgungsstifte -3,3 V und + 3,3 V haben keinen Kurzschluss und können im Falle eines Kurzschlusses beschädigt werden.


1. Richten Sie die Filterschaltung wie in Abbildung 2 auf Ihrem lötfreien Steckbrett mit den Komponentenwerten R1 = R4 = 100 Ω, R2 = 100 kΩ und R3 = 47 kΩ ein.

2. Starten Sie die Bode-Analyseanwendung. Die Bode-Analysator-Anwendung führt einen Frequenzsweep so durch, dass ein Sinussignal erzeugt wird :math:`OUT1` innerhalb des von uns gewählten Frequenzbereichs (im Einstellungsmenü).  :math:`IN1` Eingangssignal ist direkt verbunden mit: math:` OUT_1` folgt :math:`IN1 = V_ {in}`.  :math:`IN2` ist auf der anderen Seite des Filters verbunden und von diesem: math:` IN2 = V_ {out} `. Die Bode-Analysator-Anwendung nimmt dann für jeden Frequenzschritt das Verhältnis von :math:`IN1 / IN2` ( :math:`V_ {in} / V_ {out}` ) und berechnet den Frequenzgang.

3. Stellen Sie im Bode-Analyzer-Einstellungsmenü Folgendes ein:

- Startfrequenz: 100 Hz
- Endfrequenz: 20 kHz
- Anzahl der Schritte: 50
- Maßstab: Protokoll
- Wählen Sie die RUN-Taste


.. figure:: img/ Activity_15_Fig_03.png

Abbildung 3: Typischer OP97 Bode Plot Gain = 1000

Aus der Abbildung 3 können wir sehen, dass die Daten der Theorie und des OP97-Datenblattes mit der Messung übereinstimmen. Bei Gain = 1000 beträgt das BW 900Hz.
Stellen Sie R2 auf 10 kΩ, R3 = 4,7 kΩ, wiederholen Sie die Messungen und beobachten Sie die Ergebnisse.

.. figure:: img/ Activity_15_Fig_04.png

Abbildung 3: Typischer OP97 Bode Plot Gain = 100

Wie wir aus der Abbildung 4 für x10 weniger Verstärkung sehen können, wird das BW um x10 erhöht
Gleichung :math:`GBW = BW * Verstärkung = const`.






















































































































