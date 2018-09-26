



































































BJT gemeinsamer Emitterverstärker
================================

Zielsetzung
---------

Der Zweck dieses Experiments ist es, den gemeinsamen Emitter zu untersuchen
Konfiguration mit dem BJT-Gerät.

Anmerkungen
-----

..hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2


In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch
wenn man sich auf die Verbindungen zum Red Pitaya STEMlab Board bezieht
Hardware_.

Oscilloscope_ & Signal_ generator_ Anwendung wird zum Generieren verwendet
und Beobachten von Signalen auf der Schaltung.

Erweiterungssteckerstifte für ** + 5 V **, ** - 3,3 V ** und ** + 3,3 V **
Spannungsversorgung finden Sie in der Dokumentation hier_.

Hintergrund
----------

Die Konfiguration, die in Fig. 1 gezeigt ist, zeigt einen npn-Transistor
als ein gemeinsamer Emitterverstärker verwendet. Ausgangslastwiderstand :math:`R_L`
ist so gewählt, dass für den gewünschten Nennkollektorstrom
 :math:`I_C`, ungefähr ein Drittel der +5 V Spannung (1,6 V)
erscheint bei :math:`V_ {CE}` (bei DC-Betriebspunktbedingung). Widerstand
 :math:`R_B` legt den Betriebspunkt für die nominale Vorspannung für die
Transistor (Basisstrom :math:`I_B`), um den erforderlichen Kollektor zu versenken
aktuell :math:`I_C`. Das Eingangssignal ist AC-gekoppelt mit der Basis von
der Transistor mit Kondensator :math:`C_1`, um die DC-Vorspannung nicht zu stören
Bedingungen**. Spannungsteiler :math:`\ frac {R_1} {R_2}` wird gewählt
einen selbst vorgespannten DC-Arbeitspunkt bereitstellen. Widerstand :math:`R_E` wird verwendet
Emitterdegeneration (Stromrückkopplung) hinzufügen, um sich zu stabilisieren
der DC-Arbeitspunkt.

Der beste Ansatz für die Auswahl von :math:`R_L` und: math:` R_E`
ist es, Spannungsabfälle quer zu ermöglichen :math:`Q_1`,: math:` R_L` und
 :math:`R_E` entspricht dem 1/3 von: math:` V_ {CC} `(bei DC-Betrieb
Punktbedingung). Also :math:`R_E` =: math:` R_L`. Hinzufügen des Emitters
Degenerationswiderstand hat die Stabilität des DC-Betriebs verbessert
Punkt auf Kosten der reduzierten Verstärkerverstärkung. Eine höhere Verstärkung für AC
Signale können durch Hinzufügen eines Kondensators in gewissem Umfang wiederhergestellt werden
 :math:`C_E` über den Degenerationswiderstand: math:` R_E`, effektiv
Setzen Sie den Wert ": math:` R_E` "nahe Null für AC
Signale. Kondensator :math:`C_2` wird hinzugefügt, um die DC-Komponente zu blockieren
des Ausgangssignals.

.. _2N3904: https://www.sparkfun.com/datasheets/Components/2N3904.pdf
.. _Der Signalpfad: https://www.youtube.com/watch?v=Y2ELwLrZrEM&t=1213s

.. note::
    Wie man einen Common-Emitter-Verstärker entwickelt, wird in a gut erklärt
    Video-Tutorial zum `The Signal Path`_ Youtube-Kanal.


.. figure:: img/ Activity_26_Fig_1.png

Abbildung 1: Gemeinsame Emitter-Verstärker-Konfiguration


Schnelle Berechnung des gemeinsamen Emitterverstärkers
-------------------------------------------------

Nehmen wir an, wir wollen einen Verstärker mit der Verstärkung konstruieren
 :math:`A = 5` mit npn-Transistor 2N3904_ und einer Spannungsversorgung von
 :math:`V_ {CC} = 5V`.


Für den NPN-Transistor 2N3904 können wir folgendes annehmen :math:`\ beta = 100` und
 :math:`v_ {CE_ {sat}} = 0.2 V`. In einem ersten Schritt wird der DC-Arbeitspunkt eingestellt
