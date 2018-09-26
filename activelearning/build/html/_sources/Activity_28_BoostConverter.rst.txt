DC-DC-Aufwärtswandler
=====================

Zielsetzung
-----------

Hier werden wir eine induktivitätsbasierte Schaltung untersuchen, die
eine Ausgangsspannung erzeugen kann, die höher als die zugeführte
Spannung ist. Diese Klasse von Schaltungen wird als DC / DC-Wandler
oder Boost-Regler bezeichnet. In diesem Experiment wird die Spannung
von einer 1,5-V-Versorgung (Batterie) auf eine Spannung erhöht, die
hoch genug ist (~ 5 V), um zwei LEDs in Reihe zu treiben. **Beachten
Sie, dass die Vorwärtsspannung der LED typischerweise 1,8 V beträgt,
obwohl sie für einige Dioden bis zu 3,3 V (blaue LED) reichen kann** 

Anmerkungen
-----------

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _this Wikipedia article: https://en.wikipedia.org/wiki/Boost_converter
.. _IRLU120N: http://www.infineon.com/dgdl/irlr120n.pdf?fileId=5546d462533600a4015356695f642663
.. _1N4001: http://www.vishay.com/docs/88503/1n4001.pdf
.. _boost converter calculator: https://learn.adafruit.com/diy-boost-calc/the-calculator
.. _2N3904: https://www.sparkfun.com/datasheets/Components/2N3904.pdf


In diesen Tutorials verwenden wir die Terminologie aus dem
Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
STEMlab-Board-Hardware beziehen.

Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und
Beobachten von Signalen auf der Schaltung verwendet.

Die für die Spannungsversorgung **+5V**, **-3.3V** und **+ 3.3V**
verwendeten Steckerstifte sind in der Dokumentation hier aufgeführt.


Hintergrundgrundlagen
---------------------

Schließen Sie vorübergehend eine Ihrer LEDs an die 1,5-V-Batterie
an. Achten Sie darauf, die Polarität der Diode zu beachten, damit sie
in Vorwärtsrichtung vorgespannt ist. Leuchtet es? Wahrscheinlich nicht
seit 1,5 V reicht im Allgemeinen nicht aus, um eine LED
einzuschalten. Wir brauchen einen Weg, um die 1,5 V auf eine höhere
Spannung zu erhöhen, um eine einzelne LED zu beleuchten, geschweige
denn zwei in Reihe geschaltete LEDs.


Ein Aufwärtswandler (Hochsetzsteller) ist ein DC /
DC-Leistungswandler, der die Spannung (während der Abwärtsstrom) von
seinem Eingang (Versorgung) zu seinem Ausgang (Last) erhöht. Es ist
eine Klasse von Schaltnetzteilen (SMPS), die mindestens zwei
Halbleiter (eine Diode und einen Transistor) und mindestens ein
Energiespeicherelement enthalten: einen Kondensator, einen Induktor
oder die beiden in Kombination. Um die Spannungswelligkeit zu
reduzieren, werden normalerweise Filter aus Kondensatoren (manchmal in
Kombination mit Induktoren) zu einem solchen Wandlerausgang
(lastseitiges Filter) und Eingang (versorgungsseitiger Filter)
hinzugefügt.


.. note::
   Die Funktionsweise des DC - DC - Boost - Konverters wird in diesem
   Wikipedia - Artikel erklärt. Vor dem Experiment wird ein kurzer
   Überblick über die Theorie empfohlen. 

Die klassische DC-DC-Aufwärtswandlerschaltung ist in Fig. 1
gezeigt. Abhängig von der gewünschten Betriebsfrequenz
(Schaltfrequenz) und der maximalen Stromstärke des Induktors
:math:`L_1` sollte ausgewählt sein. In diesem Experiment für
:math:`L_1` wird ein :math:`100 \ mu H` -Leistungsinduktor mit
1A Nennstrom verwendet. Die Betriebsfrequenz
(Schaltfrequenz) sollte im Bereich von: "10 - 50 kHz"
liegen. Für den Gleichrichter :math:`D_1` und den Snubber:
math:`D_2` können die klassischen Dioden 1N4001_ oder
1N3064 verwendet werden.

