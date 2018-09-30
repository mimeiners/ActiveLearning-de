Der Komparator, Positive Feedback und Schmitt Trigger
=====================================================

Zielsetzung
-----------

Ziel dieser Übung ist es, den Spannungskomparator, die Verwendung von
positiver Rückführung und den Betrieb der
Schmitt-Trigger-Konfiguration zu untersuchen. Die Verwendung
konventioneller Operationsverstärker als Ersatz für
Spannungskomparatoren wird im Abschnitt Grundlegende
Operationsverstärker-Schaltungen beschrieben.




Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signalgeneratoranwendung: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _AD8561: http://www.analog.com/media/en/technical-documentation/data-sheets/AD8561.pdf
.. _section: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#using-an-op-amp-as-a-comparator
.. _LM317: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#first-step-connecting-dc-power
.. _Kapitel: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#first-step-connecting-dc-power


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab
Board Hardware_ geht. Die für die **5V** - Spannungsversorgung
verwendeten Verlängerungsstecker-Pins sind in der Dokumentation_
dargestellt. Die Oszilloskop_ - und Signalgeneratoranwendung wird zum
Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.




Hintergrund
-----------

Der Spannungsvergleicher
------------------------

Ein Differenzspannungskomparator wie der AD8561_ aus dem
Analogteilesatz hat eine Pinbelegung, die in vielerlei Hinsicht der
eines herkömmlichen Operationsverstärkers ähnlich ist, aber viele
wichtige Unterschiede aufweist (:numref:`18_fig_01`). Es gibt die
üblichen :math:`V_+` und :math:`V_-` Spannungsversorgungsstifte, aber
ein Komparator hat auch einen Erdungsstift (GND). Die differentiellen
:math:`+IN` - und :math:`-IN` -Pins sind im Wesentlichen die gleichen
wie bei einem herkömmlichen Operationsverstärker. Es wird auch
einen Ausgangspin wie in einem Operationsverstärker geben, aber
es gibt oft einen zweiten "invertierenden" ("invertierenden")
("komplementären") Ausgang. Auch während die Spannung am Ausgang
eines Operationsverstärkers im Allgemeinen in der Nähe der
:math:`+` und :math:`-` Versorgungsschienen schwingen kann,
schwingt der Ausgang eines Vergleichers nur zwischen Masse
(gnd) und der :math:`+` Versorgung. Dies macht den Ausgang
eher zu einem digitalen Signal und ist kompatibel mit
Standard-Logikgattern wie TTL oder CMOS. Der
Spannungskomparator kann als ein
Single-Bit-Analog-Digital-Wandler (ADC) betrachtet
werden. Der AD8561 beinhaltet auch einen LATCH-Eingang,
der den Ausgang verriegelt oder einfriert und verhindert,
dass er sich ändert, auch wenn sich die Eingänge ändern.
	    
      

.. figure:: img/Activity_18_Fig_01.png
	:name: 18_fig_01
	:align: center
		
	AD8561_ Datenblatt und Pinbelegung

   
Materialien
-----------

- Red Pitaya STEMlab
- OPAMP: 1x AD8561_ Spannungskomparator
- Spannungsregler: 1x LM317
- Widerstand: 2x 4,7 :math:`k\Omega`
- Widerstand: 1x 20 :math:`k\Omega`
- Widerstand: 1x 47 :math:`k\Omega`
- Widerstand: 1x 100 :math:`k\Omega`
- Kondensator: 1x 0.1 :math:`\mu F`

Vorbereitung
------------

Bauen Sie die Vergleichsprüfschaltung wie in :numref:`18_fig_02` auf Ihrer
lötfreien Lochrasterplatine auf. Die beiden Pull-up-Widerstände :math:`4.7,k\Omega`
sind optional und werden verwendet, um den maximalen positiven Ausgangshub
auf näher an die :math:`+5-V` -Versorgung zu erhöhen.

