Der Komparator, Positive Feedback und Schmitt Trigger
=====================================================

Zielsetzung
-----------

Ziel dieser Übung ist es, den Spannungskomparator, die Verwendung
einer positiven Rückkopplung und den Betrieb der
Schmitt-Trigger-Konfiguration zu untersuchen. Die Verwendung
herkömmlicher Operationsverstärker als Ersatz für
Spannungskomparatoren wird in grundlegenden
Operationsverstärkerschaltungen beschrieben.



Anmerkungen
-----------

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _AD8561: http://www.analog.com/media/en/technical-documentation/data-sheets/AD8561.pdf
.. _section: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#using-an-op-amp-as-a-comparator
.. _LM317: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#first-step-connecting-dc-power
.. _previous: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#first-step-connecting-dc-power


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab-Board-Hardware beziehen.

Die für die ** 5V ** - Spannungsversorgung verwendeten Steckerstifte
der Verlängerung sind in der Dokumentation hier zu sehen.

Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet.


Hintergrund
-----------

Der Spannungsvergleicher
------------------------
Ein Differenzspannungsvergleicher wie der AD8561_ aus dem analogen
Teilekit hat eine Pinbelegung, die in vielerlei Hinsicht der eines
herkömmlichen Operationsverstärkers ähnelt, jedoch mit vielen
wichtigen Unterschieden (Abbildung 1). Es gibt die üblichen :math:`V_
+` und :math:`V_-` Stromversorgungspins, aber ein Komparator hat auch
einen Masse (GND) Pin. Das Differential :math:`+ IN` und: math:` -IN`
Pins sind im Wesentlichen die gleichen wie bei einem herkömmlichen
Operationsverstärker. Es wird auch einen Ausgangspin wie in einem
Operationsverstärker geben, aber es gibt oft einen zweiten
"invertierenden" (oder komplementären) Ausgang. Auch wenn die Spannung
am Ausgang eines Operationsverstärkers im Allgemeinen nahe bei den
:math:`+` und :math:`-` Versorgungsschienen schwingen kann, schwingt
der Ausgang eines Komparators nur zwischen Masse (gnd) und dem
:math:`0` Versorgung. Dies macht die Ausgabe mehr wie ein
digitales Signal und kompatibel mit Standard-Logikgattern wie
TTL oder CMOS. Der Spannungskomparator kann als ein
Ein-Bit-Analog-Digital-Wandler (ADC) betrachtet werden. Der
AD8561 enthält auch einen LATCH-Eingang, der den Ausgang
zwischenspeichert oder einfriert und verhindert, dass er sich
ändert, selbst wenn sich die Eingänge ändern.
      


.. figure:: img/Activity_18_Fig_1.png

   Abbildung 1: AD8561_ Datenblatt und Pinbelegung

   
Materialien
-----------

- Rotes Pitaya STEMlab
- OPAMP: 1x AD8561_ Spannungskomparator
- Spannungsregler: 1x LM317
- Widerstand: 2x 4,7 :math:`k \ Omega`
- Widerstand: 1x 20 :math:`k \ Omega`
- Widerstand: 1x 47 :math:`k \ Omega`
- Widerstand: 1x 100 :math:`k \ Omega`
- Kondensator: 1x 0.1 :math:`\ mu F`

Richtungen
----------

Konstruieren Sie die Komparator-Testschaltung wie in Abbildung 2 auf
Ihrem Lötplatinen-Board dargestellt. Die zwei Pull-up-Widerstände mit
4,7 kΩ sind optional und werden verwendet, um den positiven
Spitzenausgangswellenwert näher an die + 5-V-Versorgung zu bringen.


.. figure:: img/Activity_18_Fig_2.png

   Abbildung 2: AD8561_ Komparatorschaltung

   
.. note::
   Spannungsvergleicher sind extrem empfindlich gegenüber Störungen
   und Störungen auf der Stromversorgungsschiene. Laute
   Stromversorgungsschiene führt zu Störungen im Ausgangssignal. Diese
   Störimpulse treten bei Schaltschwellenspannungen auf. Mit anderen
   Worten, der Komparator wird einige Schwierigkeiten haben, zu
   entscheiden, V + oder V- einzuschalten, wenn er zwei
   Eingangssignale vergleicht, die von dem Stromversorgungsrauschen
   betroffen sind. Aus diesem Grund verwenden wir hier einen
   Spannungsregler, um unsere Stromversorgungsschiene zu stabilisieren
   und eine verrauschte Ausgabe von dem Komparator zu verhindern.
   
   Sie können direkt die 5-V-Stromversorgungsschiene verwenden und die
   Ergebnisse beobachten und sie mit den mit dem Spannungsregler
   erzielten Ergebnissen vergleichen.
   
   note: Es ist nicht notwendig, die Spannung von 5V auf 2,5V
   herunterzufahren, aber wir haben uns für Einfachheit entschieden.
   


