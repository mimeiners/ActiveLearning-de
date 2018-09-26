Differenzverstärker
###################

Zielsetzung
___________

Das Hinzufügen und / oder Subtrahieren von analogen Signalen ist möglicherweise die üblichste Funktion, die von einem Operationsverstärker ausgeführt wird. Diese Aktivität untersucht einzelne Operationsverstärkerschaltungen zum Subtrahieren zweier analoger Signale.
Wir haben bereits Summing_ Amplifier_ circuit besprochen; ein einzelner Operationsverstärker zum Hinzufügen von zwei (oder mehr) analogen Signalen. Dasselbe Verhalten erwarten wir auch hier, während Signale in den Operationsverstärker-Eingängen subtrahiert und nicht summiert werden sollten.

Anmerkungen
___________

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Bode: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/bode/bode.html
.. _Summing: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#summing-amplifier-circuit
.. _Amplifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#summing-amplifier-circuit
.. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya STEMlab-Board-Hardware beziehen.
Die für die Spannungsversorgung ** - 3.3V ** und ** + 3.3V ** verwendeten Steckerstifte sind in der Dokumentation hier aufgeführt.
Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.

Kurzer Hintergrund
__________________

Der grundlegende Unterschied Opamp Schaltung ist in Abbildung 1 dargestellt. Um für die Übertragungsfunktion zu lösen :math:`V_ {out} = f (V_1, V_2)` des Differenzverstärkers können wir ein Superpositionsprinzip verwenden.

.. figure:: img/ Activity_16_Fig_01.png

Abbildung 1: Basis Differenzverstärker

Betrachten Sie im ersten Schritt die Schaltung von Abbildung 1, bei der der nichtinvertierende Eingang (Pin 3) auf GND gesetzt ist.
Wir kennen die invertierende Verstärkerschaltung, deren Übertragungsfunktion gegeben ist als

.. math::
V_ {out} = - V_1 \ bigg (\ frac {R_f} {R_i} \ bigg) \ quad (1)

Im zweiten Schritt betrachten wir die Schaltung aus Abbildung 1, wobei :math:`V_1` Eingang auf GND gesetzt wird.
Wir erhalten eine bekannte nicht-invertierende Verstärkerschaltung, deren Übertragungsfunktion gegeben ist als

.. math::
V_ {out} = V_2 \ bigg (1 + \ frac {R_f} {R_i} \ bigg) \ quad (2)
  
Nach dem Superpositionsprinzip bekommen wir

.. math::
V_ {out} = V_ {out_ {Schritt_1}} + V_ {out_ {Schritt_2}} = V_2 \ bigg (1+ \ frac {R_f} {R_i} \ bigg) - V_1 \ bigg (\ frac {R_f} {R_i } \ bigg) \ quad (3)

Aus der obigen Gleichung ist klar ersichtlich, dass die Schaltung von 1 tatsächlich ein Differenzverstärker ist, wobei das Ausgangssignal :math:`V_ {out}` die Differenz der Eingangssignale ist :math:`V_2-V_1` verstärkt um factor: math : `\ frac {R_f} {R_1}`.

Für :math:`R_f = R_i` erhalten wir:

.. math::
V_ {out} = 2V_2 -V_1 \ quad (4)
  


Materialien
___________

- Red Pitaya STEMlab
- OPAMP: 1x OP484
- Widerstand: 4x 10 :math:`k \ Omega`

Verfahren
_________

Bauen Sie den in Abbildung 2 gezeigten Differenzverstärker auf. R3 und R4 werden als Spannungsteiler addiert, um :math:`V_2 ^ *` Eingangssignal um die Hälfte zu dämpfen.
Mit dem hinzugefügten Spannungsteiler (R3, R4) für die in 2 gezeigte Schaltung und aus Gleichung (4) erhalten wir

.. math::
V_ {out} = 2V_2 - V_1 = \ frac {1} {2} 2 V_2 ^ * - V_1 = V_2 ^ * - V_1 = OUT_2 - OUT_1 \ quad (5)

.. figure:: img/ Activity_16_Fig_02.png

Abbildung 2: Differenzverstärker

.. Warnung::
      Bevor Sie den Stromkreis an die STEMlab -3.3V und + 3.3V Anschlüsse anschließen, überprüfen Sie Ihren Stromkreis. Die Spannungsversorgungsstifte -3,3 V und + 3,3 V haben keinen Kurzschluss und können im Falle eines Kurzschlusses beschädigt werden.

.. figure:: img/ Activity_16_Fig_03.png

Abbildung 3: Differenzverstärker auf dem Steckbrett

1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Deaktivieren Sie im Einstellungsmenü der IN1 die Schaltfläche SHOW.
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,2 V ein, um eine 0,4 V-p Sinuswelle mit 0 V als Eingangsspannung zu verwenden :math:`V_1`. Wählen Sie im Wellenform-Menü SINE und aktivieren Sie.
4. Stellen Sie im OUT2-Einstellungsmenü den Amplitudenwert auf 0,6 V ein, um eine 1,2Vp-p-Sinuswelle mit 0 V als Eingangsspannung zu verwenden :math:`V_2 ^ *`. Wählen Sie im Wellenform-Menü SINE und aktivieren Sie.
5. Stellen Sie für die stabile Erfassung die Triggerquelle auf IN2 ein
6. Stellen Sie sicher, dass IN2 V / div am linken unteren Bildschirmrand auf 200mV / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)
7. Stellen Sie sicher, dass OUT1 V / div und OUT2 V / div auf der linken unteren Seite des Bildschirms auf 200mV / div eingestellt sind (Sie können V / div einstellen, indem Sie den gewünschten Kanal und die vertikalen +/- Regler auswählen)
8. Wählen Sie im Messmenü "MAX", wählen Sie IN2 und drücken Sie FERTIG

.. figure:: img/ Activity_16_Fig_04.png

Abbildung 4: Differenzverstärkermessungen

.. note::
     Wie aus den Messungen in Fig. 4 ersichtlich ist, verhält sich unsere Schaltung wie ein Spannungsdifferenzverstärker, da die IN2-Amplitude gleich der Differenz zwischen den OUT2- und OUT1-Amplituden ist, wie es durch Gleichung (5) vorhergesagt wird.

Da beide Eingangssignale sinusförmig sind, ist das einzige Artefakt der Differenzverstärkerschaltung am Ausgangssignal die Amplitudendifferenz. Aber was passiert, wenn wir verschiedene Wellenformen von OUT1 und OUT2 haben.

1. Wählen Sie im OUT2-Einstellungsmenü die SQUARE-Wellenform und beobachten Sie die Ergebnisse

.. figure:: img/ Activity_16_Fig_05.png

Abbildung 5: Differenzverstärkermessungen - Verschiedene Wellenformen von OUT1 und OUT2

Aus Fig. 5 kann ein Differenzverstärkerausgangssignal (IN2) beobachtet werden, das eine merkwürdige Wellenform hat, die als IN2 (Wellenform) = OUT2 (SQUARE) - OUT1 (SINE) angegeben ist.
Diese Beobachtung bestätigt absolut, dass die in 2 gezeigte Schaltung ein Differenzverstärker ist.

.. note::
     Probieren Sie verschiedene OUT1 und OUT2 Wellenformen aus und beobachten Sie die Ergebnisse.
      





















































































































