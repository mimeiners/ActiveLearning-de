Grundlegende OP-Verstärkerkonfigurationen
#############################

Zielsetzung
__________

In diesem Labor stellen wir den Operationsverstärker (Operationsverstärker) vor, eine aktive Schaltung, die mit bestimmten Eigenschaften (hoher Eingangswiderstand, niedriger Ausgangswiderstand und eine große differentielle Verstärkung) entworfen ist, die sie zu einem nahezu idealen Verstärker und nützlichen Baustein macht viele Schaltungsanwendungen. In dieser Übung lernen Sie die DC-Vorspannung für aktive Schaltungen kennen und erkunden einige der grundlegenden funktionalen Operationsverstärkerschaltungen. Wir werden dieses Labor auch nutzen, um Fähigkeiten mit der Laborhardware weiterzuentwickeln.

Anmerkungen
__________

..hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya STEMlab-Board-Hardware beziehen.
Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.
Erweiterungssteckerstift, der als 5V-Spannungsquelle verwendet wird, finden Sie in der Dokumentation here_.

Materialien
__________

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10
- OPAMP: 1x AD8541 (CMOS-Rail-to-Rail-Verstärker)
- LED: 1x
- Widerstand: 4x 1 :math:`k \ Omega`
- Widerstand: 3x 4,7 :math:`k \ Omega`
- Widerstand: 2x 10 :math:`k \ Omega`
- Widerstand: 1x 20 :math:`k \ Omega`
- Kondensator: 1x 1 :math:`\ mu F`

Operationsverstärker-Grundlagen
______________

.. _LM317: http://www.ti.com/lit/ds/symlink/lm317.pdf
.. _adjustable: http://www.ti.com/lit/ds/symlink/lm317.pdf
.. _regulator: http://www.ti.com/lit/ds/symlink/lm317.pdf
.. _E2: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _connector: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2

Erster Schritt: Anschließen der Gleichstromversorgung
--------------------------------
Operationsverstärker müssen immer mit Gleichstrom versorgt werden. Daher sollten diese Verbindungen zuerst konfiguriert werden, bevor weitere Schaltungsbauteile hinzugefügt werden. Abbildung 1 zeigt eine mögliche Leistungsanordnung auf Ihrem lötfreien Steckbrett. Wir verwenden zwei der langen Schienen für die positive Versorgungsspannung und Masse. Mit dem LM317_ adjustable_ regulator_ stellen wir eine eventuell benötigte 2,5 V Mittelversorgungsschiene zur Verfügung.

.. note::
     STEMlab Boards haben keinen 2.5V DC Ausgang Pin, so dass wir LM317 einstellbaren Regler verwenden, um 2,5V DC Schiene von 5V eins zu liefern.
     Der Anschluss des LM317 ist sehr einfach und wird im Folgenden beschrieben. Gleichung zur Berechnung der Ausgangsspannung ist gegeben als:
     
     .. math::
         V_ {out} = 1.25 \ bigg (1+ \ frac {R_2} {R_1} \ bigg) \ quad (1).


Enthalten ist der sogenannte "Versorgungs-Entkopplungs" -Kondensator, der zwischen die Stromversorgung und die Erdungsschienen geschaltet ist. Es ist zu früh, den Zweck dieser Kondensatoren im Detail zu diskutieren, aber sie werden verwendet, um das Rauschen auf den Versorgungsleitungen zu reduzieren und parasitäre Schwingungen zu vermeiden. Es wird als gute Praxis im analogen Schaltungsdesign angesehen, immer kleine Bypass-Kondensatoren in der Nähe der Versorgungspins jedes Operationsverstärkers in Ihrer Schaltung vorzusehen.

.. figure:: img/ Activity_13_Fig_1.png

Abbildung 1: Stromanschlüsse mit 5-V-Stromanschluss von E2_-Anschluss_ und LM317_ einstellbar_ Regler_

