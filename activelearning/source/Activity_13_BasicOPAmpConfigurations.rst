Grundlegende OP-Verstärkerkonfigurationen
=========================================

Zielsetzung
-----------

In diesem Labor stellen wir den Operationsverstärker (Opams) vor, eine aktive Schaltung, die mit bestimmten Eigenschaften (hoher Eingangswiderstand, niedriger Ausgangswiderstand und große Differenzverstärkung) ausgestattet ist, die ihn zu einem nahezu idealen Verstärker und nützlichen Baustein in vielen Schaltungsanwendungen macht. In diesem Labor erfahren Sie mehr über DC-Vorspannung für aktive Schaltungen und erkunden einige der grundlegenden funktionalen Operationsverstärker-Schaltungen. Wir werden dieses Labor auch nutzen, um die Fähigkeiten mit der Laborhardware weiterzuentwickeln.


Anmerkungen
___________

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _hier: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html


In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab - Board - Hardware_ beziehen.

Oscilloscope_ & Signal_  generator_  Anwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.

Erweiterungssteckerstift, der als 5V-Spannungsquelle verwendet wird, finden Sie in der Dokumentation hier_.


Materialien
-----------

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10
- OPAMP: 1x AD8541 (CMOS-Rail-to-Rail-Verstärker)
- LED: 1x
- Widerstand: 4x 1 :math:`k\Omega`
- Widerstand: 3x 4,7 :math:`k\Omega`
- Widerstand: 2x 10 :math:`k\Omega`
- Widerstand: 1x 20 :math:`k\Omega`
- Kondensator: 1x 1 :math:`\mu F`

  
Operationsverstärker-Grundlagen
-------------------------------

.. _LM317: http://www.ti.com/lit/ds/symlink/lm317.pdf
.. _einstellbaren: http://www.ti.com/lit/ds/symlink/lm317.pdf
.. _Spannungsregler: http://www.ti.com/lit/ds/symlink/lm317.pdf
.. _E2: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Anschluss: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2

Erster Schritt: Anschließen der Gleichstromversorgung
-----------------------------------------------------
Operationsverstärker müssen immer mit Gleichstrom versorgt werden, daher ist es ratsam, diese Anschlüsse zuerst zu konfigurieren, bevor andere Schaltungskomponenten hinzugefügt werden. :numref:`13_fig_01` zeigt eine mögliche Leistungsanordnung auf Ihrer Steckplatine. Wir verwenden zwei der langen Schienen für die positive Versorgungsspannung und Masse. Mit dem einstellbaren_  Spannungsregler_  LM317_ stellen wir eine 2,5 V mittlere Versorgungsschiene zur Verfügung, die eventuell benötigt wird.


.. note::
   STEMlab-Boards haben keinen 2,5V DC-Ausgangspin, daher verwenden wir den einstellbaren Regler LM317, um eine 2,5V DC-Schiene aus einer 5V-Schiene bereitzustellen. Der Anschluss des LM317 ist sehr einfach und wird im Folgenden beschrieben. Die Gleichung zur Berechnung der Ausgangsspannung ist gegeben als:
      
   .. math::
      V_ {out} = 1.25\bigg(1+\frac{R_2}{R_1}\bigg)\quad   (1).


Dazu gehört der so genannte " Netzentkopplungs- " Kondensator, der zwischen Netzteil und Erdungsschienen geschaltet ist. Es ist noch zu früh, um den Zweck dieser Kondensatoren ausführlich zu diskutieren, aber sie werden verwendet, um das Rauschen auf den Versorgungsleitungen zu reduzieren und parasitäre Schwingungen zu vermeiden. Es gilt als gute Praxis im analogen Schaltungsdesign, immer kleine Bypass-Kondensatoren in der Nähe der Versorgungsanschlüsse jedes Operationsverstärkers in Ihrer Schaltung zu verwenden.

.. _13_fig_01:
.. figure:: img/ Activity_13_Fig_01.png

	    :Stromanschlüsse mit 5-V-Stromanschluss von E2_ - Anschluss_ und LM317_  einstellbaren_  Spannungsregler_