.. figure:: img/Activity_18_Fig_02.png
   :name: 18_fig_02
   :align: center

   AD8561_ Komparatorschaltung

   
.. note::
   Spannungskomparatoren sind extrem empfindlich gegenüber dem Rauschen
   und den Störungen auf der Stromversorgungsschiene. Eine verrauschte
   Stromversorgungsschiene führt zu Störungen des Ausgangssignals. Diese
   Störungen treten bei Schaltschwellenspannungen auf. Mit anderen Worten,
   der Vergleicher wird Schwierigkeiten haben, sich für das Einschalten von
   :math:`V+` oder :math:`V-` zu entscheiden, wenn er zwei Eingangssignale vergleicht, die
   vom Rauschen der Stromversorgung betroffen sind. Aus diesem Grund verwenden
   wir hier einen Spannungsregler, um unsere Stromversorgungsschiene zu
   stabilisieren und eine verrauschte Ausgabe des Vergleichers zu verhindern.
   Sie können es direkt mit der :math:`5,V` -Netzteilschiene versuchen und die
   Ergebnisse beobachten und mit den Ergebnissen des Spannungsreglers vergleichen.
   Hinweis: Es ist nicht notwendig, die Spannung von :math:`5,V` auf :math:`2,5,V`
   herunterzufahren, aber wir haben uns für diese einfache Form entschieden.
   
.. figure:: img/Activity_18_Fig_03.png
   :name: 18_fig_03
   :align: center

   AD8561_ Komparatorschaltung auf dem Steckbrett

   
LM317_ Spannungsregler ist im vorherigen Kapitel_ beschrieben.

Verfahren
---------

1. Stellen Sie die Dämpfung der Oszilloskopsonden ein; IN1 auf x1 und
   IN2 auf x10
   
2. Starten Sie die Oszilloskop & Signalgenerator - Anwendung.
   
3. Zum Anlegen der Eingangsspannung :math:`V_{in}` im Menü OUT1
   Einstellungen den Amplitudenwert auf 0,5 V und den DC-Offset auf 0,5 V
   setzen. Wählen Sie im Wellenform-Menü TRIANGLE, Deaktivieren Sie den
   SHOW-Button und wählen Sie Enable.
   
4. Stellen Sie im OUT2-Einstellungsmenü den Amplitudenwert auf 0,5 V
   ein, wählen Sie im Wellenformmenü die Option DC und aktivieren Sie
   Enable.
   
5. Stellen Sie im Menü für die IN2-Einstellungen die Sondendämpfung
   auf x10 ein
   
6. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 :math:`V/div` auf :math:`500,mV/div` eingestellt ist (Sie können :math:`V/
   div` einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
7. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN2 :math:`V/div` auf :math:`1,V/div` eingestellt ist (Sie können V/div
   einstellen, indem Sie den gewünschten Kanal auswählen und vertikale
   +/- Regler verwenden)
   
8. Stellen Sie sicher, dass OUT2 V / div am linken unteren
   Bildschirmrand auf 500 mV/div eingestellt ist (Sie können V/div
   einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
9. Setze t / div Wert auf 200us / div (Du kannst t / div mit
   horizontalen +/- Kontrollen einstellen)
   


.. figure:: img/Activity_18_Fig_04.png
   :name: 18_fig_04
   :align: center

   AD8561_ Komparatorschaltung Messungen

Sie sollten eine Rechteckwelle sehen, die hoch (etwa :math:`+2.5 V`) ist, wenn der
Eingangssignalpegel größer als :math:`0.5 V` (OUT2 DC-Wert) und niedrig (etwa :math:`0 V`) ist,
wenn das Eingangssignal kleiner als 0.5 V ist. Beachten Sie die Pegel der
Eingangsdreieckswelle, bei denen der Ausgang von niedrig nach hoch und von hoch
nach niedrig wechselt.

Verbinden Sie nun den Kanal IN1 (Einstellung der Sondendämpfung x10 und IN1
Einstellung Menü Sondendämpfung auf x10 einstellen) mit dem invertierenden
Ausgang (Pin 8). Sie sollten wieder eine Rechteckwelle sehen, aber mit entgegengesetzter
Phase zu Pin 7(IN2). Ändern Sie auch den Gleichstrompegel von OUT2
(Amplitude auf :math:`0,7 V` einstellen) - dies ändert den Schaltpegel des
Spannungskomparators und führt zu einer unterschiedlichen Dauer der Zustände
HIGH und LOW des Komparatorausgangs. Du solltest wieder zwei Rechteckwellen mit
entgegengesetzten Phasen sehen, aber jetzt mit entgegengesetzten HIGH und LOW Zeitdauern.


1. Stellen Sie die Dämpfung der Oszilloskopsonden ein; IN1 auf x10 und
   IN2 auf x10
   
2. Stellen Sie im OUT2-Einstellungsmenü den Amplitudenwert auf :math:`0,7 V`
   ein, wählen Sie im Wellenformmenü die Option DC, und wählen Sie
   Enable.
   
3. Stellen Sie im Einstellungsmenü für IN2 und IN2 die Sondendämpfung
   auf x10 und den Offsetpegel -1700mV ein
   

   .. note::
      Aus der obigen Beschreibung können Sie vielleicht sehen, wie man
      ein PWM-Signal (Pulsweitenmodulation) unter Verwendung eines
      Dreiecksignals mit konstanter Frequenz und eines veränderbaren DC
      :math:`V_{ref}` -Werts erzeugt.
	 


.. figure:: img/Activity_18_Fig_05.png
   :name: 18_fig_05
   :align: center

   AD8561_ beide Ausgangsmessungen bei verschiedenen :math:`V_{ref} = 0.7V`

Zoomen Sie in die fallende Flanke der Rechteckwelle des Ausgangs (IN2), indem
Sie die Einstellungen für die horizontale Position und die Zeit pro Teilung so
anpassen, dass die fallende Flanke auf die Zeitachse zentriert ist und die Zeit
pro Teilung klein genug ist, um die Übergangszeit der Flanke (5 uS/div) zu sehen.
Sie sollten sehen, dass der Ausgang nicht vom hohen Ausgangspegel bis zum niedrigen
Ausgangspegel auf einmal geht, sondern teilweise stoppt und einige Zeit auf einem
Zwischenpegel verbringt, bevor er den weiteren Weg zum niedrigen Ausgangspegel geht.
Sie sollten diese Verzögerung auch beim Übergang von Low zu High (IN1) sehen. Diese
Verzögerung wird durch Rauschen verursacht, da das Eingangssignal langsam den
Eingangsschwellenwert (in diesem Fall 0,7 Volt) überschreitet und Probleme
verursachen kann. Aus diesem Grund ist es gut, eine rauscharme Stromversorgung und
rauscharme Eingangssignale am Spannungsvergleicher zu haben. Versuchen Sie, die
Messung des Schaltrauschens an einem verrauschten Netzteil zu wiederholen (5V-Pin direkt vom STEMlab-Board).


.. figure:: img/Activity_18_Fig_06.png
   :name: 18_fig_06
   :align: center

   Schaltgeräuschmessungen.

   
.. note::
   Normalerweise besteht unserer Bestreben darin, eine hohe
   Wahrscheinlichkeit von Rauschproblemen mit hochfrequenten Signalen
   zu korrelieren. Im Falle eines Spannungskomparators ist dies
   nicht immer der Fall. Wenn wir die OUT1-Frequenz (:math:`V_{in}`) auf 100 kHz
   erhöhen, ist das Schaltrauschen viel geringer. Wie ist das möglich? Sie
   denken vielleicht so: Spannungsvergleicher hat sehr empfindliche
   Eingänge und vergleicht ständig Werte von :math:`V_{in}` und
   :math:`V_{ref}`. Stellen wir nun :math:`V_{in}` als
   rauschfreies Signal und :math:`V_{ref} = DC + (-) A_{noise}` ein.
   Wenn sich das Dreieckwellen- :math:`V_{in}` -Signal langsam
   :math:`V_{ref}` nähert, beginnt der Spannungsvergleicher
   zu schalten und wenn die :math:`V_{ref}` -Amplitude um den DC-Wert rauscht,
   ändert der Vergleichsausgang den Zustand entsprechend dem
   :math:`V_{in} - (V_{ref} = DC + (-) A_{Rauschen})` -Verhältnis. Solange
   die :math:`V_{in}` -Amplitude also im **Bereich** von
   :math:`V_{ref} = DC + (-) A_{noise}` -Wertes **bleib** schaltet der
   Komparatorausgang effektiv das Rauschen ein und nicht die
   Eingangssignale. Sobald :math:`V_{in}` unter :math:`V_{ref} = DC - A_{noise}`
   oder über :math:`V_{ref} = DC + A_{noise}` geht, schaltet der Komparator hoch oder niedrig,
   aber jetzt auf Eingangssignalwerte und nicht auf Rauschwerte. Sie können sehen, dass die
   **niederfrequente Dreieckwelle** :math:`V_{in}` **mehr Zeit** in der
   Nähe von :math:`V_{ref} = DC + (-) A_{noise}` **verbringen wird**,
   was dazu führt, dass der Spannungsvergleicher verrauschte Signale erzeugt,
   während die **hochfrequente Dreieckwelle** :math:`V_{in}`  **schnell** durch den
   :math:`V_{ref} = DC + (-) A_{noise}` -Bereich **geht** und verhindert, dass der Komparator ein rauschen erzeugt.
		 


.. figure:: img/Activity_18_Fig_07.png
   :name: 18_fig_07
   :align: center

   Schaltvorgang bei hoher Eingangssignalfrequenz (100 kHz)

   
Mit positiver Rückkopplung zur Hysterese: der Schmitt-Trigger
-------------------------------------------------------------

**Neben der rauscharmen Stromversorgung besteht eine gemeinsame Lösung für
das soeben skizzierte Problem darin, der Vergleichsschaltung eine Störfestigkeit
hinzuzufügen, indem die Hysterese in die Übergangsschwellenspannung** :math:`V_{th}` integriert wird, wie in
:numref:`18_fig_08` dargestellt. Unter "Hysterese" verstehen wir, dass die Schwellenspannung
eine Funktion des aktuellen Betriebszustandes des Systems ist, der für diese Schaltung
durch seine Ausgangsspannung definiert ist: positive oder negative Sättigung. Da :math:`V_{th}`,
die Spannung an Pin 2, durch den aus den Widerständen :math:`R1` und :math:`R2` gebildeten Spannungsteiler
bestimmt wird, ändert sie sich als Reaktion auf eine Änderung der Ausgangsspannung:
Sobald der Ausgang als Reaktion auf einen Eingang, der die Schwellenspannung
unterschritten hat, hochgegangen ist, wird die Schwellenspannung auf einen höheren
Wert :math:`V_{th+}` ( :math:`V_{ref}` + ein Bruchteil der Ausgangshochspannung) geändert; umgekehrt ändert
eine durch :math:`V_{th+}` ansteigende Eingangsspannung den Ausgang in ihren niedrigen Zustand
und bewirkt, dass die Schwellenspannung auf einen niedrigeren
Wert :math:`V_{th}` - ( :math:`V_{ref}` - ein Bruchteil der Ausgangsniederspannung) eingestellt wird.


.. figure:: img/ Activity_18_Fig_08.png
   :name: 18_fig_08
   :align: center

   Schmitt-Trigger

Diese Differenz zwischen :math:`V_{th+}` und :math:`V_{th-}` bedeutet, dass Rauschauslenkungen,
die kleiner als diese Differenz am Eingang sind, :math:`V_{in}` nicht dazu veranlassen,
die Hystereselücke :math:`V_{hist} = V_{th+} - V_{th-}` zu überschreiten und eine unerwünschte
Umkehrung des Ausgangszustands bewirken. Wenn der Hysteresespalt groß genug
ist, kann das System vollständig undurchlässig für das Rauschen des
Eingangssignals gemacht werden, wodurch die störenden Ausgangspegel der
grundlegenden Vergleichsschaltung eliminiert werden (:numref:`18_fig_01`).


Berechnung des Schwellenwertes
------------------------------

Lassen Sie uns die maximalen und minimalen Ausgangsspannungen
:math:`V_{high}` und :math:`V_{low}` nennen. Die Schwellenspannung, wenn der
Ausgang auf :math:`V_{high}` und :math:`V_{low}` steht, ist:

.. math::
   :label: 18_eq_1
   
   V_{th_{high}} = \frac{R_1}{R_1 + R_2} (V_{high} + V_{ref}) + V_{ref}
   

.. math::
   :label: 18_eq_2
	   
   V_{th_{low}} = \frac{R_1}{R_1 + R_2} (V_{low} - V_{ref}) + V_{ref}


Die resultierende Hystereselücke für die Schaltung von :numref:`18_fig_08` ist gegeben durch:

.. math::
   :label: 18_eq_3
	   
   V_{hist} = V_{th_{hoch}} - V_{th_{niedrig}} = \frac{R_1}{R_1 + R_2} (V_{hoch} - V_{niedrig})

Für den AD8561 mit :math:`+2,5 V` Spannungsversorgung und Pull-up-Widerstand,
beträgt :math:`V_{high} - V_{low} \approx 2,3 V`. Da das andere Ende des Spannungsteilers (unten bei :math:`R1`)
mit :math:`V_{ref} = 0,5 V` verbunden ist, werden die Schwellenspannungen :math:`V_{th_{high}} und V_{th_{low}}`
um :math:`0,5 V` (:math:`V_{ref}`) zentriert, vorausgesetzt, dass :math:`V_{high}` und :math:`V_{low}` mehr oder weniger
um :math:`0,5 V` zentriert sind). Das Anschließen des unteren Teils von :math:`R1` an eine andere
Spannungs-Referenzquelle und nicht an die mittlere Versorgung hat keinen Einfluss
auf die Hysterese, sondern zentriert diese um einen Schwellenwert, der proportional
zur neuen Referenzspannung ist. Tatsächlich könnte der negative Eingangspin des
Vergleichers an die feste Referenzspannung angeschlossen werden und das Ende von :math:`R1`
als Eingang betrachtet werden. Dadurch wird der Sinn der beiden Ausgänge umgekehrt
oder umgekehrt. Die oben genannte Darstellung kann im Schmitt-Hysterese-Plot
in :numref:`18_fig_09` dargestellt werden.
      


.. figure:: img/ Activity_18_Fig_09.png
   :name: 18_fig_09
   :align: center

   Schmitt Hysterese

   
.. note::
   Die Hysteresegleichung stellt eine potenzielle Einschränkung des
   Verhältnisses :math:`R1` / :math:`R2` für einen Schmitt-Trigger dar: Sofern :math:`R1` < :math:`R2` fehlt,
   ist die Hysteresegrenze größer als die Hälfte des Peak-to-Peak-Ausgangsspannungshubbereichs
   des Vergleichers und je nach Referenzspannungswert kann die eine oder
   andere der Schmitt-Triggergrenzen außerhalb des Bereichs der Ausgangsspannung
   liegen. Angenommen, der Eingangssignalspannungsbereich ist ebenfalls auf den
   Ausgangshubbereich beschränkt (d.h. die Stromversorgungsschienen), dann könnte
   der Ausgang der Schaltung blockieren und nicht mehr auf Änderungen im Eingang
   reagieren, was die Schaltung unbrauchbar macht.

Verfahren
---------


Fügen Sie die beiden positiven Rückkopplungswiderstände zu Ihrer
Schaltung hinzu, wie in :numref:`18_fig_08` dargestellt. Verwenden Sie Werte für
:math:`R2 = 100 k /Omega` und :math:`R1 = 10 k /Omega`. Mit IN2 beobachten Sie erneut
die Ausgangsrechteckwelle, notieren Sie aber den Pegel der Eingangsdreieckwelle,
wenn der Ausgang den Pegel von niedrig nach hoch und hoch nach niedrig ändert.
Versuchen Sie einen Wert für :math:`R2` kleiner als :math:`R1`.
Funktioniert die Schaltung noch?


1. Stellen Sie die Dämpfung der Oszilloskopsonden ein; IN1 auf x1 und
   IN2 auf x10
   
2. Starten Sie die Oszilloskop & Signalgenerator - Anwendung.
   
3. Zum Anlegen der Eingangsspannung :math:`V_{in}` im Einstellungsmenu OUT1
   den Amplitudenwert auf 0,5 V und den DC-Offset auf 0,5 V
   setzen. Wählen Sie im Wellenform-Menü TRIANGLE,
   Deaktivieren Sie den SHOW-Button und wählen Sie Enable.
   
4. Stellen Sie im OUT2-Einstellungsmenu den Amplitudenwert auf 0,5 V
   ein, wählen Sie im Wellenformmenü die Option DC, deaktivieren Sie
   die Option SHOW und wählen Sie Enable.
   
5. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V/div auf 200 mV/div eingestellt ist (Sie können V/div
   einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
6. Stellen Sie sicher, dass IN2 V/div am linken unteren
   Bildschirmrand auf 500 mV/div eingestellt ist (Sie können V/div
   einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
7. Stellen Sie im Einstellungsmenü IN1 die Sondendämpfung auf x1 und
   den Offsetpegel auf -500 mV ein
   
8. Stellen Sie im IN2-Einstellungsmenü die Sondendämpfung auf x10 und
   den Offsetpegel auf -1000mV ein
   
9. Wählen Sie im Menü TRIGGER die Quelle IN2, wählen Sie die
   positive Flanke und stellen Sie den Triggerpegel auf 2V ein
   
10. Setze t/div Wert auf 200 us/div (Du kannst t/div mit horizontalen +/- Kontrollen einstellen)


.. figure:: img/ Activity_18_Fig_10.png
   :name: 18_fig_10
   :align: center

   Schmitt Hysterese und Ausgangssignal

   
Vergleichen Sie die Ergebnisse aus :numref:`18_fig_10` und :numref:`18_fig_04`.
Betrachten Sie die Pegel von IN1, wenn IN2 hoch und runter geht.

Um zu sehen, ob sich die durch das Eingangsrauschen verursachte Verzögerung
geändert hat, zoomen Sie erneut in die fallende und steigende Flanke der
Ausgangsrechteckwelle, indem Sie die horizontale Position und die Zeit pro Division
einstellen. Pausiert der Ausgang auf dem gleichen Zwischenpegel wie die Übergänge
oder hat er diese Verzögerung nicht mehr?




1. Wählen Sie im Menü TRIGGER die Quelle IN2, wählen Sie die
   positive Flanke, NORMAL und setzen Sie den Triggerpegel auf 2V
   
2. Setze t/div Wert auf 5 us/ iv (Du kannst t/div mit
   horizontalen +/- Kontrollen einstellen)
   

.. figure:: img/ Activity_18_Fig_11.png
   :name: 18_fig_11
   :align: center
	    
   Schaltgeräusch mit Hysterese

   
Wie Sie aus :numref:`18_fig_11` ersehen können, ist bei Verwendung der Hysterese
kein Schaltrauschen vorhanden. Vergleichen Sie :numref:`18_fig_06` und :numref:`18_fig_11`.