Für den :math:`M_1` Transistor werden wir IRLU120N_ verwenden. Wir
haben diesen Leistungs-MOSFET-Transistor gewählt, da er eine niedrige
Schwellenspannung hat :math:`V_ {TH}`. Wenn Sie FET-Transistoren mit
hoher Schwellenspannung und ein Niederspannungstreibersignal
(Gatesignal) verwenden, könnte das Schalten des MOSFET nicht optimal
sein. Ausgewählter MOSFET hat bereits eine integrierte Snubber-Diode,
also externe Diode :math:`D_2` ist nicht notwendig.


.. note::
   Ein einfacher DC-DC-Boost-Konverter-Rechner ist auch auf der Adafruit-Webseite verfügbar.

Für Speicherkondensator :math:`C_1` und Elektrolytkondensator sollte
gewählt werden. Die Auswahl dieses Kondensators hängt von
Stromstärken, Schaltfrequenz und Induktivitätswert ab. Aber um auf der
sicheren Seite zu sein Werte oben :math:`10 \ mu F` wäre ausreichend.

Ein DC-DC-Aufwärtswandler, der in diesem Experiment verwendet wird,
ist in 1 gezeigt.



.. figure:: img/ Activity_28_Fig_01.png

   Abbildung 1: DC-DC-Aufwärtswandler

   
In Fig. 1 ist eine grundlegende DC-DC-Aufwärtswandlerschaltung
gezeigt. Zu der Konverterschaltung wird eine :math:`200 \Omega` -Ladung hinzugefügt.
**Für einen stabilen Betrieb des DC-DC-Aufwärtswandlers wird entweder
eine konstante Last oder eine Lastregelung benötigt**.
Ohne Regulierung wirkt sich eine Änderung
der Last auf den Ausgangsspannungspegel aus. Deshalb haben wir
:math:`200 \Omega` Last eingestellt, um die Ausgangsspannung zu
stabilisieren. Parallel zur Last werden zwei LED-Dioden in Reihe
mit 1K-Widerständen hinzugefügt. Beachten Sie, dass das
Hinzufügen oder Entfernen zusätzlicher LEDs parallel zur Last
die Ausgangsspannung nicht beeinflusst, da der von der LED
gezogene Strom viel kleiner ist als der Strom, der von
gezogen wird :math:`200 \Omega` load.
      
**LEDs dienen als Indikatoren, dass unsere DC-Batteriespannung von 1,5
V auf ~ 5 V BOOSTED UP ist.** Wenn die LEDs aus sind, bedeutet dies,
dass unsere Batteriespannung unter der LED-Vorwärtsspannung (2x1,8 V)
liegt. DC-Aufwärtswandlerschaltung funktioniert nicht richtig.


Red Pitaya STEMlab-Ausgänge können Spannungssignale mit einem
maximalen Ausgangsbereich von +/- 1V (2Vpp) erzeugen. Für das
MOSFET-Schalten sind höhere Signalamplituden erforderlich. Deshalb
haben wir zwei NPN-Transistoren im Schaltmodus als Zwischenstufe
zwischen OUT1-Schaltsignal und MOSFET-Transistor verwendet. Das
OUT1-Rechtecksignal schaltet den ersten NPN-Transistor ein und aus,
wodurch seine Kollektorspannung zwischen 0-5 V schwankt. Diese
Kollektorspannung steuert dann den zweiten NPN-Transistor und seine
Kollektorspannung, die ebenfalls zwischen 0-5 V schwingt, schaltet
dann den MOSFET-Transistor EIN / AUS.

Der Grund, warum zwei NPN-Transistoren verwendet werden, besteht
darin, dass das Gate-Signal von OUT1 und MOSFET in Phase ist. Wenn
OUT1 hoch ist, sollte das Signal am MOSFET-Gate ebenfalls hoch
sein. Die Verwendung eines Transistors verursacht eine
180-Phasen-Verzögerung. ** Sie können hier auch das andere wichtigere
Problem sehen. Wenn wir nur einen NPN - Transistor verwenden, dann
wird, wenn OUT1 konstant AUS - geschaltet ist, der MOSFET - Transistor
konstant eingeschaltet, was zu einem Kurzschluss führt: Batterie -
Induktivität - MOSFET - GND. Die Verwendung von zwei
NPN-Transistoren verhindert dies.


.. warning::
   Beachten Sie, dass die + 5V-Spannungsschiene vom STEMlab nur für
   die Transistorschaltung und nicht für die Lastversorgung verwendet
   wird. Die elektrische Energie fließt von der Batterie zur LAST und
   den LEDs.
   