Es ist eine gute Praxis, die Anzeige der Stromversorgung zu haben. Dazu verwenden wir LED, die an die 2,5V-Schiene angeschlossen sind. Wenn die Spannung an dieser Schiene anliegt, leuchtet die LED auf. Da 2,5V von der 5V-Schiene geliefert werden, zeigt die gleiche LED auch den "OK"-Status der 5V-Versorgung an. Stecken Sie den LM317 und den Operationsverstärker in Ihre Leiterplatte und fügen Sie die Drähte, Widerstände, LED- und Versorgungskondensatoren hinzu, wie in :numref:`13_fig_01` dargestellt. Um später Probleme zu vermeiden, können Sie ein kleines Etikett auf der Lochrasterplatine anbringen, das angibt, welche Schienen +5 V, +2,5 V und GND entsprechen.

Als nächstes verbinden Sie die +5 V Versorgungs- und GND-Anschlüsse von der STEMlab-Platine mit den Klemmen auf Ihrer Lochrasterplatine. Verwenden Sie Brückendrähte, um die Schienen mit Strom zu versorgen. Denken Sie daran, dass die GND-Klemme der Stromversorgung unsere Referenz für die "Masse" der Schaltung ist. Sobald Sie Ihre Versorgungsanschlüsse haben, können Sie ein DMM verwenden, um die IC-Pins direkt zu messen, um sicherzustellen, dass Pin 7 bei +5 V liegt, Pin 4 bei 0 V (Masse) und 2,5 V Schiene zu überprüfen. Denken Sie daran, dass Sie das STEMlab einschalten müssen, bevor Sie die Spannungen mit dem Spannungsmesser messen.

.. _13_fig_02:
.. figure:: img/ Activity_13_Fig_02.png

	    :Stromanschlüsse

   
Erster Schritt: Unity-Gain Amplifier (Spannungsfolger)
------------------------------------------------------

Unsere erste Operationsverstärkerschaltung ist eine einfache, in :numref:`13_fig_03` gezeigte Schaltung. Dies wird als Unity-Gain-Puffer oder manchmal nur als Spannungsfolger bezeichnet, der durch die Übertragungsfunktion definiert ist :math:`V_ {out} = V_{in}`. Auf den ersten Blick mag es wie ein nutzloses Gerät erscheinen, aber wie wir später zeigen werden, findet es wegen seines hohen **Eingangswiderstands** und **niedrigen Ausgangswiderstands** Verwendung.

.. _13_fig_03:
.. figure:: img/ Activity_13_Fig_03.png

	    :Unity Gain Follower(Spannungsfolger)

   
Bauen Sie mit Ihrer Steckplatine und den STEMlab-Netzteilen die in :numref:`13_fig_03` dargestellte Schaltung auf. Beachten Sie, dass die Leistungsanschlüsse hier nicht explizit dargestellt wurden; es wird davon ausgegangen, dass diese Verbindungen in einer realen Schaltung hergestellt werden müssen (wie im vorherigen Schritt), so dass es nicht notwendig ist, sie von nun an im Schaltplan darzustellen. Verwenden Sie Überbrückungskabel, um Eingang und Ausgang mit dem Wellenform-Generatorausgang, OUT1 und den Oszilloskopeingängen IN1 und IN2 zu verbinden.


1. Starten Sie die Oszilloskop & Signalgenerator - Anwendung.
   
2. Stellen Sie im Einstellungsmenü OUT1 den DC-Offset-Wert auf 0,5 und
   den Amplitudenwert auf 0,5 V ein, um eine 1Vp-p-Sinuswelle mit der
   Mitte von 0,5 V als Eingangsspannung an den Schaltkreis
   anzulegen. Wählen Sie im Wellenformmenü SINE
   
   Deaktivieren Sie die SHOW-Taste und wählen Sie Enable. Stellen Sie
   sicher, dass IN1 V/div und IN2 V/div am linken unteren
   Bildschirmrand auf 200mV/div eingestellt sind (Sie können V/div
   einstellen, indem Sie den gewünschten Kanal und die vertikalen +/-
   Regler auswählen). Stellen Sie im Einstellungsmenü IN1 und IN2 den Wert des
   vertikalen Versatzes auf -500mV ein. Für die stabile Erfassung stellen Sie
   den Triggerpegel im TRIGGER-Menü auf 0,5V ein und wählen Sie NORMAL.
   
3. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   
4. Wählen Sie im Messmenü "FREQ", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   

.. _13_fig_04:
.. figure:: img/ Activity_13_Fig_04.png

	    :Unity Gain Follower-Messungen mit einer Oszilloskop- und Signalgenerator-Anwendung.

   