durch Entscheiden von Spannungen über :math:`R_L`,: math:` R_E` und :math:`Q_1`.

   
.. math::

   V_ {R_L} + (V_ {CE} + v_ {CE_ {sat}}) + V_ {R_E} = V_ {CC} \ quad (1)


Wenn wir berücksichtigen :math:`v_ {CE_ {sat}}` und 1/3 Verhältnis von
Spannungen an :math:`R_L`,: math:` R_E` und :math:`Q_1` erhalten wir folgendes:


.. math::
      
   1,6 V + 1,6 V + 0,2 V + 1,6 V = 5 V / Quad (2)


Vom gewünschten Verstärkungswert :math:`A` können wir berechnen: math:` R_L`
mit Gl. (3) - (7)

.. math::
      
   A = \ Beta \ Frac {R_ {out}} {R_ {in}}. \ quad (3)

wo :math:`R_ {out}` ist der Widerstand in Serie mit der
Kollektor und :math:`R_ {in}` ist der in Reihe geschaltete Widerstand
mit der Basis.

.. math::

   R_ {out} = R_L \ quad \ text {und,} \ quad R_ {in} = R_ {B} \ quad (4)

Es folgt:

.. math::
      
   A = \ beta \ frac {R_L} {R_B} \ quad (5)

In diesem Schritt müssen wir ** aktuelle Bewertungen unseres Verstärkers einstellen **
d. h. wir müssen wählen :math:`I_C` um zu berechnen: math:` R_L`.

Lass uns setzen :math:`I_C = 5 mA`, dann
 
.. math::
   
   R_L = \ Frac {V_ {R_L}} {I_C} = \ Frac {1.6V} {5mA} = 320 \ Omega \ quad (6)


Um Gl. (2) Daraus folgt:

.. math::

   R_E = R_L, \ quad \ text {d. H.} \ Quad R_E = \ frac {V_ {R_L}} {I_C} = 320 \ Omega. \ quad (7)

Jetzt können wir berechnen :math:`R_ {in}`, d. H . :math:`R_ {B}` Wert als:


.. math::

   R_ {B} = \ Betafrac {R_L} {A} = 100 \ Frac {320 \ Omega} {5} = 6.4k \ Omega. \ quad (8)


Der letzte Schritt besteht darin, Werte von DC-Vorspannungswiderständen zu berechnen
 :math:`R_1` und: math:` R_2`.  :math:`R_2` kann erhalten werden von
"Kochbuch" -Beziehung in Gl. (9) und deshalb: Mathe: `R_1`
kann aus Gl. (10).


.. math::

   R_2 & \ ca. 10 R_E \ quad (9)

   R_2 & = 3,2 k \ Omega


.. math::

   R_1 = \ frac {V_ {CC} - (v_ {BE} + V_ {R_E})} {\ frac {(v_ {BE} + V_ {R_E})} {R_2}} \ quad (10)

wo :math:`v_ {BE} = 0.6 V`

.. math::
   
   R_1 = \ frac {5 V - (0,6 V + 1,6 V)} {\ frac {(0,6 V + 1,6 V)} {3,2 k \ Omega}} = 4,0 k \ Omega

 
.. note::
   Die oben gezeigte Berechnung des gemeinsamen Emitterverstärkers sollte sein
   Verwenden Sie als Richtlinie und nicht als definitive Design-Blaupause. Das
   Grund dafür ist, dass in den meisten Fällen berechnete Werte von
   Die Widerstände liegen außerhalb der verfügbaren Widerstände
   der Markt. Daher sollten Widerstandswerte abgerundet oder geändert werden
   um sie an die Schlusswerte von allgemein verfügbaren anzupassen
   Widerstände. Es ist eine gute Übung, zu setzen :math:`R_1` und
    :math:`R_B` als Potentiometer da wir mit diesen zwei Widerständen können
   Tuner manuell einstellen. Tuning des Verstärkers ist notwendig
   da Transistoren sich voneinander unterscheiden können.

   Auswahl der Werte der Kondensatoren :math:`C_1`,: math:` C_2` und
    :math:`C_E` wird durch die Verwendung von Kondensatoren mit hohem Wert während der
   Die maximale Nennspannung der Kondensatoren muss größer als sein
    :math:`V_ {CC}`. Üblicherweise werden Elektrolytkondensatoren verwendet
   in Bereichen von :math:`\ mu F`. Wenn wir (Emitter - Gnd) bringen wollen
   Impedanz (für AC) nahe bei Null dann :math:`C_E` muss groß sein wie
   möglich. Auch :math:`C_1`,: math:` C_2` sollte groß sein
   verhindern Sie große Spannungsabfälle über sie.

   
