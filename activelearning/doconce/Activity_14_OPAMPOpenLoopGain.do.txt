OPAMP Open Loop Verstärkung
======================

Zielsetzung
---------

Das Ziel dieses Experiments ist es, die Verstärkung des offenen Regelkreises zu messen
Eigenschaften eines OP27-Operationsverstärkers.

Anmerkungen
-----

..hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch
wenn man sich auf die Verbindungen zum Red Pitaya STEMlab Board bezieht
Hardware_.

Oscilloscope_ & Signal_ generator_ Anwendung wird zum Generieren verwendet
und Beobachten von Signalen auf der Schaltung.

Erweiterungssteckerstifte für ** - 3.3V ** und ** + 3.3V ** Spannung
Versorgung finden Sie in der Dokumentation here_.

Materialien
---------

- ** Red Pitaya STEMlab 125-14 **. Ein Red Pitaya STEMlab 125-10 ist aufgrund der ADC-Auflösung für diese Messung nicht geeignet!
- OPAMP: 1x OP27
- OPAMP: 1x OP97
- Widerstand: 2x 100: Mathe: `\ Omega`
- Widerstand: 2x 200 :math:`k \ Omega`
- Widerstand: 1x 100 :math:`k \ Omega`
- Kondensator: 2x 0.1 :math:`\ mu F`
- Kondensator: 1x 10 :math:`\ mu F`


Hintergrund
----------

.. _OP27: http://www.analog.com/media/en/technical-documentation/data-sheets/OP27.pdf
.. _tutorial: http://www.analog.com/media/en/training-seminars/tutorials/MT-044.pdf

Anders als der ideale Operationsverstärker hat ein praktischer Operationsverstärker eine begrenzte Verstärkung. Das
Open-Loop-DC-Verstärkung (normalerweise bezeichnet als :math:`A_ {VOL}` und
manchmal als ** forward gain **) ist die Verstärkung des Verstärkers ohne
die Rückkopplungsschleife ist geschlossen, daher der Name "open-loop". Für a
Präzisionsverstärker kann diese Verstärkung sehr hoch sein, in der Größenordnung von 160 dB
(100 Millionen) oder mehr. Die offene Schleifenverstärkung des OP27_-Verstärkers ist
rund 1,8 Millionen.

.. Abbildung :: img/ Activity_14_Fig_1.png

   Abbildung 1: OP27 Datenblatt und Open Loop Gain Wert markiert

   
Die Definition von Open-Loop-Verstärkung ist

.. math::

   A_ {OL} = \ frac {V_ {out}} {(V ^ {+} - V ^ {-})} \ quad (1)

wo :math:`(V ^ {+} - V ^ {-})` ist die Eingangsspannungsdifferenz
 :math:`V_d`, das verstärkt wird,: math:` V ^ {+} `eine Spannung an
nichtinvertierender Eingang und :math:`V ^ {-}` Spannung am invertierenden Eingang.


Spannungsrückkopplungs-Operationsverstärker arbeiten als ** Spannungseingang / Spannungsausgang **
Verstärker und die Open-Loop-Verstärkung ist ein ** dimensionsloses Verhältnis **, also nein
Einheiten sind notwendig. Datenblätter drücken jedoch manchmal Gewinn aus
 :math:`V / mV` oder: math:` V / \ mu V` anstatt :math:`V / V`, für die
Bequemlichkeit der Verwendung kleinerer Zahlen. Oder, Spannungsverstärkung kann auch
ausgedrückt werden in :math:`dB` Terme, als Gain in

.. math::

   Verstärkung \ quad in \ quad dB = 20log (A_ {VOL}) \ quad (2)

.. note::

   Also eine Open-Loop-Verstärkung von

   .. math::

      1V / \ mu V \ quad = \ quad 1 \ quad Millionen V / V \ quad = \ quad 120 dB, \ quad usw.
      
   Lesen Sie das Tutorial_ zu Open Loop Gain und Open Loop Gain Nonlinearity, bevor Sie diese Experimente durchführen.


Verfahren
---------