Unsere Messungen haben bestätigt, dass die Schaltung in :numref:`13_fig_03` tatsächlich ein Spannungsfolger ist. Diese Konfiguration wird häufig verwendet, wenn beispielsweise unser Signalgenerator, der mit dem "+"-Pin des OPAMP verbunden ist, vom Einfluss der mit dem Ausgang des Spannungsfolgers verbundenen Schaltung getrennt werden muss (Pin 6). In Wirklichkeit hat ein in :numref:`13_fig_03` dargestellter Spannungsfolger bei Leistungen seine Grenzen. Dies ist vor allem die Fähigkeit des Spannungsfolgers, die :math:`V_{out}=V_{in}` -Charakteristik bei hohen Frequenzen von :math:`V_{in}` zu erhalten (IN1=OUT1, siehe :numref:`13_fig_03`). Versuchen Sie, die Frequenz des Signalgenerators (OUT1) auf 100kHz oder 1MHz zu erhöhen und die Signale IN1 und IN2 zu beobachten. Eine bestimmte Verzögerung des Signals IN2 erscheint und zeigt an, dass der Spannungsfolger eine Zeitverzögerung zwischen den Eingangs- (IN1) und Ausgangssignalen (IN2) einfügt.


Pufferungsbeispiel
------------------

Der hohe Eingangswiderstand des Operationsverstärkers (Null-Eingangsstrom) bedeutet eine sehr geringe Belastung des Generators, d.h. es wird kein Strom aus der Quellschaltung entnommen und somit kein Spannungsabfall auf einem inneren (Thevenin-)Widerstand. In dieser Konfiguration wirkt der Operationsverstärker also wie ein "Puffer", um die Quelle vor den Ladeeffekten aus anderen Teilen des Systems zu schützen. Aus der Perspektive der Lastschaltung verwandelt der Puffer eine nicht-ideale Spannungsquelle in eine nahezu ideale Quelle. Abbildung 5 beschreibt eine einfache Schaltung, mit der wir diese Eigenschaft eines Unity-gain-Puffers demonstrieren können. Hier wird der Puffer zwischen einer Spannungsteilerschaltung und einem gewissen "Lastwiderstand", dem 10K-Widerstand, eingefügt.


.. _13_fig_05:
.. figure:: img/ Activity_13_Fig_05.png

	    :Puffer Beispiel

   
Bauen Sie mit Ihrem Steckbrett und den STEMlab-Netzteilen die in
:numref:`13_fig_05`, Fall 1 gezeigte Schaltung auf.


**Fall 1**
Beobachten Sie gleichzeitig :math:`V_ {in}` (IN1) und :math:`V_ {out}`
(IN2) und zeichnen Sie die Amplituden(P2P) auf.


1. Starten Sie die Oszilloskop & Signalgenerator - Anwendung.
   
2. Stellen Sie im Menü OUT1-Einstellungen den DC-Offset-Wert auf 0 und
   den Amplitudenwert auf 1V, um eine 2Vp-p-Sinuswelle, die auf 0V
   zentriert ist, als Eingangsspannung an den Schaltkreis
   anzulegen. Wählen Sie im Wellenformmenü SINE
   Deaktivieren Sie die SHOW-Taste und wählen Sie Enable.
   
3. Stellen Sie sicher, dass IN1 V/div und IN2 V/div auf der linken
   unteren Seite des Bildschirms auf 200 mV/div eingestellt sind
   (Sie können V/div einstellen, indem Sie den gewünschten Kanal und
   die vertikalen +/- Regler auswählen)
   
4. Stellen Sie im Einstellungsmenü IN2 den Wert für Vertical Offset
   auf -1000mV ein.
   
5. Stellen Sie im Einstellungsmenü für IN1 und IN2 die
   Sondeneinstellungen auf x10 ein.
   
6. Stellen Sie für die stabile Erfassung den Triggerpegel im
   TRIGGER-Menü auf 1,3 V ein und wählen Sie NORMAL.
   
7. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   
8. Wählen Sie im Messmenü "FREQ", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   

**Fall 2**
Ersetzen Sie die 10k:math:`Omega` Last mit einem 1k:math:`Omega` Widerstand und notieren Sie die Amplituden(P2P) von :math:`V_ {in}`
(IN1) und :math:`V_ {out}`