Es ist eine gute Übung, die Stromversorgung anzuzeigen. Dazu verwenden wir eine LED, die an die 2,5 V-Schiene angeschlossen ist. Wenn die Spannung an dieser Schiene anliegt, leuchtet die LED. Da 2,5 V von der 5-V-Schiene bereitgestellt werden, zeigt die gleiche LED auch den "OK" -Status der 5-V-Stromversorgung an. Setzen Sie den LM317 und den Operationsverstärker in Ihr Steckbrett und fügen Sie die Drähte, Widerstände, LED und Versorgungskondensatoren wie in Abbildung 1 gezeigt hinzu. Um später Probleme zu vermeiden, können Sie ein kleines Etikett am Steckbrett anbringen, um anzuzeigen, welche Schienen +5 V entsprechen , +2,5 V und GND.

Als nächstes verbinden Sie die +5-V-Versorgung und GND-Verbindungen von der STEMlab-Platine mit den Anschlüssen auf Ihrem Steckbrett. Verwenden Sie Jumper-Drähte, um die Schienen zu versorgen. Denken Sie daran, dass der GND-Anschluss der Stromversorgung unser Bezugspunkt für die Erdung sein wird. Sobald Sie Ihre Versorgungsanschlüsse haben, können Sie ein DMM verwenden, um die IC-Pins direkt zu prüfen, um sicherzustellen, dass Pin 7 auf +5 V, Pin 4 auf 0 V (Masse) und überprüfen Sie 2,5 Stromschiene.
Denken Sie daran, dass Sie das STEMlab einschalten müssen, bevor Sie die Spannungen mit dem Voltmeter messen.

.. figure:: img/ Activity_13_Fig_2.png

Abbildung 2: Stromanschlüsse

Erster Schritt: Unity-Gain Amplifier (Spannungsfolger)
-------------------------------------------------- -

Unsere erste Operationsverstärkerschaltung ist eine einfache, in Abbildung 3 gezeigte Schaltung. Dies wird als Puffer mit Einheitsverstärkung oder manchmal nur als Spannungsfolger bezeichnet, der durch die Übertragungsfunktion definiert ist :math:`V_ {out} = V_ {in}` . Auf den ersten Blick mag es wie ein nutzloses Gerät erscheinen, aber wie wir später zeigen werden, findet es wegen seines hohen ** Eingangswiderstands ** und ** niedrigen Ausgangswiderstands ** Anwendung.

.. figure:: img/ Activity_13_Fig_3.png

Abbildung 3: Unity Gain Follower

Verwenden Sie das Steckbrett und die STEMlab-Netzteile und konstruieren Sie die in Abbildung 3 gezeigte Schaltung. Beachten Sie, dass die Stromanschlüsse hier nicht explizit dargestellt wurden. Es wird angenommen, dass diese Verbindungen in jeder realen Schaltung hergestellt werden müssen (wie im vorherigen Schritt), so dass es unnötig ist, sie von nun an im Schaltplan zu zeigen. Verwenden Sie Jumper-Drähte, um Eingang und Ausgang mit dem Ausgang des Wellenformgenerators, OUT1 und den Oszilloskopeingängen IN1 und IN2 zu verbinden.

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie im Einstellungsmenü OUT1 den DC-Offset-Wert auf 0,5 und den Amplitudenwert auf 0,45 V ein, um eine 1Vp-p-Sinuswelle mit der Mitte von 0,5 V als Eingangsspannung an den Schaltkreis anzulegen. Wählen Sie im Wellenformmenü SINE
   Deaktivieren Sie die SHOW-Taste und wählen Sie enable. Stellen Sie sicher, dass IN1 V / div und IN2 V / div am linken unteren Bildschirmrand auf 200mV / div eingestellt sind (Sie können V / div einstellen, indem Sie den gewünschten Kanal und die vertikalen +/- Regler auswählen). In IN1 und Das IN2-Einstellungsmenü stellt den Wert von Vertical Offset auf -500mV ein. Für die stabile Aufnahme stellen Sie den Triggerpegel im TRIGGER-Menü auf 0.5V und wählen Sie NORMAL.
3. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG
4. Wählen Sie im Messmenü "FREQ", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG

.. figure:: img/ Activity_13_Fig_4.png

Abbildung 4: Unity Gain Follower-Messungen mit einer Oszilloskop- und Signalgenerator-Anwendung.

Unsere Messungen haben bestätigt, dass die Schaltung in 3 tatsächlich ein Spannungsfolger ist. Diese Konfiguration wird häufig verwendet, wenn unser Signalgenerator, der mit dem "+" - Pin des OPAMP verbunden ist, vom Einfluss der Schaltung getrennt werden muss, die mit dem Ausgang des Spannungsfolgers (Pin 6) verbunden ist.
In der Realität hat ein Spannungsfolger, der in 3 gezeigt ist, seine Grenzen im Fall von Leistungen. Hauptsächlich ist dies die Fähigkeit des Spannungsfolgers, zu erhalten :math:`V_ {out} = V_ {in}` charakteristisch bei hohen Frequenzen von :math:`V_ {in}` (IN1 = OUT1, siehe Abbildung 3) .
Versuchen Sie, die Frequenz des Signalgenerators (OUT1) auf 100 kHz oder 1 MHz zu erhöhen und beobachten Sie die Signale IN1 und IN2. Eine bestimmte Verzögerung des Signals IN2 wird angezeigt, die anzeigt, dass der Spannungsfolger eine Zeitverzögerung zwischen dem Eingangssignal (IN1) und dem Ausgangssignal (IN2) einfügt.

Pufferungsbeispiel
-------------------
Der hohe Eingangswiderstand des Operationsverstärkers (Nulleingangsstrom) bedeutet, dass der Generator nur sehr wenig belastet wird; h., es wird kein Strom von der Quellenschaltung bezogen, und daher fällt keine Spannung an irgendeinem internen Widerstand (Thevenin) ab. In dieser Konfiguration wirkt der Operationsverstärker also wie ein "Puffer", um die Quelle vor den Ladeeffekten von anderen Teilen des Systems zu schützen. Aus Sicht des Lastkreises transformiert der Puffer eine nicht ideale Spannungsquelle in eine nahezu ideale Quelle. Abbildung 5 beschreibt eine einfache Schaltung, mit der wir dieses Merkmal eines Puffers mit Einheitsverstärkung demonstrieren können. Hier wird der Puffer zwischen einer Spannungsteilerschaltung und einem "Last" -Widerstand, dem 10K-Widerstand, eingefügt.


.. figure:: img/ Activity_13_Fig_5.png

Abbildung 5: Puffer Beispiel

Bauen Sie mit Ihrem Steckbrett und den STEMlab-Netzteilen die in Abbildung 5, Fall 1 gezeigte Schaltung ein.

**Fall 1**
    Beobachte gleichzeitig :math:`V_ {in}` (IN1) und :math:`V_ {out}` (IN2) und zeichne die Amplituden (P2P) auf.

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie im Menü OUT1-Einstellungen den DC-Offset-Wert auf 0 und den Amplitudenwert auf 1V, um eine 2Vp-p-Sinuswelle, die auf 0V zentriert ist, als Eingangsspannung an den Schaltkreis anzulegen. Wählen Sie im Wellenformmenü SINE
   Deaktivieren Sie die SHOW-Taste und wählen Sie enable.
3. Stellen Sie sicher, dass IN1 V / div und IN2 V / div auf der linken unteren Seite des Bildschirms auf 200 mV / div eingestellt sind (Sie können V / div einstellen, indem Sie den gewünschten Kanal und die vertikalen +/- Regler auswählen)
4. Stellen Sie im Einstellungsmenü IN2 den Wert für Vertical Offset auf -1000mV ein.
5. Stellen Sie im Einstellungsmenü für IN1 und IN2 die Sondeneinstellungen auf x10 ein.
6. Stellen Sie für die stabile Erfassung den Triggerpegel im TRIGGER-Menü auf 1,3 V ein und wählen Sie NORMAL.
7. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG
8. Wählen Sie im Messmenü "FREQ", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG

** Fall 2 **
    Entfernen Sie die 10kΩ Last und ersetzen Sie stattdessen einen 1kΩ Widerstand und notieren Sie die Amplituden (P2P) von :math:`V_ {in}` (IN1) und :math:`V_ {out}`

** Fall 3 **
    Bewegen Sie die 1 kΩ Last zwischen Pin 3 und +2,5 V, so dass sie parallel zum 4,7 KΩ Widerstand ist. Notiere die Amplituden (P2P) von :math:`V_ {in}` (IN1) und :math:`V_ {out}`

.. figure:: img/ Activity_13_Fig_6.png

Abbildung 6: Beispiel für einen Pufferfall 1

Wenn Sie Messungen in allen 3 Fällen durchgeführt haben, die Ihnen aufgefallen sind; Im Fall 1 und 2 gab es keinen Unterschied zwischen den Messungen von :math:`V_ {in}` (IN1) und :math:`V_ {out}` obwohl wir unterschiedliche Lasten (1K und 10K Widerstände) am Pufferausgang hatten. Aus dieser Tatsache ist es klar, dass die Pufferschaltung diese Lasten treiben kann :math:`V_ {out-case-1} = V_ {out-case-2}` mit der gleichen Ausgangsspannung, während verschiedene Lasten verhindert werden, die folgendes beeinflussen :math:` V_ {in} `Signal: math:` V_ {in-case-1} = V_ {in-case-2} `.
Im Fall 3, dass ein 1K Widerstand zwischen Pin 3 ("+") und 2.5V addiert wird, beeinflusst dies die :math:`V_ {in}` Spannung und da ist die Schaltung ein Spannungsfolger, ein :math:`V_ {out}` wird sich entsprechend ändern.


Grundlagen Verstärkerkonfigurationen
________________________________

Invertierender Verstärker
--------------------

Fig. 7 zeigt die herkömmliche Konfiguration eines invertierenden Verstärkers mit einem 10 KΩ "Last" -Widerstand am Ausgang.

.. figure:: img/ Activity_13_Fig_7.png

Abbildung 7: Invertierende Verstärkerkonfiguration

Montieren Sie nun die in Abbildung 7 gezeigte invertierende Verstärkerschaltung mit R2 = 4.7kΩ. Denken Sie daran, die Stromversorgung zu unterbrechen, bevor Sie eine neue Schaltung montieren. Schneiden und biegen Sie die Widerstandskabel nach Bedarf, um sie flach auf der Platinenoberfläche zu halten, und verwenden Sie für jede Verbindung die kürzesten Überbrückungskabel. Denken Sie daran, dass das Steckbrett Ihnen viel Flexibilität bietet. Zum Beispiel müssen die Leitungen des Widerstands R2 nicht notwendigerweise den Operationsverstärker von dem Stift 2 zu dem Stift 6 überbrücken; Sie können stattdessen einen Zwischenknoten und eine Überbrückungsleitung verwenden, um das Gerät zu umgehen.

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie im Menü OUT1-Einstellungen den DC-Offset-Wert auf -0,5 V und den Amplitudenwert auf 0,45 V ein, um eine offset-orientierte Sinuswelle mit -0,5 V als Eingangsspannung an den Schaltkreis anzulegen. Wählen Sie im Wellenformmenü aus
   SINE-Signal deaktivieren Sie die SHOW-Taste und wählen Sie enable.
3. Stellen Sie im Einstellungsmenü für IN1 und IN2 die Sondeneinstellungen auf x10 ein.
4. Stellen Sie sicher, dass IN1 V / div am linken unteren Bildschirmrand auf 200mV / div und IN2 bis 1V / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)
5. Stellen Sie im Einstellungsmenü der IN1 den Wert für Vertical Offset auf -500mV ein. Stellen Sie im Menü IN2 settings den Wert Vertical Offset auf 2.500mV ein.
6. Stellen Sie für die stabile Erfassung den Triggerpegel im TRIGGER-Menü auf -0,5 V und wählen Sie NORMAL.
7. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG
8. Wählen Sie im Messmenü "MEAN", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG

.. figure:: img/ Activity_13_Fig_8.png

Abbildung 8: Messungen der invertierenden Verstärkerkonfiguration

.. note::

     Aus den Messungen in Abbildung 8 können wir sehen, dass die Amplitude von :math:`V_ {out}` (IN2) ca. 4,7 mal größer ist als die Amplitude von :math:`V_ {in}` (IN1). Auch die Phase zwischen zwei Signalen beträgt 180 Grad. Dies ist das Ergebnis der invertierenden Verstärkercharakteristik, die gegeben ist als:

     .. math::
V_ {out} = - \ bigg (\ frac {R2} {R1} \ bigg) V_ {in} \ quad (2)

Nicht invertierender Verstärker
------------------------

Die Konfiguration des nicht invertierenden Verstärkers ist in 9 gezeigt. Wie der Puffer mit Einheitsverstärkung hat diese Schaltung die (üblicherweise) wünschenswerte Eigenschaft eines hohen Eingangswiderstands, so dass sie zum Puffern von nicht idealen Quellen geeignet ist, jedoch mit einer Verstärkung größer als ein.

.. figure:: img/ Activity_13_Fig_9.png

Abbildung 9: Nicht-invertierende Verstärkerkonfigurationsmessungen

Montieren Sie die nicht invertierende Verstärkerschaltung wie in Abbildung 9 dargestellt. Vergessen Sie nicht, die Stromversorgungen vor dem Zusammenbau der neuen Schaltung auszuschalten. Setze ** R2 = 4,7 kΩ **.

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie im Menü OUT1-Einstellungen den DC-Offset-Wert auf 0,5 V und den Amplitudenwert auf 0,3 V ein, um eine offset-orientierte Sinuswelle mit 0,5 V als Eingangsspannung an den Schaltkreis anzulegen. Wählen Sie im Wellenformmenü aus
   SINE-Signal deaktivieren Sie die SHOW-Taste und wählen Sie enable.
3. Stellen Sie im Einstellungsmenü für IN1 und IN2 die Sondeneinstellungen auf x10 ein.
4. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms, dass IN1 V / div auf 100 mV / div und IN2 auf 1V / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal und die vertikalen +/- Regler auswählen)
5. Stellen Sie im Einstellungsmenü der IN1 den Wert für Vertical Offset auf -500mV ein. Stellen Sie im Menü IN2 settings den Wert von Vertical Offset auf -3V ein.
6. Stellen Sie für die stabile Erfassung den Triggerpegel im TRIGGER-Menü auf 0,5 V und wählen Sie NORMAL.
7. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG
8. Wählen Sie im Messmenü "MEAN", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG


.. figure:: img/ Activity_13_Fig_10.png

Abbildung 10: Nicht-invertierende Verstärkerkonfigurationsmessungen

.. note::

     Aus den in Abbildung 10 gezeigten Messungen können wir sehen, dass die Amplitude von :math:`V_ {out}` (IN2) ca. 5,7 mal größer ist als die Amplitude von :math:`V_ {in}` (IN1). Auch die Phase zwischen zwei Signalen beträgt ~ 0 Grad. Dies ist das Ergebnis einer nicht invertierenden Verstärkercharakteristik, die gegeben ist als:

     .. math::
          V_ {out} = \ bigg (1 + \ frac {R2} {R1} \ bigg) V_ {in} \ quad (3)


