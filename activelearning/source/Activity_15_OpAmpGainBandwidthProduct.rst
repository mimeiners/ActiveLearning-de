OPAMP Verstärkungsbandbreite Produkt
====================================

Zielsetzung
-----------

Ziel dieser Übung ist es, einen Schlüsselparameter zu untersuchen, der
die Leistung von Operationsverstärkern bei hohen Frequenzen
beeinflusst. Der Parameter ist der **Verstärkungsbandbreitenprodukt**
(:math:`GBW`) oder die Verstärkungsbandbreite der Einheit.


Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _hier: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Bode: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/bode/bode.html
.. _begrenzt: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity14_OPAMPOpenLoopGain.html#opamp-open-loop-gain
.. _invertierenden: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
.. _Verstärker: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
.. _Spannungsteiler: https://de.wikipedia.org/wiki/Spannungsteiler


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab
Board Hardware_ geht. Die Erweiterungsstecker-Pins für die
Spannungsversorgung **-3,3V** und **+3,3V** sind in der Dokumentation
hier_ zu entnehmen. Die Anwendung des Bode_ - Analysators wird
verwendet, um den Frequenzgang der Operationsverstärker-Schaltung zu
messen.



Materialien
-----------

- Red Pitaya STEMlab
- OPAMP: 1x OP97
- Widerstand: 2x 100 :math:`\Omega`
- Widerstand: 1x 47 :math:`k\Omega`
- Widerstand: 1x 100 :math:`k\Omega`
- Widerstand: 2x 10 :math:`k\Omega`

Hintergrund
-----------

Die Vorwärtsverstärkung, :math:`G`, ist definiert als die Verstärkung
des Operationsverstärkers, wenn ein Signal differentiell und ohne
negative Rückkopplung in den Verstärker eingespeist wird. Diese
Verstärkung ist bei allen Frequenzen idealerweise unendlich, aber in
einem echten Operationsverstärker ist sie begrenzt_ und hängt von der
Frequenz ab. Bei niedriger Frequenz ist die Verstärkung maximal, nimmt
mit zunehmender Frequenz linear ab und hat einen Wert von eins bei der
Frequenz, die allgemein als Einheitsverstärkung- oder Grenzfrequenz
:math:`f_{c}` bezeichnet wird (in Gleichungsform,
:math:`G(f_c)=1`). Für den **OP97** beträgt die
**Verstärkungsfrequenz 900 kHz**, die **Verstärkung im
offenen Regelkreis bei dieser Frequenz ist einfach
eins**. Dies ist auch die Closed-Loop-Bandbreite oder die
maximale Frequenz, wenn die Rückführung mit einer
Closed-Loop-Verstärkung von 1 konfiguriert
ist. :math:`G_f` ist definiert als das
**Verstärkungs-Bandbreitenprodukt** :math:`GBW`, und für
alle Eingangsfrequenzen ist dieses Produkt konstant und
gleich :math:`f_c`. Die Verstärkung kann als einfache Zahl
(Betrag) oder in dB(Dezibel) angegeben werden.
	    

.. math::
   \text{GBW} &= \text{Gewinn} \cdot f_c

   \text{GBW} &= \text{Gewinn} \cdot \text{BW}
   

wobei :math:`f_c` die Grenzfrequenz ist (bei :math:`f_c` verringer
sich die Verstärkung um -3dB (-3dB = :math:`1/ \sqrt{2}` Abfall in der
Signalamplitude)) und :math:`BW` Frequenzbandbreite in diesem Fall
gegeben als :math:`BW = f_c`


:numref:`15_fig_01` aus dem OP97-Datenblatt veranschaulicht diesen
Zusammenhang grafisch. Wenn eine Rückkopplung wie bei einem
invertierenden_  Verstärker_  vorgesehen ist, wird die
Verstärkung durch G = -R2/R1 angegeben; es muss jedoch
beachtet werden, dass die Größe dieser Verstärkung niemals die
Verstärkung überschreiten kann, die durch das
Bandbreitenprodukt gegeben ist.
	

	
.. _15_fig_01:
.. figure:: img/ Activity_15_Fig_01.png
	    
   OP97 Open-Loop-Verstärkung, Phase vs. Frequenz


   