**Fall 3**
Bewegen Sie die 1 k:math:`Omega` Last zwischen Pin 3 und +2,5 V, so dass sie
parallel zum 4,7 K:math:`Omega` Widerstand ist. Zeichnen Sie die Amplituden (P2P) von
:math:`V_ {in}` (IN1) und :math:`V_ {out}` auf.
      
.. _13_fig_06:
.. figure:: img/ Activity_13_Fig_06.png

	    :Beispiel für einen Pufferfall 1

Wenn Sie Messungen in allen 3 Fällen durchgeführt haben, haben Sie folgendes bemerkt:
In Fall 1 und 2 gab es keinen Unterschied zwischen den Messungen von :math:`V_{in}` (IN1) und :math:`V_{out}`,
obwohl wir unterschiedliche Lasten (1K und 10K Widerstände) am Pufferausgang hatten.
Aus dieser Tatsache ergibt sich, dass die Pufferschaltung diese Lasten :math:`V_{out-case1}=V_{out-case2}`
mit der gleichen Ausgangsspannung treiben kann, während sie gleichzeitig verschiedene
Lasten verhindert, die das :math:`V_{in}` -Signal :math:`V_{in-case1}=V_{in-case2}` beeinflussen. Wenn in Fall 3 1K-Widerstand zwischen Pin 3 ("+") und 2,5V hinzugefügt wird, wirkt sich dies auf die :math:`V_{in}` -Spannung aus
und da die Schaltung ein Spannungsfolger ist, ändert sich ein :math:`V_{out}` entsprechend.



Grundlagen Verstärkerkonfigurationen
------------------------------------

Invertierender Verstärker
-------------------------

:numref:`13_fig_07` zeigt die herkömmliche Konfiguration eines invertierenden
Verstärkers mit einem 10 K:math:`Omega` "Last" - Widerstand am Ausgang.

.. _13_fig_07:
.. figure:: img/ Activity_13_Fig_07.png

	    :Invertierende Verstärkerkonfiguration

   
Montieren Sie nun die in :numref:`13_fig_07` gezeigte invertierende
Verstärkerschaltung mit R2 = 4.7k:math:`Omega`. Denken Sie daran, die Stromversorgung zu trennen,
bevor Sie einen neuen Stromkreis aufbauen. Schneiden und biegen Sie die
Widerstandsleitungen nach Bedarf ab, um sie flach gegen die Platinenoberfläche zu halten,
und verwenden Sie die kürzesten Überbrückungsdrähte für jede Verbindung. Denken Sie daran,
die Platine bietet Ihnen eine große Flexibilität. So müssen beispielsweise die Leitungen
des Widerstandes R2 nicht unbedingt über den Operationsverstärker von Pin 2 auf Pin 6
überbrückt werden; Sie können stattdessen einen Zwischenknoten und einen Jumperdraht
verwenden, um das Gerät zu umgehen.


1. Starten Sie die Oszilloskop & Signalgenerator - Anwedung.
   
2. Im Einstellungsmenü OUT1 den DC-Offsetwert auf -0,5V und den Amplitudenwert auf 0,45V
   einstellen, um eine versetzte Sinuswelle mit -0,5V als Eingangsspannung für die
   Schaltung anzulegen. Wählen Sie aus dem Wellenform-Menü die Option SINE-Signal,
   deaktivieren Sie die SHOW-Taste und wählen Sie Enable.
   
3. Stellen Sie im Einstellungsmenü für IN1 und IN2 die
   Sondeneinstellungen auf x10 ein.
   
4. Stellen Sie sicher, dass IN1 V/div am linken unteren
   Bildschirmrand auf 200 mV/div und IN2 auf 1 V/div eingestellt ist
   (Sie können V/div einstellen, indem Sie den gewünschten Kanal
   auswählen und die vertikalen +/- Regler verwenden)
   
5. Stellen Sie im Einstellungsmenü der IN1 den Wert für Vertical
   Offset auf -500mV ein. Stellen Sie im Menü IN2 settings den Wert
   Vertical Offset auf 2.500mV ein.
   
6. Stellen Sie für die stabile Erfassung den Triggerpegel im
   TRIGGER-Menü auf -0,5 V und wählen Sie NORMAL.
   
7. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   
8. Wählen Sie im Messmenü "MEAN", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG

   
.. _13_fig_08:
.. figure:: img/ Activity_13_Fig_08.png

	    :Messungen der invertierenden Verstärkerkonfiguration

