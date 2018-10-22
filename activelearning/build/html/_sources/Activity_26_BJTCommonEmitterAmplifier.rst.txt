BJT gemeinsamer Emitterverstärker
=================================

Zielsetzung
-----------

Der Zweck dieses Versuchs ist es, die gängige Emitterkonfiguration des BJT-Transistors zu untersuchen.

Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signalgeneratoranwendung: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch,
wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht.

Oscilloscope- & Signalgeneratoranwendung_ wird zum Erzeugen und Beaibachten von
Signalen auf der Schaltung verwendet.

Die Erweiterungsstecker-Pins für die Spannungsversorgung **+5 V**, **-3,3 V** und **+3,3 V**
sind in der Dokumentation_ dargestellt.


Hintergrund
-----------

Die in :numref:`26_fig_01` dargestellte Konfiguration zeigt einen npn-Transistor, der als
Common-Emitter-Verstärker verwendet wird. Der Ausgangslastwiderstand :math:`R_L` ist so
gewählt, dass für den gewünschten Kollektornennstrom :math:`I_C` etwa ein Drittel der :math:`+5\,V`
Spannung (:math:`1,6\,V`) bei :math:`V_{CE}` (DC-Arbeitspunktbedingung) erscheint. Der Widerstand
:math:`R_B` stellt den Nennarbeitspunkt für den Transistor (Basisstrom :math:`I_B`) ein, um den
erforderlichen Kollektorstrom :math:`I_C` zu senken. Das Eingangssignal ist mit der Basis des
Transistors mit dem Kondensator :math:`C_1` AC gekoppelt, um die DC-Vorspannung nicht zu stören.
Der Spannungsteiler :math:`\frac{R1}{R2}` wird gewählt, um einen selbstvorbelasteten DC-Arbeitspunkt
bereitzustellen. Der Widerstand :math:`R_E` wird zur Addition der Emitterschwankungen (Stromrückführung)
verwendet, um den DC-Arbeitspunkt zu stabilisieren.

Der beste Ansatz für die Auswahl von :math:`R_L` und :math:`R_E` besteht darin, Spannungsabfälle
über :math:`Q_1`, :math:`R_L` und :math:`R_E` zu ermöglichen, die dem 1/3 des VCC entsprechen (DC-Arbeitspunktbedingungen).
Daher :math:`R_E = R_L`. Das Hinzufügen des Emitter-Degenerationswiderstandes hat die
Stabilität des DC-Arbeitspunktes auf Kosten der reduzierten Verstärkung verbessert.
Eine höhere Verstärkung für Wechselstromsignale kann bis zu einem gewissen
Grad wiederhergestellt werden, indem der Kondensator :math:`C_E` über den Degenerationswiderstand :math:`R_E`
hinzugefügt wird, wodurch der " :math:`R_E` " Wert für Wechselstromsignale praktisch gegen Null
gesetzt wird. Der Kondensator :math:`C_2` wird hinzugefügt, um die DC-Komponente des Ausgangssignals
zu blockieren.

.. _2N3904: https://www.sparkfun.com/datasheets/Components/2N3904.pdf
.. _The Signal Path: https://www.youtube.com/watch?v=Y2ELwLrZrEM&t=1213s

.. note::
    Wie man einen Common-Emitter-Verstärker entwickelt, wird in einem Video-Tutorial
    auf `The Signal Path`_ Youtube-Kanal ausführlich erklärt.

.. figure:: img/ Activity_26_Fig_01.png
   :name: 26_fig_01
   :align: center

   Gemeinsame Emitter-Verstärker-Konfiguration

   

Schnelle Berechnung des gemeinsamen Emitterverstärkers
------------------------------------------------------

Angenommen, wir wollen einen Verstärker mit der Verstärkung :math:`A=5` mit einem 2N3904_ npn-Transistor
und einer Spannungsversorgung von :math:`V_{CC}=5\,V` entwerfen.

Für den npn-Transistor 2N3904 können wir davon ausgehen, dass Für den NPN-Transistor 2N3904_ können wir folgendes annehmen :math:`\beta = 100` und
:math:`v_ {CE_ {sat}} = 0.2 V`. In einem ersten Schritt wird der DC-Arbeitspunkt eingestellt
durch Entscheiden von Spannungen über :math:`R_L`, :math:`R_E` und :math:`Q_1`.:math:`\beta = 100`
und :math:`V_{CE_{sat}}=0,2\,V`. Der erste Schritt ist die Einstellung des
DC-Arbeitspunktes durch die Wahl der Spannungen über :math:`R_L`,
:math:`R_E` und :math:`Q_1`.

   
.. math::
   :label: 26_eq_1

   V_{R_L} + (V_{CE} + v_{CE_{sat}}) + V_{R_E} = V_{CC}

   
Wenn wir :math:`V_{CE_{sat}}` und 1/3 Verhältnis der Spannungen auf :math:`R_L`, :math:`R_E`
und :math:`Q_1` berücksichtigen, erhalten wir folgendes:


.. math::
   :label: 26_eq_2
      
   1,6 V + 1,6 V + 0,2 V + 1,6 V = 5 V


Aus dem Sollwert der Verstärkung A können wir den Wert für :math:`R_L` mit den
Gleichungen (3) - (7) berechnen.

.. math::
   :label: 26_eq_3
      
   A = \beta \frac{R_ {out}}{R_ {in}}.

   
wobei :math:`R_{out}` der Widerstand ist, der in Reihe mit dem Kollektor geschaltet ist,
und :math:`R_{in}` der Widerstand ist, der in Reihe mit der Basis geschaltet ist.