.. note::
   Sie sollten daran denken, Folgendes zu beachten: Die maximale Frequenz des "Normalbetriebs"
   (d.h. die Frequenzbandbreite, d.h. die Grenzfrequenz, d.h. die Frequenz, bei der die
   Verstärkung um 3dB sinkt) Ihrer Operationsverstärkerschaltung (Verstärker) in nicht
   invertierender oder invertierender Konfiguration wird IMMER vom Gewinn abhängig sein.
   **Wenn Sie eine höhere Verstärkung wählen, ist die Frequenzbandbreite niedriger und umgekehrt.**

   Zum Beispiel: Wenn wir einen invertierenden Verstärker mit Verstärkung = 100 basierend
   auf OP97 haben wollen, dann wird unsere Frequenzbandbreite als:

   
    .. math::
        BW = GBW_{OP927}/100 = 900 kHz / 100 = 9 kHz
    
    für Verstärkung = 1000
    
    .. math::
         BW = GBW_{OP927}/1000 = 900 kHz / 1000 = 900 Hz




Verfahren
---------

Bauen Sie die in :numref:`15_fig_02` gezeigte Schaltung auf Ihrer
lötfreien Lochrasterplatine auf, um den Frequenzgang eines
Umkehrverstärkers zu messen, der mit einer geschlossenen
Regelverstärkung von 1000 konfiguriert ist. Da die Verstärkung der
Schaltung so hoch ist, muss die Schaltung mit einem sehr kleinen
Eingangssignal betrieben werden. Um mit dem STEMlab-Generator ein
Kleinsignal zu erzeugen, wird ein 1/1000- Spannungsteiler_ [R3 -
(R4|||R1)] verwendet, um das 2V p2p-Sinussignal am Eingang des
Wechselrichters auf 2 mV p2p zu reduzieren. Die Parallelkombination
von R4 und R1 ist 50 KΩ, was bei den 47 KΩ R3 zu einem
Teilerverhältnis nahe 1/1000 führt.


.. _15_fig_02:
.. figure:: img/ Activity_15_Fig_02.png

   Invertierender Verstärker mit Verstärkung von 1000

   
.. Warnung::
   Bevor Sie die Schaltung an die STEMlab-Pins -3,3V und +3,3V anschließen,
   überprüfen Sie Ihre Schaltung nochmals. Die Spannungsversorgungsstifte -3,3V
   und +3,3V haben keine Schutzschaltung und können im Falle eines
   Kurzschlusses beschädigt werden.
   
   
1. Bauen Sie die Filterschaltung wie in :numref:`15_fig_02` auf Ihrem
   lötfreien Steckbrett mit den Komponentenwerten R1 = R4 = 100 Ω, R2
   = 100 kΩ und R3 = 47 kΩ auf.
   

2. Starten Sie die Anwendung Bode analyzer. Die Bode-Analysatoranwendung führt einen
   Frequenzdurchlauf durch, so dass sie ein Sinussignal auf :math:`OUT1` innerhalb des von uns
   gewählten Frequenzbereichs (im Einstellungsmenü) erzeugt. Das Eingangssignal :math:`IN1` ist
   direkt mit :math:`OUT1` verbunden, gefolgt von :math:`IN1=V_{in}`. :math:`IN2` wird auf der anderen Seite des
   Filters und daraus :math:`IN2=V_{out}` angeschlossen. Die Anwendung des Bode-Analysators nimmt
   dann für jeden Frequenzschritt das Verhältnis von :math:`IN1/IN2` (:math:`V_{in}/V_{out}`) und
   berechnet den Frequenzgang.

3. Stellen Sie im Bode-Analyzer-Einstellungsmenü Folgendes ein:

- Startfrequenz: 100 Hz
- Endfrequenz: 20 kHz
- Anzahl der Schritte: 50
- Skallierung: Log
- Wählen Sie die RUN-Taste

  
.. _15_fig_03:
.. figure:: img/ Activity_15_Fig_03.png

   Typischer OP97 Bode Plot Gain = 1000

   
Aus der :numref:`15_fig_03` können wir ersehen, dass Theorie und
OP97-Datenblatt mit der Messung übereinstimmen. Bei Verstärkung = 1000
ist das BW 900Hz. R2 auf 10 kΩ einstellen, R3 = 4,7 kΩ, die Messungen
wiederholen und die Ergebnisse beobachten.


.. _15_fig_04:
.. figure:: img/ Activity_15_Fig_04.png

   Typischer OP97 Bode Plot Gain = 100

Wie wir aus der Abbildung 4 für x10 weniger Verstärkung ersehen
können, wird das BW um x10 erhöht, was die Gleichung :math:`GBW = BW ∗
Gain = const` bestätigt.























































































