.. figure:: img/ Activity_18_Fig_3.png

   Abbildung 3: AD8561_ Komparatorschaltung auf dem Steckbrett

   
LM317_ Spannungsregler ist im vorherigen Abschnitt beschrieben.

Verfahren
---------

1. Stellen Sie die Dämpfung der Oszilloskopsonden ein; IN1 bis x1 und
   IN2 bis x10
   
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
   
3. Zum Anlegen der Eingangsspannung :math:`V_ {in}` im Menü OUT1
   settings den Amplitudenwert auf 0,5 V und den DC-Offset auf 0,5 V
   setzen. Wählen Sie im Wellenform-Menü DREIECK, Deaktivieren Sie den
   SHOW-Button und wählen Sie enable.
   
4. Stellen Sie im OUT2-Einstellungsmenü den Amplitudenwert auf 0,5 V
   ein, wählen Sie im Wellenformmenü die Option DC und aktivieren Sie
   die Option.
   
5. Stellen Sie im Menü für die IN2-Einstellungen die Sondendämpfung
   auf x10 ein
   
6. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V / div auf 500 mV / div eingestellt ist (Sie können V /
   div einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
7. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN2 V / div auf 1V / div eingestellt ist (Sie können V / div
   einstellen, indem Sie den gewünschten Kanal auswählen und vertikale
   +/- Regler verwenden)
   
8. Stellen Sie sicher, dass OUT2 V / div am linken unteren
   Bildschirmrand auf 500mV / div eingestellt ist (Sie können V / div
   einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
9. Setze t / div Wert auf 200us / div (Du kannst t / div mit
   horizontalen +/- Kontrollen einstellen)
   


.. figure:: img/ Activity_18_Fig_4.png

   Abbildung 4: AD8561_ Komparatorschaltung Messungen

Sie sollten eine Rechteckwelle sehen, die hoch ist (nahe +2,5 V), wenn
der Eingangssignalpegel größer als 0,5 V (OUT2 DC-Wert) und niedrig
(nahe 0 V) ​​ist, wenn das Eingangssignal weniger als 0,5 V beträgt
Pegel der Eingangsdreieckwelle, bei der sich der Ausgang von niedrig
zu hoch und von hoch zu niedrig ändert.


Verbinden Sie jetzt den Kanal IN1 (Einstellung der Sondendämpfung x10
und des IN1-Einstellungsmenüs stellen Sie die Sondendämpfung auf x10
ein) mit dem invertierenden Ausgang (Pin 8). Sie sollten wieder eine
Rechteckwelle mit entgegengesetzter Phase zu Pin 7 (IN2) sehen. Ändern
Sie auch den DC-Pegel von OUT2 (stellen Sie die Amplitude auf 0,7 V
ein) - dies ändert den Schaltpegel des Spannungskomparators, was zu
unterschiedlichen Zeitdauern der HIGH- und LOW-Zustände des
Komparatorausgangs führt. Sie sollten wieder zwei Rechteckwellen mit
entgegengesetzten Phasen, aber jetzt mit entgegengesetzten HIGH- und
LOW-Zeitdauern sehen.


1. Stellen Sie die Dämpfung der Oszilloskopsonden ein; IN1 bis x10 und
   IN2 bis x10
   
2. Stellen Sie im OUT2-Einstellungsmenü den Amplitudenwert auf 0,7 V
   ein, wählen Sie im Wellenformmenü die Option DC, und wählen Sie
   enable.
   
3. Stellen Sie im Einstellungsmenü für IN2 und IN2 die Sondendämpfung
   auf x10 und den Offsetpegel -1700mV ein
   

.. note::
   Aus der obigen Beschreibung können Sie vielleicht sehen, wie man
   ein PWM-Signal (Pulsweitenmodulation) unter Verwendung eines
   Dreiecksignals mit konstanter Frequenz und eines veränderbaren DC
   :math:`V_ {ref}` -Werts erzeugt.
	 


.. figure:: img/ Activity_18_Fig_5.png

   Abbildung 5: AD8561_ beide Ausgangsmessungen bei verschiedenen :math:`V_ {ref} = 0.7V`

   
Untersuchen Sie die fallende Flanke des Rechtecks ​​des Ausgangs (IN2),
indem Sie die Einstellungen für Horizontale Position und Zeit pro
Teilung so anpassen, dass die fallende Kante auf der Zeitachse
zentriert ist und die Zeit pro Div klein genug ist, um die
Übergangszeit der Kante zu sehen (5 US-Dollar / Div). Sie sollten
sehen, dass der Ausgang nicht vom hohen Ausgangspegel bis zum
niedrigen Ausgangspegel auf einmal geht, sondern halbwegs stoppt und
einige Zeit auf einem mittleren Pegel verbleibt, bevor der Rest des
Weges bis zum niedrigen Ausgangspegel fortgesetzt wird. Sie sollten
diese Verzögerung auch beim Übergang von niedrig zu hoch (IN1) sehen.

Diese Verzögerung wird durch Rauschen verursacht, da das
Eingangssignal langsam den Eingangsschwellenwert (in diesem Fall 0,7
Volt) durchläuft und Probleme verursachen kann. Aus diesem Grund ist
es gut, eine rauscharme Stromversorgung und rauscharme Eingangssignale
am Spannungsvergleicher zu haben.

Versuchen Sie die Schaltgeräuschmessung bei einer geräuschvolleren
Stromversorgung zu wiederholen (5V Pin direkt von STEMlab Board)


.. figure:: img/ Activity_18_Fig_6.png

   Abbildung 6: Schaltgeräuschmessungen.

   
.. note::
   Normalerweise besteht unsere Intuition darin, eine hohe
   Wahrscheinlichkeit von Rauschproblemen mit Hochfrequenzsignalen
   zu korrelieren. Im Falle eines Spannungskomparators ist dies
   nicht immer der Fall.
     
   Wenn wir die OUT1-Frequenz ( :math:`V_ {in}`) auf 100 kHz
   erhöhen, ist das Schaltrauschen viel geringer. Weg ist das? Sie
   denken vielleicht so: Spannungsvergleicher hat sehr empfindliche
   Eingänge und vergleicht ständig Werte von :math:`V_ {in}` und
   :math:`V_ {ref}`. Nun stellen wir :math:`V_ {in}` als
   geräuschloses Signal und :math:`V_ {ref} = DC + (-) A_{noise}`.
   Wenn die Dreieckwelle :math:`V_ {in}` Signal sich
   langsam nähert :math:`V_ {ref}` beginnt der
   Spannungsvergleicher zu schalten und wenn die
   :math:`V_{ref}` Amplitude um den DC-Wert schwingt um
   :math:`A_{noise}` der Komparator
	   
   Die Ausgabe ändert die Zustände entsprechend dem
   :math:`V_ {in} - (V_ {ref} = DC + (-) A_ {Rauschen})`
   Verhältnis. Also, so lange
   :math:`V_ {in}` amplitude **bleibt im Bereich** von
   :math:`V_{ref} = DC + (-) A_ {noise}` Wert wird der
   Komparatorausgang effektiv eingeschaltet  :math:`A_{noise}`
   und nicht auf den Eingangssignalen. Einmal :math:`V_ {in}`
   geht unter :math:`V_ {ref} = DC - A_{noise}` oder höher
   :math:`V_ {ref} = DC + A_{noise}` wird der Komparator ausgegeben
   Schalter hoch  oder niedrig, aber jetzt auf Eingangssignalwerte
   nicht auf Rauschwerte. Sie können sehen, dass **
   niederfrequente Dreiecksschwingung ** :math:`V_ {in}
   'Amplitude ** mehr Zeit verbringen wird ** in der
   Nähe von: math:` V_ {ref} = DC + (-) A_ {noise} `
   wodurch der Spannungsvergleicher eine verrauschte
   Ausgabe erzeugt, während die ** hohe
   Frequenzdreieckwelle ** :math:`V_ {in}` die Amplitude
   **schnell vergeht**
   :math:`V_ {ref} = DC + (-) A_{rauschunterdrückender Spannungskomparator, um irgendeine Rauschumschaltung zu erzeugen}`.
		 


.. figure:: img/ Activity_18_Fig_7.png

   Abbildung 7: Schaltvorgang bei hoher Eingangssignalfrequenz (100 kHz)

   
Mit positivem Feedback hinzufügen Hysterese: der Schmitt-Trigger
----------------------------------------------------------------

** Neben der rauscharmen Stromversorgung ist es eine übliche Lösung
für das gerade beschriebene Problem, der Komparatorschaltung eine
Rauschimmunität hinzuzufügen, indem eine Hysterese in die
Übergangsschwellwertspannung ** :math:`V_ {th}` eingebaut wird, wie in
8 gezeigt .

Mit "Hysterese" meinen wir, dass die Schwellenspannung eine Funktion
des aktuellen Betriebszustands des Systems ist, der für diese
Schaltung durch ihre Ausgangsspannung definiert ist: positive oder
negative Sättigung. Weil :math:`V_ {th}`, die Spannung an Pin 2, durch
den aus Widerständen R1 und R2 gebildeten Spannungsteiler bestimmt
wird, ändert sich diese in Reaktion auf eine Änderung der
Ausgangsspannung: sobald der Ausgang als Reaktion auf High gegangen
ist zu einem Eingang, der die Schwellenspannung unterschritten hat,
wird die Schwellenspannung auf einen höheren Wert geändert :math:`V_
{th +}` ( :math:`V_ {ref}` + ein Bruchteil der ausgegebenen
Hochspannung); Umgekehrt ändert eine durchsteigende Eingangsspannung
:math:`V_ {th +}` den Ausgang in seinen niedrigen Zustand und bewirkt,
dass die Schwellenspannung auf einen niedrigeren Wert gesetzt
wird :math:`V_ {th-}` ( :math:`V_ {ref}` - ein Bruchteil der
niedrigen Ausgangsspannung.
      


.. figure:: img/ Activity_18_Fig_8.png

   Abbildung 8: Schmitt-Trigger

Dieser Unterschied zwischen :math:`V_ {th +}` und :math:`V_ {th-}`
bedeutet, dass, sobald ein Übergang durch eine Änderung von :math:`V_
{in}` ausgelöst wird, Rauschunterschreitungen kleiner als diese
Differenz sind auf dem Eingang wird nicht verursachen :math:`V_ {in}`,
um die Hysteresespalte zu überqueren :math:`V_ {hist} = V_ {th +} - V_
{th-}` und eine unerwünschte Umkehrung des Ausgangszustands
verursachen. Wenn die Hysteresespalte groß genug gemacht wird, kann
das System vollständig für das Rauschen des Eingangssignals
undurchlässig gemacht werden, wodurch die störenden Ausgangspegel
eliminiert werden, die von der Basiskomparatorschaltung (Fig. 1)
erlitten werden.


Berechnen der Schwelle
----------------------

Nennen wir die maximalen und minimalen Ausgangsspannungen :math:`V_
{high}` und :math:`V_ {low}`. Die Schwellwertspannung bei der Ausgabe
von :math:`V_ {high}` und bei :math:`V_ {low}` ist:


Die resultierende Hysteresespalte für die Schaltung von Fig. 8 ist gegeben durch:

.. math::
   V_ {th_ {hoch}} = \ frac {R_1} {R_1 + R_2} (V_ {hoch} + V_ {ref}) + V_ {ref} \ quad (1)

   V_ {th_ {niedrig}} = \ frac {R_1} {R_1 + R_2} (V_ {niedrig} - V_ {ref}) + V_ {ref} \ quad (2)


Die resultierende Hysteresespalte für die Schaltung von Fig. 8 ist gegeben durch:

.. math::
   V_ {hist} = V_ {th_ {hoch}} - V_ {th_ {niedrig}} = \ frac {R_1} {R_1 + R_2} (V_ {hoch} - V_ {niedrig}) \ quad (3)


Für den AD8561 mit einer +2,5-V-Stromversorgung und Pull-up-Widerstand
:math:`V_ {hoch} - V_ {niedrig} \ ca. 2,3 V`. Weil das andere Ende des
Spannungsteilers (unten von R1) verbunden ist mit
:math:`V_{ref} = 0,5V`, die Schwellenspannungen :math:`V_ {th_{high}}`
und :math:`V_{th_{low}}` wird um 0,5 V herum zentriert
(:math:`V_{ref}`) unter der Annahme, dass :math:`V_{high}`
und :math:`V_{low}` mehr oder weniger zentriert sind etwa 0,5V).
Wenn Sie die Unterseite von R1 an eine andere
Spannungsreferenzquelle als an die mittlere Stromversorgung
anschließen, wirkt sich dies nicht auf die Hysteresespalte aus,
sondern zentriert diese Lücke um einen Schwellenwert, der
proportional zur neuen Referenzspannung ist. Tatsächlich könnte
der negative Eingangspin des Komparators mit der festen
Referenzspannung und das Ende von R1 als der Eingang verbunden
sein. Dies kehrt die Richtung der beiden Ausgänge um oder
invertiert sie. Die oben angegebenen Werte können in der
Schmitt-Hystereseplotting in Abbildung 9 dargestellt werden.
      


.. figure:: img/ Activity_18_Fig_9.png

   Abbildung 9: Schmitt Hysterese

   
.. note::
   Die Hysteresespaltgleichung stellt eine potentielle Einschränkung
   für das Verhältnis R1 / R2 für einen Schmitt-Trigger dar: wenn R1
   <R2 ist, ist die Hysteresespalte größer als die Hälfte des
   Peak-zu-Peak-Ausgangsspannungshubbereichs des Komparators und
   abhängig von der Referenzspannung der eine oder der andere der
   Schmitt-Trigger-Schwellwerte könnte außerhalb des Bereichs der
   Ausgangsspannung liegen. Unter der Annahme, dass der
   Spannungsbereich des Eingangssignals auch auf den
   Ausgangsschwingungsbereich (mit anderen Worten die
   Stromversorgungsschienen) begrenzt ist, könnte der Ausgang der
   Schaltung blockieren und nicht mehr auf irgendwelche Änderungen der
   Eingabe reagieren, wodurch die Schaltung unbrauchbar wird. 


Verfahren
__________


Fügen Sie die beiden positiven Rückkopplungswiderstände zu Ihrer
Schaltung hinzu, wie in Abbildung 8 gezeigt. Verwenden Sie Werte für
R2 = 100 KΩ und R1 gleich 10 KΩ. Unter Verwendung von IN2 wiederum die
Ausgangsquadratwelle beobachten, aber den Pegel der
Eingangsdreieckwelle notieren, wenn der Ausgang den Pegel von niedrig
zu hoch und von hoch zu niedrig ändert. Erkläre deine
Ergebnisse. Versuchen Sie einen Wert für R2 kleiner als
R1. Funktioniert die Schaltung noch?


1. Stellen Sie die Dämpfung der Oszilloskopsonden ein; IN1 bis x1 und
   IN2 bis x10
   
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
   
3. Zum Anlegen der Eingangsspannung :math:`V_ {in}` im Menü OUT1
   settings den Amplitudenwert auf 0,5 V und den DC-Offset auf 0,5 V
   setzen. Wählen Sie im Wellenform-Menü DREIECK,
   
   Deaktivieren Sie den SHOW-Button und wählen Sie enable.
   
4. Stellen Sie im OUT2-Einstellungsmenü den Amplitudenwert auf 0,5 V
   ein, wählen Sie im Wellenformmenü die Option DC, deaktivieren Sie
   die Option SHOW und wählen Sie enable.
   
5. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V / div auf 200 mV / div eingestellt ist (Sie können V /
   div einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
6. Stellen Sie sicher, dass IN2 V / div am linken unteren
   Bildschirmrand auf 500mV / div eingestellt ist (Sie können V / div
   einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
7. Stellen Sie im Einstellungsmenü IN1 die Sondendämpfung auf x1 und
   den Offsetpegel auf -500 mV ein
   
8. Stellen Sie im IN2-Einstellungsmenü die Sondendämpfung auf x10 und
   den Offsetpegel auf -1000mV ein
   
9. Wählen Sie im Menü TRIGGER settings die Quelle IN2, wählen Sie die
   positive Flanke und stellen Sie den Triggerpegel auf 2V ein
   
10. Setze t / div Wert auf 200us / div (Du kannst t / div mit horizontalen +/- Kontrollen einstellen)


.. figure:: img/ Activity_18_Fig_10.png

   Abbildung 10: Schmitt Hysterese und Ausgangssignal

Vergleichen Sie die Ergebnisse aus Abbildung 10 und Abbildung 4. Sehen
Sie sich die Pegel von IN1 an, wenn IN2 hoch und niedrig wird.


Um zu sehen, ob sich die durch das Eingangsrauschen verursachte
Verzögerung geändert hat, zoomen Sie erneut in die fallenden und
steigenden Flanken der Ausgangsquadratwelle, indem Sie die Einstellung
für die horizontale Position und die Zeit pro Teilung
anpassen. Pausiert der Ausgang auf dem gleichen Zwischenpegel wie der
Übergang oder hat er diese Verzögerung nicht mehr?


1. Wählen Sie im Menü TRIGGER settings die Quelle IN2, wählen Sie die
   positive Flanke, NORMAL und setzen Sie den Triggerpegel auf 2V
   
2. Setze t / div Wert auf 5us / div (Du kannst t / div mit
   horizontalen +/- Kontrollen einstellen)
   

.. figure:: img/ Activity_18_Fig_11.png
	    
   Abbildung 11: Schaltgeräusch mit Hysterese

Wie Sie in Abbildung 11 sehen können, ist bei der Verwendung von
Hysterese kein Schaltgeräusch vorhanden. Vergleichen Sie Abbildung 6
und Abbildung 11.


















































































































































































