Materialien
-----------

- Rotes Pitaya STEMlab
- 1x 1kΩ Widerstand
- 3 x 470Ω Widerstand
- 1x 10kΩ Widerstand
- 1x :math:`100 \ mu H` Leistungsinduktivität
- 1x :math:`47 \ mu F` Kondensator
- 2x LED (rot)
- 1x 1W 200Ω Widerstand
- 1x Signaldiode (1N4001_)
- 2x Kleinsignal-NPN-Transistor (2N3904_)
- 1x Leistungs-MOS-Transistor (IRLU120N_)
- 1x AA 1,5 V Batterie
- 1x lötfreies Steckbrett

  
Verfahren
---------

1. Nach den obigen Anweisungen und den Schaltplänen von Abbildung 1
   bauen Sie die Schaltung auf dem Steckbrett auf.
   


.. figure:: img/ Activity_28_Fig_02.png

   Abbildung 2: DC - DC Boost Converter auf dem Steckbrett

   
2. ** Setze IN1 und IN2 Scope Probes Dämpfungen auf x10 **
   
3. Verbinden Sie den IN1-Scope-Sensor mit dem Punkt 3 (Abbildung 1)
   und dem IN2-Scope-Probe mit dem Punkt (5)
   
4. Starten Sie die Applikation Oszilloskop & Signalgenerator - ** OUT1
   muss deaktiviert sein (ausgeschaltet) **
   
5. Stellen Sie in den Menüeinstellungen IN1 und IN2 die Sondendämpfung
   auf x10 ein
   
6. Wählen Sie im Menü MESSUNGEN MEAN-Messungen für IN1 und IN2
   
7. Was sind die Werte der Gleichspannung an Punkt 3 und 5 (Bild 1)?
   

Wenn zu diesem Zeitpunkt das OUT1-Schaltsignal deaktiviert ist, ist
der DC-DC-Aufwärtswandler nicht funktionsfähig. Transistor :math:`M_1`
ist ausgeschaltet (Leerlauf) und Batteriespannung ist über Induktor:
math:` L_1` und Diode :math:`D_1`, übertragen auf die Lastseite (Punkt
5, Abbildung 1). Für DC-Signale (keine Umschaltung) verhält sich die
:math:`L_1` -Induktivität wie ein Kurzschluss, daher ist die
Ausgangsspannung die Batteriespannung, die sich verringert durch
:math:`D_1` Dioden-Durchlassspannung:
:math:`V_ {out} = V_{Batterie} - V_ {Diode}`. Dieser Zustand wird in den
Messungen in Abbildung 3 gezeigt. Wie wir erwartet haben,
sind :math:`LED_1` und :math:`LED_2` ausgeschaltet, da die
Ausgangsspannung unter der Durchlassspannung der LEDs
liegt (2x1.8V).
	    

.. figure:: img/ Activity_28_Fig_03.png

   Abbildung 3: DC - DC - Boost - Konverter ist ausgeschaltet

   
8. Stellen Sie in den OUT1-Menüeinstellungen die Frequenz auf 10 kHz,
   die Wellenform auf PWM, die Amplitude auf 0,5 V, den DC-Offset auf
   0,5 V ein, deaktivieren Sie SHOW und wählen Sie ON.
   
9. Wählen Sie im Menü MEASUREMENTS P2P-Messungen für IN1 und IN2
   
10. Setzen Sie t / div Wert auf 100us / div (Sie können t / div mit
    horizontalen +/- Kontrollen einstellen)
    

An diesem Punkt, wenn das Schaltsignal OUT1 freigegeben ist, ist der
DC-DC-Aufwärtswandler funktionsfähig und verhält sich wie oben in der
Theorie beschrieben. Die Ausgangsspannung wird auf ca. 5V erhöht und
die LEDs werden eingeschaltet. Dieser Zustand ist in Abbildung 4
dargestellt. Wie man an den Messungen sehen kann, tritt an der
Batterie und an der Ausgangsspannung eine Welligkeit auf. Die
Welligkeit der Ausgangsspannung wird durch die Welligkeit der
Batteriespannung und den Transistor :math:`M_1` verursacht. Die
Batteriespannungswelligkeit ist darauf zurückzuführen, dass die
Batterie keine ideale Spannungsquelle ist und wenn :math:`M_1`
eingeschaltet ist, verursacht der von der Batterie ertrunkene Strom
einen Spannungsabfall.