.. note::
   Aus den Messungen in Abbildung 8 können wir sehen, dass die
   Amplitude von :math:`V_ {out}` (IN2) ca. 4,7 mal größer ist als die
   Amplitude von :math:`V_ {in}` (IN1). Auch die Phase zwischen zwei
   Signalen beträgt 180 Grad. Dies ist das Ergebnis der invertierenden
   Verstärkercharakteristik, die gegeben ist als:
   

   .. math::
      V_ {out} = -\bigg(\frac{R2}{R1}\bigg)V_ {in}\quad           (2)

   
Nicht invertierender Verstärker
-------------------------------

Die nichtinvertierende Verstärkerkonfiguration ist in :numref:`13_fig_09` dargestellt. Wie der Unit-Gain-Puffer hat auch diese Schaltung die (meist) wünschenswerte Eigenschaft eines hohen Eingangswiderstandes, so dass sie für die Pufferung nicht-idealer Quellen nützlich ist, jedoch mit einer Verstärkung größer als eins.

.. _13_fig_09:
.. figure:: img/ Activity_13_Fig_09.png

	    :Nicht-invertierende Verstärkerkonfigurationsmessungen

   
Bauen Sie die nicht invertierende Verstärkerschaltung wie in
:numref:`13_fig_09` dargestellt auf. **Denken Sie dran, die Stromversorgungen vor dem Zusammenbau der neuen Schaltung auszuschalten.**  Setze Sie für :math:`R2 = 4,7 k\Omega` ein.


1. Starten Sie die Oszilloskop & Signalgenerator - Anwendung.
   
2. Im Einstellungsmenü OUT1 den DC-Offsetwert auf 0,5V und den Amplitudenwert auf 0,3V einstellen,
   um eine versetzte Sinuswelle, die auf 0,5V zentriert ist, als Eingangsspannung für die
   Schaltung anzulegen. Wählen Sie aus dem Wellenform-Menü die Option SINE-Signal,
   deaktivieren Sie die SHOW-Taste und wählen Sie Enable.
   
3. Stellen Sie im Einstellungsmenü für IN1 und IN2 die
   Sondeneinstellungen auf x10 ein.
   
4. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V/div auf 100 mV/div und IN2 auf 1V/div eingestellt
   ist (Sie können V/div einstellen, indem Sie den gewünschten Kanal
   und die vertikalen +/- Regler auswählen)
   
5. Stellen Sie im Einstellungsmenü der IN1 den Wert für Vertical
   Offset auf -500mV ein. Stellen Sie im Menü IN2 settings den Wert
   von Vertical Offset auf -3V ein.
   
6. Stellen Sie für die stabile Erfassung den Triggerpegel im
   TRIGGER-Menü auf 0,5 V und wählen Sie NORMAL.
   
7. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   
8. Wählen Sie im Messmenü "MEAN", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   

.. _13_fig_10:
.. figure:: img/ Activity_13_Fig_10.png

	    :Nicht-invertierende Verstärkerkonfigurationsmessungen

   
.. note::
   Aus den in :numref:`13_fig_10` gezeigten Messungen können wir sehen, dass
   die Amplitude von :math:`V_ {out}` (IN2) ca. 5,7 mal größer ist als
   die Amplitude von :math:`V_ {in}` (IN1). Auch die Phase zwischen
   zwei Signalen beträgt ~ 0 Grad. Dies ist das Ergebnis einer nicht
   invertierenden Verstärkercharakteristik, die gegeben ist als:
   

   .. math::
      V_ {out} =\bigg(1+\frac{R2}{R1}\bigg)V_ {in}\quad      (3)


