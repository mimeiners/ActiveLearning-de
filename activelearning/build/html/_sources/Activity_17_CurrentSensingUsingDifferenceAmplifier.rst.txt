Strommessung mit einem Differenzverstärker
##########################################


Zielsetzung
___________

Das Ziel dieser Laboraktivität ist es, aktuelle Sensortechniken zu untersuchen, die einen als Differenzverstärker konfigurierten Operationsverstärker verwenden.

Anmerkungen
___________

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _amplifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity16_DifferenceAmplifier.html#difference-amplifier
.. _difference: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity16_DifferenceAmplifier.html#difference-amplifier
.. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya STEMlab-Board-Hardware beziehen.
Die für die Spannungsversorgung ** - 3.3V ** und ** + 3.3V ** verwendeten Steckerstifte sind in der Dokumentation hier aufgeführt.
Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.

Hintergrund
___________


Wir haben den Differenzverstärker untersucht. Jetzt werden wir es als einen Stromleseverstärker verwenden. Eine der Hauptanwendungen des Operationsverstärker-Differenzverstärkers besteht darin, den Strom an einem Punkt in einer Schaltung zu messen, der anders ist als dort, wo er in die Erde oder aus dem Masse- oder dem gemeinsamen Knoten fließt. Der zu messende Strom wird in eine kleine Spannung umgewandelt, indem der Strompfad aufgebrochen wird und ein niederohmiger Widerstand in Reihe geschaltet wird. Dieser Widerstand wird als Strom-Shunt-Widerstand oder einfach Shunt bezeichnet. Der Widerstand wird klein gehalten und der Spannungsabfall über dem Shunt klein gemacht, um jegliche Auswirkungen zu verringern, die diese Änderung auf den Betrieb der Schaltung haben könnte.
Der durch den Shunt-Widerstand gehende Pfadstrom ist daher als gegeben

.. math::
     
    I_ {Pfad} = I_ {Shunt} = \ Frac {\ Delta V} {R_ {Shunt}} \ Quad (1)

Da die differentielle Spannung über dem Widerstand (gegeben als: m / V = ​​V_ {R_ {shunt_ {node_1}}} - V_ {R_ {shunt_2}}}) gemessen werden sollte, können wir sehen, dass ein Differenzverstärker ist eine ideale Schaltung für diese Aufgabe. Der kleine differentielle Spannungsabfall über den Shunt wird verstärkt und durch einen Operationsverstärker-Differenzverstärker in eine single-ended (common referenzed) Spannung umgewandelt.

.. figure:: img/ Activity_17_Fig_01.png

Abbildung 1: Basis-Differenzverstärker in der Stromsensorkonfiguration


Aus der Abbildung 1 wissen wir, dass die differentielle Spannung :math:`Delta V` gegeben ist als :math:`Delta V = I_L R_s` trägt Informationen über den Strom LOAD. Auch aus der Differenz_Verstärker-Theorie wissen wir, dass :math:`\ Delta V` irgendwie mit dem verwandt wird :math:`V_ {out}`.
Die erste Annahme ist wie folgt:

.. math::
    V_ {out} \ propto \ Delta V = I_L R_s \ quad (1)

oder,

.. math::
    I_L \ propto \ frac {V_ {out}} {R_s}

.. math::


Mit anderen Worten; einfach durch Messen und Skalieren :math:`V_ {out}` wir messen den Laststrom,
wo :math:`R_ {s}` ist Widerstand Widerstand.
Übertragungskennlinie des Differenzverstärkers für den in 1 gezeigten Schaltkreis ist:

.. math::
V_ {out} = V_ + \ bigg (1 + \ frac {R_2} {R_1} \ bigg) - V_- \ bigg (\ frac {R_2} {R_1} \ bigg) \ quad (2)

Wobei :math:`V _ {+}` und :math:`V _ {-}` Spannungen an nicht invertierenden (Pin 3) bzw. invertierenden (Pin 2) Operationsverstärkungseingängen sind.
Ersetzung :math:`V _ {+}` und :math:`V _ {-}` für Spannungen an Shunt-Widerstandsknoten erhalten wir

.. math::
V_ {out} = V_S \ bigg (\ frac {R_4} {R_3 + R_4} \ bigg) \ bigg (1 + \ frac {R_2} {R_1} \ bigg) - V_L \ bigg (\ frac {R_2} {R_1 } \ bigg) \ quad (3)

wo :math:`V_S` ist die Quellspannung und: math:` V_L` Lastspannung. Wir können auch schreiben

.. math::
V_S = V_ {R_ {shunt_ {Knoten_1}}} \ quad V_L = V_ {R_ {shunt_ {node_2}}}

und

.. math::
V_S = V_L + \ Delta V \ Quad \ Delta V = V_S - V_L