.. figure:: img/ Activity_28_Fig_04.png

   Abbildung 4: DC - DC - Boost - Konverter ist eingeschaltet

   
.. note::
   Spannungswelligkeitswerte sind einer der Hauptparameter der
   DC-DC-Wandlerqualität. Geringere Ausgangswelligkeit entspricht
   einem besseren DC-DC-Aufwärtswandler.
   
   Kondensator :math:`C_1` wird daher benötigt, um die an der
   Induktivität erscheinende Schaltspannung zu kompensieren und zu
   glätten :math:`L_1` und diode :math:`D_1`.
   
   Versuche zu entfernen :math:`C_1` und beobachte :math:`V_ {out}`.


11. Um die Schaltspannungen von :math:`M_1` zu beobachten, stellen Sie
    die IN1-Sonde auf den Punkt 2 (Abbildung 1) und die IN2-Sonde auf
    den Punkt 4 (Abbildung 1).
    
12. Stellen Sie im IN2-Einstellungsmenü den vertikalen Offset -4.0V
    ein (um das Signal IN2 besser sehen zu können)
    
13. Wählen Sie im TRIGGER-Menü NORMAL und stellen Sie den Triggerpegel
    auf 3.0V ein
    
14. Setze t / div Wert auf 20us / div (Du kannst t / div mit
    horizontalen +/- Kontrollen einstellen)
    

.. figure:: img/ Activity_28_Fig_05.png

   Abbildung 5: M1 Schaltspannungen

   
In der Abbildung 5 sind :math:`M_1` Gate- und Drain-Signale
dargestellt. Aus Fig. 5 können wir sehen, dass das Gate-Signal eine
schaltende Rechteckwelle ist, die den Transistor steuert.

Das Drain-Signal entspricht den "Offen / Geschlossen" -Zuständen des
Transistors :math:`M_1`, aber während des" Off "-Zustandes sind
signifikante Oszillationen sichtbar. Dies ist der Einfluss des
Induktors :math:`L_1`, da er jede Änderung des Stroms durch ihn
beeinflusst, die die Drain-Spannung von :math:`M_1` beeinflusst.


.. note::
   Der DC-DC-Boost-Wandler-Ausgangsspannungswert wird häufig gesteuert
   mit: math: "Duty-Cycle" des Schaltsignals.
   

15. Um die Auswirkungen des Schaltsignals (OUT1) zu beobachten,
    stellen Sie den IN1-Fühler auf den Punkt 2 (Abbildung 1) und den
    IN2-Fühler auf den Punkt 5 (Abbildung 1).
    
16. Stellen Sie in den Menüeinstellungen IN1 und IN2 den vertikalen
    Offset auf -3,0V ein
    
17. Setzen Sie t / div Wert auf 50us / div (Sie können t / div mit
    horizontalen +/- Kontrollen einstellen)
    
18. In den OUT1-Menüeinstellungen ändern Sie den Arbeitszyklus von
    30\%-80\% und beobachten Sie die Ergebnisse.
	  


.. figure:: img/ Activity_28_Fig_06.png

.. figure:: img/ Activity_28_Fig_07.png

   Abbildung 5: Oben: Ausgangsspannung bei 40% Einschaltdauer. Unten:
   Ausgangsspannung bei 80% Tastverhältnis
   

.. warning::
   Aus Abbildung 5 können wir den Einfluss des Tastverhältnisses auf
   die Ausgangsspannung beobachten. Wenn wir mit dem Tastverhältnis
   auf 0% oder 100% gehen, werden wir abschalten oder kurzschließen
   :math:`M_1` Transistor daher sollte das Tastverhältnis oben
   begrenzt sein für Kurzschlussschutz und
   Schaltkreisbeschädigung.
	 


Fragen
------

1. Ändern Sie den Ladewert in :math:`470 \ Omega` und beobachten Sie
   die Ergebnisse.
   
2. Ändern Sie die OUT1-Frequenz auf 5 - 20 kHz. Messen und notieren
   Sie die Wellenform der verstärkten Ausgangsspannung und die
   Stromwellenformen. Erklären Sie, was sich geändert hat und warum?
   
3. Wie würde das Hinzufügen eines LC-Filters auf den Wandlerausgang
   die Spannungswelligkeit beeinflussen?
   

















































































































