Erhöhen Sie den Rückkopplungswiderstand R2 weiter bis zum Einsetzen des Abschneidens, d. H. Bis die Spitzen des Ausgangssignals aufgrund der Ausgangssättigung abgeflacht werden. Notieren Sie den Wert des Widerstands, wo dies geschieht. Erhöhen Sie nun den Rückkopplungswiderstand auf 100 KΩ. Beschreiben und zeichnen Sie Wellenformen in Ihrem Notebook. Was ist der theoretische Gewinn an diesem Punkt? Wie klein müsste das Eingangssignal sein, um bei dieser Verstärkung den Ausgangspegel unter 5V zu halten? Versuchen Sie, den Wellenformgenerator auf diesen Wert einzustellen. Beschreiben Sie die erreichte Leistung.
Der letzte Schritt unterstreicht eine wichtige Überlegung für Verstärker mit hoher Verstärkung. Eine hohe Verstärkung bedeutet notwendigerweise eine große Ausgabe für einen kleinen Eingangspegel. Manchmal kann dies zu einer unbeabsichtigten Sättigung aufgrund der Verstärkung von niedrigem Rauschen oder Interferenz führen, zum Beispiel die Verstärkung von 60 Hz-Streusignalen von Stromleitungen, die manchmal aufgenommen werden können. Verstärker verstärken alle Signale an den Eingangsklemmen ... ob Sie wollen oder nicht!


Summierverstärkerschaltung
--------------------------

Die Schaltung von Fig. 11 ist ein grundlegender invertierender Verstärker mit vier Eingängen, der als "summierender" Verstärker bezeichnet wird.

.. figure:: img/ Activity_13_Fig_11.png

Abbildung 11: Summing Amplifier Konfiguration

Bei ausgeschalteter Stromversorgung die Schaltung wie in Abbildung 11 gezeigt aufbauen und mit den Messungen fortfahren.

.. figure:: img/ Activity_13_Fig_12.png

Abbildung 12: Summierverstärkerschaltung auf dem Steckbrett

** Set: ** :math:`R_ {in}` = :math:`R_ {in}` = :math:`R_ {f}` = 4.7kΩ.

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie im Einstellungsmenü OUT1 und OUT2 den DC-Offset-Wert auf -0,5 V und den Amplitudenwert auf 0,3 V ein, um eine offset-sinusförmige Sinuswelle mit -0,5 V als Eingangsspannungen an den Schaltkreis anzulegen. Aus der Wellenform
   Wählen Sie das SINE Signal und wählen Sie enable.
3. Stellen Sie im Einstellungsmenü für IN1 und IN2 die Sondeneinstellungen auf x10 ein.
4. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms, dass IN1 V / div auf 100 mV / div und IN2 auf 1V / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal und die vertikalen +/- Regler auswählen)
5. Stellen Sie für die stabile Erfassung den Triggerpegel im TRIGGER-Menü auf -0,5 V ein und wählen Sie NORMAL.
6. Wählen Sie im Messmenü "P2P", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG

.. figure:: img/ Activity_13_Fig_13.png

Abbildung 13: Summenverstärker-Messungen

.. note::

     Aus der obigen Messung können wir sehen, dass die Ausgangsspannung die Summe der zwei Eingangsspannungen ist.
     Auch die Phase zwischen zwei Signalen ist ~ 0 Grad.
     Dies ist das Ergebnis einer invertierenden Summenverstärkercharakteristik, die gegeben ist als:

     .. math::
          -V_ {out} = \ frac {R_f} {R_ {in}} \ bigg (V_ {in1} + V_ {in2} \ bigg) \ quad (4)

     Im Allgemeinen :math:`R_ {in}` kann für jede Eingangsspannung unterschiedlich sein, also folgt:

     .. math::
          -V_ {out} = \ frac {R_f} {R_ {in1}} V_ {in1} + \ frac {R_f} {R_ {in2}} V_ {in2} + ... + \ frac {R_f} {R_ { inN}} V_ {inN} \ quad (5)

Um die obige Gleichung nachzuweisen, versuchen Sie, OUT2 zu deaktivieren und den P2P-Wert von IN2 zu beobachten. Versuchen Sie auch, die OUT2-Amplitude zu ändern und die Messungen zu beobachten. Was passiert, wenn Sie die OUT2-Phase auf 180 Grad einstellen? Können Sie das Ergebnis in diesem Fall erklären?


Verwenden eines Operationsverstärkers als Vergleicher
---------------------------------