Materialien
---------

- Rotes Pitaya STEMlab
  
- 2x 470Ω Widerstand
  
- 2x 10kΩ Widerstand
  
- 1x 10kΩ Trimer
  
- 1x 1kΩ Widerstand
  
- 1x 10uF Kondensator
  
- 2x 4,7 uF Kondensator
  
- 1x kleinsignal NPN-Transistor (2N3904_)
  
- 1x lötfreies Steckbrett

  
Verfahren
---------

Nach obigen Berechnungen und Richtlinien haben wir gemeinsam gebaut
Emitter-Verstärker in Abbildung 2 gezeigt. Wir hatten eine :math:`470 \ Omega`
Widerstände verfügbar und diese Widerstände wurden verwendet für :math:`R_L` und
 :math:`R_E`. Nach Auswahl von :math:`R_L` und: math:` R_E` der anderen
Komponenten wurden berechnet und ausgewählt.


.. figure:: img/ Activity_26_Fig_2.png

Abbildung 2: Gemeinsamer Emitterverstärker mit Komponentenwerten


1. Bauen Sie die Schaltung aus Abbildung 2 auf dem Steckbrett auf.

.. figure:: img/ Activity_26_Fig_3.png

Abbildung 3: Gemeinsamer Emitter-Verstärker auf dem Steckbrett

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Einstellungsmenü OUT1 den Amplitudenwert auf 0,1 V, DC-Offset auf ein
   0 V und Frequenz bis 10 kHz zum Anlegen der Eingangsspannung. Von dem
   Waveform-Menü wählen Sie SINE, deaktivieren Sie die SHOW-Taste und wählen Sie enable.
   
4. Vergewissern Sie sich auf der linken Seite des Bildschirms, dass IN1 und IN2 V / div
   sind auf 200mV / div eingestellt (Sie können V / div einstellen, indem Sie die gewünschte Option auswählen
   Kanal und mit vertikalen +/- Kontrollen)
   
5. Setzen Sie t / div Wert auf 20us / div (Sie können t / div mit horizontalen +/- einstellen
   Kontrollen)
   
6. In den Einstellungen des Auslösermenüs und wählen Sie NORMAL
   
7. Wählen Sie im Messmenü P2P für IN1 und IN2
   

.. figure:: img/ Activity_26_Fig_4.png

Abbildung 4: Gemeinsame Emitterverstärker-Messungen

In 3 sind die Messungen des gemeinsamen Emitterverstärkers
gezeigt. Aus den P2P-Messungen können wir die erzielte Verstärkung und es berechnen
ist ungefähr :math:`A \ approx 9`.


Fragen
---------

1. Versuchen Sie, den Wert von :math:`R_ {B_ {pot}}` zu ändern und beobachten Sie die Änderung
   im Gewinn?
   
2. Was ist der maximale Spannungshub des Ausgangssignals?
   
3. Erhöhen Sie die OUT1-Frequenz und versuchen Sie, die Verstärkerbandbreite zu messen.
   

Für Frage 2 folgen Sie als nächstes:

Stellen Sie den Sondensensor ** IN2 auf x10, im Menü SET Sonde des IN2
Dämpfung auf 10 ** und Erhöhung der OUT1-Amplitude auf 0,2 V. Was ist der
P2P-Wert des IN2?


Mit Verstärkung :math:`A = 9`, Eingangssignal P2P Amplitude 0,4V der Ausgang
P2P (IN2) -Wert sollte sein :math:`0.4 \ mal 9 = 3.6 V`! Aber es ist nicht?
Signal ist abgeschnitten! Kannst du erklären warum?

.. note::
   
   Überprüfen Sie die obigen Berechnungen und Spannungen über :math:`V_ {CE}`




































































































































































































