.. math::
   :label: 26_eq_4

   R_{out} = R_L \quad \text{und} \quad R_{in} = R_{B}

   
Es folgt:

.. math::
   :label: 26_eq_5
      
   A = \beta \frac{R_L}{R_B}

In diesem Schritt müssen wir die **Nennströme unseres Verstärkers** einstellen, d.h. wir
müssen den IC zur Berechnung des RL wählen.

Setzen wir :math:`I_C = 5\,mA`, dann folgt
 
.. math::
   :label: 26_eq_6
   
   R_L = \frac{V_{R_L}}{I_C} = \frac{1.6V}{5mA} = 320 \Omega


Entspprechend der Gleichung :numref:`26_eq_02`, folgt daraus:

.. math::
   :label: 26_eq_7

   R_E = R_L, \quad \text{d.h.} \quad R_E = \frac{V_{R_L}}{I_C} = 320 \Omega.

   
Jetzt können wir den Wert für :math:`R_{in}` bzw. :math:`R_{B}` berechnen als:

.. math::
   :label: 26_eq_8

   R_{B} = \beta \frac{R_L}{A} = 100 \frac{320 \Omega}{5} = 6.4\,k\Omega.


Der letzte Schritt ist das Berechnen der Werte der DC-Vorspannungswiderstände :math:`R_1` und :math:`R_2`.
:math:`R_2` kann aus der in Gleichung (:eq:`26_eq_9`) angegebenen "Kochbuch"-Beziehung gewonnen werden und somit
kann :math:`R_1` aus Gleichung (:eq:`26_eq_10`) berechnet werden.


.. math::
   :label: 26_eq_9

   R_2 \approx 10 R_E = 3,2 \,k\Omega


.. math::
   :label: 26_eq_10

   R_1 = \frac{V_{CC} - (v_{BE} + V_{R_E})}{\frac{(v_{BE} + V_{R_E})}{R_2}}

   
wo :math:`V_{BE} = 0.6\,V`


.. math::
   
   R_1 = \frac{5\,V - (0,6\,V + 1,6\,V)}{\frac{(0,6\,V + 1,6\,V)}{3,2\,k\Omega}} = 4,0\,k\Omega

 
.. note::
   Die oben gezeigte Berechnung des herkömmlichen Emitterverstärkers sollte als
   Richtlinie und nicht als definitive Entwurfsgrundlage verwendet werden. Der
   Grund dafür ist, dass in den meisten Fällen berechnete Werte der Widerstände
   außerhalb der auf dem Markt verfügbaren Widerstände liegen. Daher sollten die
   Widerstandswerte gerundet oder geändert werden, um sie an die Endwerte von
   handelsüblichen Widerständen anzupassen. Es ist eine gute Praxis, :math:`R_1` und :math:`R_B` als
   Potentiometer einzustellen, da wir mit diesen beiden Widerständen den Verstärker
   manuell abstimmen können. Die Abstimmung des Verstärkers ist notwendig, da sich die
   Transistoren voneinander unterscheiden können.

   Die Auswahl der Werte der Kondensatoren :math:`C_1`, :math:`C_2` und :math:`C_E` erfolgt durch die Verwendung
   hochwertiger Kondensatoren, wobei die maximale Nennspannung der Kondensatoren größer
   als VCC sein muss. Üblicherweise werden Elektrolytkondensatoren in den Bereichen
   von :math:`\mu F` verwendet. Wenn wir die Impedanz (für AC) nahe Null bringen wollen, dann
   muss :math:`C_E` so groß wie möglich sein. Auch :math:`C_1`, :math:`C_2` sollte groß sein,
   um große Spannungsabfälle über ihnen zu vermeiden.

   
Materialien
-----------

- Red Pitaya STEMlab
  
- 2x :math:`470\,\Omega` Widerstand
  
- 2x :math:`10\,k\Omega` Widerstand
  
- 1x :math:`10\,k\Omega` Trimer
  
- 1x :math:`1\,k\Omega` Widerstand
  
- 1x :math:`10\,\mu F` Kondensator
  
- 2x :math:`4,7\,\mu F` Kondensator
  
- 1x kleinsignal NPN-Transistor (2N3904_)
  
- 1x lötfreies Steckbrett

  
  
Verfahren
---------

Nach obigen Berechnungen und Richtlinien haben wir gemeinsam gebaut
Emitter-Verstärker in Abbildung 2 gezeigt. Wir hatten eine :math:`470 \Omega`
Widerstände verfügbar und diese Widerstände wurden verwendet für :math:`R_L` und
:math:`R_E`. Nach Auswahl von :math:`R_L` und :math:`R_E` der anderen
Komponenten wurden berechnet und ausgewählt.


.. figure:: img/ Activity_26_Fig_02.png

   Abbildung 2: Gemeinsamer Emitterverstärker mit Komponentenwerten

   

1. Bauen Sie die Schaltung aus Abbildung 2 auf dem Steckbrett auf.

   .. figure:: img/ Activity_26_Fig_03.png
      :name: 26_fig_03
      :align: center

      Gemeinsamer Emitter-Verstärker auf dem Steckbrett

   
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
   

   .. figure:: img/ Activity_26_Fig_04.png
      :name: 26_fig_04
      :align: center

      Gemeinsame Emitterverstärker-Messungen
      

   
In :numref:`26_fig_03` sind die Messungen des gemeinsamen Emitterverstärkers
gezeigt. Aus den P2P-Messungen können wir die erzielte Verstärkung und es berechnen
ist ungefähr :math:`A \approx 9`.


Fragen
------

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