Die hohe Eigenverstärkung des Operationsverstärkers und die Ausgangssättigungseffekte können ausgenutzt werden, indem der Operationsverstärker als ein Komparator wie in 14 konfiguriert wird. Dies ist im Wesentlichen eine Entscheidungsschaltung mit binärem Zustand: Wenn die Spannung an der "+ "Terminal ist größer als die Spannung am" - "terminal,: math:` V_ {in} `>: math:` V_ {ref} `, der Ausgang geht auf" high "(sättigt bei seinem Maximalwert). Wenn umgekehrt :math:`V_ {in}` < :math:`V_ {ref}` wird der Ausgang "low". Die Schaltung vergleicht die Spannungen an den zwei Eingängen und erzeugt eine Ausgabe basierend auf den relativen Werten. Im Gegensatz zu allen vorherigen Schaltungen gibt es keine Rückkopplung zwischen dem Eingang und dem Ausgang; wir sagen, dass die Schaltung "open-loop" arbeitet.

.. figure:: img/ Activity_13_Fig_14.png

Abbildung 14: Op-Amp als Komparator

Bei ausgeschalteter Stromversorgung die Schaltung wie in Abbildung 14 gezeigt aufbauen und mit den Messungen fortfahren.

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie in OUT1 den Amplitudenwert auf 0,45 V und den DC-Offset auf 0,5 V ein, um eine offsettierte Sinuswelle mit 0,5 V als Eingangsspannung an den Schaltkreis anzulegen. Aus der Wellenform
   Wählen Sie im Menü SINE-Signal die SHOW-Schaltfläche aus. Stellen Sie die Frequenz auf 100Hz ein und wählen Sie enable (ON).
   Wählen Sie im OUT2-DC-Signal die Option SHOW, um den Amplitudenwert auf 0,5 V einzustellen, um eine Gleichspannung als REFERENCE-Wert zu verwenden :math:`V_ {ref}`. Wählen Sie Aktivieren (Ein).
3. Stellen Sie im Menü für die IN2-Einstellungen die Sondeneinstellungen auf x10 ein.
4. Stellen Sie sicher, dass IN1 V / div am linken unteren Bildschirmrand auf 200mV / div und IN2 bis 2V / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)
5. Setzen Sie für die stabile Erfassung den Triggerpegel im TRIGGER-Menü auf 0,25 V und wählen Sie NORMAL.

.. figure:: img/ Activity_13_Fig_15.png

Abbildung 15: Op-Amp als Komparatormessungen

.. note::

     Für den Komparator, der in 14 gezeigt ist, folgt:

     .. math::
          if \ quad V_ {in}> V_ {ref} \ quad; \ quad V_ {out} = V _ {+} \ quad (5)

     .. math::
          if \ quad V_ {in} <V_ {ref} \ quad; \ quad V_ {out} = V _ {-}

Fragen
--------------

- Anstiegsrate: Besprechen Sie, wie Sie die Anstiegsgeschwindigkeit in der Einheit-Verstärkungs-Pufferkonfiguration gemessen und berechnet haben, und vergleichen Sie dies mit dem Wert, der im OP97-Datenblatt aufgeführt ist.
- Pufferung: Erklären Sie, warum der Pufferverstärker in Abbildung 5 die Funktion der Spannungsteilerschaltung bei unterschiedlichen Lastwiderständen ermöglicht.
- Ausgangssättigung: Erklären Sie Ihre Beobachtungen der Ausgangsspannung Sättigung in der invertierenden Verstärkerkonfiguration und Ihre Schätzung der internen Spannungen sinkt. Wie nahe kommt die Ausgabe?
   die Versorgungsschienen in diesem Experiment und später auch als Komparator mit unterschiedlichen Versorgungsspannungen? Können Sie erraten, wie hoch der Ausgangsspannungshub für einen Operationsverstärker ist, der als "Rail-to-Rail" -Gerät beworben wird?
- Komparator: Besprechen Sie Ihre Messungen und was passiert, wenn die Polarität von Vref umgekehrt wird.




































































































































































































































































