Erhöhen Sie den Rückkopplungswiderstand R2 weiter bis zum Beginn des Übersteuervorgangs, d.h. bis die Spitzen des Ausgangssignals aufgrund der Ausgangssättigung abzubauen beginnen. Notieren Sie den Wert des Widerstandes, wenn dies geschieht. Erhöhen Sie nun den Rückkopplungswiderstand auf 100 K:math:`Omega`. Beschreiben und zeichnen Sie Wellenformen in Ihrem Notebook. Was ist der theoretische Gewinn an dieser Stelle? Wie klein müsste das Eingangssignal sein, um den Ausgangspegel bei dieser Verstärkung auf weniger als 5V zu halten? Versuchen Sie, den Wellenform-Generator auf diesen Wert einzustellen. Beschreiben Sie die erzielte Leistung. Der letzte Schritt unterstreicht eine wichtige Überlegung für High-Gain-Verstärker. High-Gain bedeutet notwendigerweise einen großen Ausgang für einen kleinen Eingangspegel. Manchmal kann dies zu einer unbeabsichtigten Sättigung durch die Verstärkung von schwachem Rauschen oder Störungen führen, z.B. durch die Verstärkung von 60Hz-Streusignalen von Stromleitungen, die manchmal empfangen werden können. Die Verstärker verstärken alle Signale an den Eingangsklemmen....ob Sie es wollen oder nicht!


Summierverstärkerschaltung
--------------------------

Die Schaltung von :numref:`13_fig_11` ist ein grundlegender invertierender Verstärker mit vier Eingängen, genannt "Summierverstärker".

.. _13_fig_11:
.. figure:: img/ Activity_13_Fig_11.png

	    :Summing Amplifier Konfiguration

   
Bauen Sie bei abgeschalteter Stromversorgung einen Stromkreis wie in :numref:`13_fig_11` dargestellt auf und fahren Sie mit den Messungen fort.

.. _13_fig_12:
.. figure:: img/ Activity_13_Fig_12.png

	    :Summierverstärkerschaltung auf dem Steckbrett

   
**Setzen Sie** :math:`R_ {in}` = :math:`R_ {in}` = :math:`R_ {f}` = 4.7k:math:`Omega`.

1. Starten Sie die  Oszilloskop & Signalgenerator - Anwendung.
   
2. Stellen Sie im Einstellungsmenü OUT1 und OUT2 den DC-Offset-Wert
   auf -0,5 V und den Amplitudenwert auf 0,3 V ein, um eine
   offset-sinusförmige Sinuswelle mit -0,5 V als Eingangsspannungen an
   den Schaltkreis anzulegen. Aus der Wellenform-Menu wählen Sie das SINE
   Signal und wählen Sie Enable.
   
3. Stellen Sie im Einstellungsmenü für IN1 und IN2 die
   Sondeneinstellungen auf x10 ein.
   
4. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms,
   dass IN1 V/div auf 100 mV/div und IN2 auf 1 V/div eingestellt
   ist (Sie können V/div einstellen, indem Sie den gewünschten Kanal
   und die vertikalen +/- Regler auswählen)
   
5. Stellen Sie für die stabile Erfassung den Triggerpegel im
   TRIGGER-Menü auf -0,5 V ein und wählen Sie NORMAL.
   
6. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie
   FERTIG, wählen Sie IN2 und drücken Sie FERTIG
   
.. _13_fig_13:
.. figure:: img/ Activity_13_Fig_13.png

	    :Summenverstärker-Messungen

   
.. note::
   Aus der obigen Messung können wir sehen, dass die Ausgangsspannung
   die Summe der zwei Eingangsspannungen ist. Auch die Phase zwischen
   zwei Signalen ist ~ 0 Grad. Dies ist das Ergebnis einer
   invertierenden Summenverstärkercharakteristik, die gegeben ist als: 

   .. math::
      -V_ {out} = \frac{R_f}{R_ {in}}\bigg(V_ {in1} + V_ {in2}\bigg)\quad   (4)

   Im Allgemeinen kann :math:`R_ {in}` für jede Eingangsspannung unterschiedlich sein, so dass es folgt:

   .. math::
      -V_ {out} =\frac{R_f}{R_ {in1}}V_{in1}+\frac{R_f}{R_ {in2}}V_ {in2}+ ... +\frac{R_f}{R_ {inN}}V_{inN}\quad    (5)

Um die obige Gleichung zu beweisen, versuchen Sie, OUT2 zu deaktivieren und den IN2 P2P-Wert zu beobachten. Versuchen Sie auch, die Amplitude von OUT2 zu ändern und Messungen zu beobachten. Was passiert, wenn Sie die OUT2-Phase auf 180 Grad einstellen? Können Sie das Ergebnis in diesem Fall erklären?


Verwenden eines Operationsverstärkers als Vergleicher
-----------------------------------------------------