Auf den ersten Blick, durch Hinzufügen von Widerstand :math:`R_4` zu der Schaltung, in Abbildung 1 gezeigt, irgendwie haben wir komplizierte Übertragungsfunktion; von Gleichung (2) zu Gleichung (3).
Aber das Hinzufügen von :math:`R_4` ist notwendig, um den Faktor :math:`1 + R_2 / R_1` zu dem Faktor :math:`R_2 / R_1` aus der Gleichung (2) auszugleichen, um die Operationsverstärker-Eingangsspannungen gleich zu erhalten verstärkt und damit einfach möglich :math:`\ Delta V` zu :math:`V_ {out}` Korrelation.
Der wichtige Schritt ist, Werte von :math:`R_3` und :math:`R_4` als zu wählen

.. math::
R_4 = R_2 \ Vierer R_3 = R_1

Unter Verwendung der obigen Identitäten können wir Gleichung (3) als schreiben

.. math::
V_ {out} = V_S \ bigg (\ frac {R_2} {R_1 + R_2} \ bigg) \ bigg (1 + \ frac {R_2} {R_1} \ bigg) - V_L \ bigg (\ frac {R_2} {R_1 } \ bigg) \ quad (4)

.

V_ {out} = V_S \ bigg (\ frac {R_2} {R_1 + R_2} + \ frac {R_2R_2} {R_1 (R_1 + R_2)} \ bigg) - V_L \ bigg (\ frac {R_2} {R_1} \ bigg)

Das hält das

.. math::
     \ bigg (\ frac {R_2} {R_1 + R_2} + \ frac {R_2R_2} {R_1 (R_1 + R_2)} \ bigg) = \ frac {R_2} {R_1}

So können wir Gleichung (4) einfach schreiben als:

.. math::
V_ {out} = V_S \ bigg (\ frac {R_2} {R_1} \ bigg) - V_L \ bigg (\ frac {R_2} {R_1} \ bigg) \ quad (5)

Nun haben wir eine einfache Gleichung (5) für unsere Differenzverstärkerform Fig. 1, und der letzte Schritt besteht darin, sie neu zu schreiben in :math:`Delta V`, d. H. In Bezug auf :math:`I_L`

.. math::
V_ {out} = \ bigg (\ frac {R_2} {R_1} \ bigg) (V_S-V_L)

.

     V_ {out} = \ frac {R_2} {R_1} \ Delta V

     .

     V_ {out} = \ frac {R_2} {R_1} I_LR_S \ quad (6)


.. note::

    Und für: Mathe: `I_L` bekommen wir:

    .. math::

        I_L = V_ {Aus} \ Frac {R_1} {R_2 R_S} \ Quad (7)


** In unserem Beispiel haben wir **
---------------------------

.. math::
R_4 = R_2 = 100k \ Omega, \ quad R_3 = R_1 10k \ Omega, \ quad R_2 / R_1 = 10, \ quad R_S = R_5 = 10 \ Omega, \ quad I_L = \ frac {V_ {out}} {10 R_S }


.. note::
     ** In unserem Beispiel wird der Laststrom als ** angegeben.

      .. math::
          I_L = \ frac {V_ {out}} {100} \ quad (8)
 
Materialien
___________

- Rotes Pitaya STEMlab
- OPAMP: 1x OP484_ Quad Rail zu Rail Verstärker
- Widerstand: 3x 10 :math:`k \ Omega`
- Widerstand: 1x 100 :math:`k \ Omega`
- Widerstand: 1x 10 :math:`\ Omega`
- Widerstand: 1x 220: Mathe: `\ Omega`
- Kondensator: 1x 0.1 :math:`\ mu F`
- Induktivität: 1x 4.7 :math:`mH`

Richtungen
__________

Bauen Sie den in Abbildung 2 gezeigten Strommessverstärker auf. R6 wird hinzugefügt, um den Ausgang des OP484 zu stabilisieren. Bei Verwendung großer Rückkopplungswiderstände kann das OP484 aufgrund der großen Eingangskapazität des IN2-Eingangs instabil werden.  :math:`V_ {S}` wird direkt vom OUT1 STEMlab-Ausgang als "Stromversorgung" für den LOAD bereitgestellt.
Die Last besteht aus verschiedenen Impedanzen wie einem Widerstand, Kondensator oder Induktor.
Das Eingangsspannungssignal IN2 zeigt direkt den Laststrom, wie in Gleichung 8 gezeigt.


.. figure:: img/ Activity_17_Fig_02.png

Abbildung 2: Differenzverstärkerschaltung für die Strommessung

Komponentenwerte sind nächste:

.. math::
     
     R_4 = R_2 = 100k \ Omega, \ quad R_3 = R_1 = 10k \ Omega, \ quad R_S = R_5 = 10 \ Omega, \ quad R_6 = 220 \ Omega,

     \ quad C_1 = 0,1 \ mu F, \ quad \ viereck L_1 = 4,7 mH


Verfahren
_________

Widerstand LAST
---------------

Für LOAD nimm :math:`470 \ Omega` Widerstand und Bau Schaltung in Abbildung 2 gezeigt.

.. figure:: img/ Activity_17_Fig_03.png