Die DC - Verstärkung wird gemessen, indem der Ausgang des Prüflings (OPAMP unter
Testen Sie ein OP27 in unserem Fall) um einen bekannten Betrag zu bewegen (1V in unserem Fall,
siehe Abbildung 2), indem R5 zwischen den DUT-Ausgang geschaltet wird (OP27 Pin 6)
und eine 1 V Referenz (STEMlab OUT1 Ausgang) mit Schalter S. Wenn R5 ist
bei + 1V (Schalter S Position POS2), dann muss der Prüflingsausgang (OP27 Pin6)
gehe auf -1V, wenn der Eingang des Hilfsverstärkers bleiben soll
unverändert nahe Null. Die Spannungsänderung am Ausgang des Hilfsverstärkers
 :math:`V_ {out}` (OP97 Pin 6), abgeschwächt um ** R3 / R1 ** Faktor, ist der
Eingang zum Prüfling (OP27 Pin 3), der eine Änderung von 1V verursacht
output.Es ist einfach, den Gewinn daraus zu berechnen:

.. math::

   A_ {OL} = Verstärkung_ {OL} = \ frac {R_3} {R_2} \ frac {1V} {V_ {out}} \ quad (2)

   
.. note::

   Mit anderen Worten, DUT-Eingangsdifferenzspannung
    :math:`V_d = V ^ {+} + {V ^ -}`, (wobei :math:`V ^ - = 0` und: math:` V_d =
   V ^ + `), notwendig, um den DUT-Ausgang auf -1 V zu setzen
    :math:`\ frac {V_ {out}} {A_ {OL}}`.

   Der DUT-Ausgang muss auf -1 V gehen, da sich unser AUX-Operationsverstärker in der Rückkopplungsschleife befindet
   versuchen, seine zu schieben :math:`V_d` zu 0V.

   
**Beispiel:**

Wenn wir nehmen :math:`A_ {OL} = 1.8E6` dann für 1V am DUT (OP27) wir ausgeben
muss Eingangsdifferenzspannung haben :math:`V_d` wie folgt:

.. math::
   
   V_d = \ frac {1V} {1.8E6} \ ungefähr 0,555 \ mu V

   
.. note::

   In der Theorie, um zu messen :math:`A_ {OL}` konnten wir nur eine verwenden
   Signalgenerator (zum Einstellen von :math:`V_ {d}`) und Voltmeter für
   Messungen der DUT-Ausgabe. In der Praxis ist dies jedoch fast nicht der Fall
   duable dou zu Unvollkommenheiten, Rauschlevels, Offset - Niveaus und
   usw. Deshalb verwenden wir die in Abbildung 2 gezeigte Methode
   Führen Sie die Messungen des Ausgangssignals durch :math:`V_ {out}` was ist,
   durch Spannungsteiler (R3 / R2) bezogen auf :math:`V_ {d}` und einige
   Größenordnung größer als :math:`V_ {d}` und somit messbar
   mit unserer Ausrüstung.


** Konstruieren Sie die in Abbildung 2 gezeigte Schaltung. ** Vor dem Einsetzen des R2
und R3 Widerstände in der Schaltung, messen und notieren die Werte der
zwei Widerstände, die ein DMM verwenden, falls verfügbar.

In unserem Fall ist R3 = 97.3k :math:`\ Omega` und R2 = 99.7: math:` \ Omega`

.. Warnung::

   Vor dem Anschluss der Schaltung an die STEMLab -3.3V und + 3.3V Pins
   überprüfe deine Schaltung. Die -3,3V und + 3,3V Spannungsversorgung
   Stifte haben keinen Kurzschluss und können beschädigt werden
   Kurzschlussfall.


.. Abbildung :: img/ Activity_14_Fig_2.png

   Abbildung 2: Spannungsversorgung und Testschaltung

   
.. Warnung::

   C1-Kondensator wird als eine Rückkopplungsimpedanz an der Invertierung verwendet
   Verstärkerkonfiguration des AUX-Operationsverstärkers. Dies wird getan, um zu dämpfen
   alle AC-Signale im Schaltkreis und AUX-Operationsverstärker-Ausgang. Aus diesem Grund
   Es ist gut, große Kapazität von C1 zu haben, um zu beseitigen
   irgendwelche Wechselstromsignale.
   
   Wir wählten 10uF und verwendeten polarisierte (elektrolytische) Kondensatoren
   Hier. Dies ist keine "ok" Lösung, da unser Kondensator sein kann
   Umkehrpolarisation unterzogen. Aber für gute Messungen und
   kurzer Zeitraum der Messungen der Elektrolytkondensator sein kann
   benutzt.