Die hohe intrinsische Verstärkung des Operationsverstärkers und die Ausgangssättigungseffekte können durch die Konfiguration des Operationsverstärkers als Vergleicher wie in :numref:`13_fig_14` genutzt werden. Dies ist im Wesentlichen eine binäre Entscheidungsschaltung: Wenn die Spannung an der Klemme "+" größer ist als die Spannung an der Klemme "-", :math:`V_{in}` > :math:`V_{ref}`, geht der Ausgang "high" (sättigt auf seinen Maximalwert). Umgekehrt, wenn :math:`V_{in}` < :math:`V_{ref}`, geht der Ausgang "low". Die Schaltung vergleicht die Spannungen an den beiden Eingängen und erzeugt aus den Relativwerten einen Ausgang. Im Gegensatz zu allen bisherigen Schaltungen gibt es keine Rückkopplung zwischen Eingang und Ausgang; wir sagen, dass die Schaltung "open-loop" arbeitet.

.. _13_fig_14:
.. figure:: img/ Activity_13_Fig_14.png

	    :Op-Amp als Komparator

   
Bei ausgeschalteter Stromversorgung die Schaltung wie in :numref:`13_fig_14`
gezeigt aufbauen und mit den Messungen fortfahren.


1. Starten Sie die Oszilloskop & Signalgenerator - Anwendung.
   
2. Stellen Sie im OUT1 den Amplitudenwert auf 0,45V und den DC-Offsetwert auf 0,5V ein,
   um eine versetzt angeordnete Sinuswelle, die auf 0,5V zentriert ist, als
   Eingangsspannung für die Schaltung anzulegen. Wählen Sie aus dem Wellenform-Menü die
   Option SINE-Signal und deaktivieren Sie die SHOW-Taste. Stellen Sie die Frequenz auf
   100Hz ein und wählen Sie enable (ON). Wählen Sie im OUT2 das DC-Signal aus,
   deaktivieren Sie die Option SHOW-Taste und stellen Sie den Amplitudenwert auf 0,5V,
   um eine Gleichspannung als Referenzwert :math:`V_{ref}` anzulegen. Aktivieren Enable (EIN).
   
3. Stellen Sie im Menü für die IN2-Einstellungen die
   Sondeneinstellungen auf x10 ein.
   
4. Stellen Sie sicher, dass IN1 V/div am linken unteren
   Bildschirmrand auf 200 mV/div und IN2 bis 2 V/div eingestellt ist
   (Sie können V/div einstellen, indem Sie den gewünschten Kanal
   auswählen und die vertikalen +/- Regler verwenden)
   
5. Setzen Sie für die stabile Erfassung den Triggerpegel im
   TRIGGER-Menü auf 0,25 V und wählen Sie NORMAL.
   
.. _13_fig_15:
.. figure:: img/ Activity_13_Fig_15.png

	    :Op-Amp als Komparatormessungen

   
.. note::
   Für den Komparator, der in :numref:`13_fig_14` gezeigt ist, folgt:

   .. math::
      if \ quad V_ {in}> V_ {ref} \ quad; \ quad V_ {out} = V _ {+} \ quad  (5)
      
   .. math::
      if \ quad V_ {in} <V_ {ref} \ quad; \ quad V_ {out} = V _ {-}

      
Fragen
------

1. Anstiegsrate: Besprechen Sie, wie Sie die Anstiegsrate in der
   Unit-Gain-Pufferkonfiguration gemessen und berechnet haben, und vergleichen
   Sie diese mit dem im OP97-Datenblatt aufgeführten Wert.
  
2. Pufferung: Erklären Sie, warum der Pufferverstärker in :numref:`13_fig_05` es ermöglicht hat,
   dass die Spannungsteilerschaltung mit unterschiedlichen Lastwiderständen perfekt funktioniert.
  
3. Ausgangssättigung: Erklären Sie Ihre Beobachtungen der Ausgangsspannungssättigung
   in der Konfiguration des Wechselrichters und Ihre Einschätzung der internen Spannungsabfälle.
   Wie nah kommt der Ausgang in diesem Experiment und auch später als Vergleicher mit
   unterschiedlichen Versorgungsspannungen an die Versorgungsschienen? Können Sie erraten,
   wie der Ausgangsspannungshub für einen Operationsverstärker wäre, der als "Rail-to-Rail"-Gerät beworben wird?
  
4. Vergleicher: Besprechen Sie Ihre Messungen und was passieren würde, wenn die Polarität von Vref umgekehrt wird.