Abbildung 3: Differenzverstärkerschaltung für Strommessung - Resistive LOAD


1. Starten Sie die Anwendung Oszilloskop & Signalgenerator.
2. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5 V ein, um eine Sinuswelle als Eingangsspannung zu verwenden :math:`V_ {source}`. Wählen Sie im Wellenformmenü SINE,
   Deaktivieren Sie den SHOW-Button und wählen Sie enable.
3. Stellen Sie für die stabile Erfassung die Triggerquelle auf IN1 ein
4. Stellen Sie sicher, dass IN1 V / div am linken unteren Bildschirmrand auf 200mV / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)
5. Stellen Sie sicher, dass IN2 V / div am linken unteren Bildschirmrand auf 50mV / div gestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)
6. Wählen Sie im Messmenü "MAX", wählen Sie IN1 und drücken Sie FERTIG
7. Wählen Sie im Messmenü "MAX", wählen Sie IN2 und drücken Sie FERTIG
8. Setzen Sie t / div Wert auf 200us / div (Sie können t / div mit horizontalen +/- Kontrollen einstellen)
9. Auslesen von IN2 und Berechnen des Laststroms unter Verwendung von Gleichung (8)


.. figure:: img/ Activity_17_Fig_04.png

Abbildung 4: Widerstands-LOAD-Strommessungen

Aus den Messungen von Abbildung 4 können wir den maximalen Laststrom berechnen als:

.. math::
     
     I_L = \ frac {IN2_ {max}} {100} = \ frac {108,0 mV} {100} = 1,08 mA

Wir können unsere Messungen überprüfen, indem wir den Laststrom als berechnen

.. math::
     
     I_L = \ Frac {OUT1_ {max}} {R_ {Laden} + R_s} = \ Frac {0.5V} {470 \ Omega + 10 \ Omega} = 1.04mA

Wir können sehen, dass der gemessene Strom dem entspricht, was wir erwartet haben, um das korrekte Verhalten unseres Differenzverstärkers zu bestätigen.
Die Differenz von 0,04 mA zwischen exaktem und gemessenem Wert des Laststroms ergibt sich aus den nominalen Toleranzen der Last und der Shunt-Widerstände.

Kapazität LAST
--------------

Für LOAD nehmen Sie :math:`0.1 \ mu F` Kondensator und bauen Schaltung wie in Abbildung 2 gezeigt.

.. figure:: img/ Activity_17_Fig_05.png

Abbildung 5: Kapazität LOAD

.. figure:: img/ Activity_17_Fig_06.png

Abbildung 6: Kapazitäts-LOAD-Strommessungen

Aus den Messungen aus Abbildung 6 können wir den maximalen Laststrom berechnen als:

.. math::
     
     I_L = \ Frac {IN2_ {max}} {100} = \ frac {36.5mV} {100} = 0.36mA

Wir können unsere Messungen überprüfen, indem wir den Laststrom als berechnen

.. math::
     
     I_L = \ Frac {OUT1_ {max}} {Z_ {Laden} + R_s} = \ Frac {OUT1_ {max}} {\ frac {1} {2 \ pi f_ {OUT_1} C_1} + R_s} = \ frac { 0,5 V} {1592 \ Omega + 10 \ Omega} = 0,31 mA

Induktive Last
--------------

Für LOAD nehmen Sie :math:`4.7 mH` Induktor und bauen Schaltung wie in Abbildung 2 gezeigt.

.. figure:: img/ Activity_17_Fig_07.png

Abbildung 7: Induktive Last


1. Stellen Sie im OUT1-Einstellungsmenü den Amplitudenwert auf 0,2 V ein
2. Vergewissern Sie sich auf der linken unteren Seite des Bildschirms, dass IN1 V / div auf 50 mV / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)
3. Stellen Sie sicher, dass IN2 V / div am linken unteren Bildschirmrand auf 500 mV / div eingestellt ist (Sie können V / div einstellen, indem Sie den gewünschten Kanal auswählen und die vertikalen +/- Regler verwenden)


.. figure:: img/ Activity_17_Fig_08.png

Abbildung 8: Induktive LOAD Strommessungen

Aus den Messungen aus Abbildung 8 können wir den maximalen Laststrom berechnen als:

.. math::
     
     I_L = \ Frac {IN2_ {max}} {100} = \ frac {620mV} {100} = 6.2mA

Wir können unsere Messungen überprüfen, indem wir den Laststrom als berechnen

.. math::
     
     I_L = \ Frac {OUT1_ {max}} {Z_ {Laden} + R_s} = \ Frac {OUT1_ {max}} {2 \ pi f_ {OUT_1} L_1 + R_s} = \ frac {0.2V} {30 \ Omega +10 \ Omega} = 5,0 mA

.. note::
    Bei der induktiven Last haben wir den größten Unterschied in den Messungen. Versuchen Sie zu erklären, warum.
    note. Störeffekte, Serienwiderstand eines Induktors.





















































































































































































































































