Schritt 1: S ist auf POS1 (Abbildung 2)
-------------------------------

Anstatt Schalter S zu verwenden, kann R5 manuell auf Pin6 des DUT auf dem Steckbrett gesetzt werden.
Erstellen Sie eine Schaltung im Steckbrett und setzen Sie R5 auf POS1.

** Verbinden Sie OUT1 mit IN1 und stellen Sie die Tastkopfdämpfungen auf x1 ein. **

.. Abbildung :: img/ Activity_14_Fig_3.png

   Abbildung 3: Testschaltung. R5 auf POS1 (siehe Abbildung 2)

   
1. Starten Sie die Anwendung Oszilloskop & Signalgenerator

2. Vergewissern Sie sich am linken unteren Bildschirmrand, dass IN1 V / div eingestellt ist
   bis 500mV / Div und IN2 V / Div bis 10mV / Div (Sie können V / div durch
   Wählen Sie den gewünschten Kanal und verwenden Sie die vertikalen +/- Regler)
      
3. Setzen Sie t / div mit horizontalen +/- Bedienelementen auf 100ms / div

4. Wählen Sie im Messmenü "MEAN", wählen Sie IN1 und drücken Sie FERTIG, wählen Sie IN2 und drücken Sie FERTIG

5. ** Anzeige MEAN (IN2): In unserem Fall ist es -34.2mV **


   .. Abbildung :: img/ Activity_14_Fig_4.png

   Abbildung 4: Messungen von :math:`V_ {out}` wenn R5 auf POS1 gesetzt wird (siehe Abbildung 2)


Schritt 2: S ist auf POS2 (Abbildung 2)
--------------------------------

Baue eine Schaltung auf dem Steckbrett und setze R5 auf POS2.

.. Abbildung :: img/ Activity_14_Fig_5.png

   Abbildung 5: Testschaltung. R5 auf POS2 (siehe Abbildung 2)

1. Wählen Sie im Menü OUT1-Einstellungen im Wellenformmenü die Option DC. einstellen
   Amplitudenwert auf 1 V, um eine 1 V Gleichspannung an die Schaltung (R5) anzulegen.

   Deaktivieren Sie die SHOW-Schaltfläche und wählen Sie Aktivieren.

2. Passen Sie die OUT1-Amplitude an, bis MEAN (IN1) nahe 1V erscheint.

3. ** Anzeige MEAN (IN2): In unserem Fall ist es -34.8mV **

   .. Abbildung :: img/ Activity_14_Fig_6.png

   Abbildung 6: Messungen von :math:`V_ {out}` wenn R5 auf POS2 gesetzt ist (siehe Abbildung 2)

   .. note::

      Wie Sie den Messungen entnehmen können, gibt es einen gewissen Offset
      der AUX-Operationsverstärker-Ausgang (Pin 6). Idealerweise wenn R5 auf POS1 gesetzt ist
      (Abbildung 2) :math:`V_ {out}` sollte 0 sein.
      
   Nichtsdestoweniger, während beider (POS1 und POS2) Messungen der DC
   Der Offset ist gleich und wird bei der Berechnung von open aufgehoben
   Kreisverstärkung.
      
   Für eine offene Schleifenverstärkung gemäß Gleichung 2 erhalten wir:

   .. math::

      A_ {OL} = \ Frac {R3} {R2} \ Frac {1V} {(V_ {out_ {POS1}} - V_ {out_ {POS2}})} =

      A_ {OL} = \ Frac {93700.0} {99.7} \ Frac {1V} {(- 34.2mV - (- 34.8mV))} =

      A_ {OL} \ ca. 1566365,764 \ ca. 1,566 Millionen

   
   Vergleichen Sie die Messungen mit dem Datenblattwert aus Abbildung 2.
   Messungen liegen sehr nahe am angegebenen Wert. Um genauer zu sein
   Messung einer Ausrüstung mit höherer Auflösung und weniger lauter Umgebung
   ist notwendig.

































































































































































































































































