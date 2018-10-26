DC-DC-Aufwärtswandler
=====================

Zielsetzung
-----------

Hier werden wir eine induktiv arbeitende Schaltung untersuchen, die eine
Ausgangsspannung erzeugen kann, die höher ist als die eingespeiste Spannung.
Diese Schaltungsklasse wird als DC/DC-Wandler oder Boost-Regler bezeichnet.
In diesem Experiment wird die Spannung aus einer :math:`1,5\,V` Versorgung (Batterie)
auf eine ausreichend hohe Spannung (:math:`\approx 5\,V`) angehoben, um zwei LEDs in Reihe zu
betreiben. **Beachten Sie, dass die Durchlassspannung der LED typischerweise** :math:`1,8\,V`
**beträgt, obwohl sie bei einigen Dioden bis zu** :math:`3,3\,V` **betragen kann (blaue LED)**.

Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Signalgeneratoranwendung: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _Wikipedia-Artikel: https://en.wikipedia.org/wiki/Boost_converter
.. _IRLU120N: http://www.infineon.com/dgdl/irlr120n.pdf?fileId=5546d462533600a4015356695f642663
.. _1N4001: http://www.vishay.com/docs/88503/1n4001.pdf
.. _DC-DC-Aufwärtswandler-Rechner: https://learn.adafruit.com/diy-boost-calc/the-calculator
.. _2N3904: https://www.sparkfun.com/datasheets/Components/2N3904.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch,
wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht.
Die Oszilloskop- und Signalgeneratoranwendung_ wird zum Erzeugen und Beobachten
von Signalen auf der Schaltung verwendet. Die Erweiterungsstecker-Pins für die
Spannungsversorgung :math:`+5\,V`, :math:`-3,3\,V` und :math:`+3,3\,V` sind in der Dokumentation_ dargestellt.


Hintergrundinformationen
------------------------

Schließen Sie eine Ihrer LEDs vorübergehend an die :math:`1,5\,V` -Batterie an.
Achten Sie auf die Polarität der Diode, damit sie vorwärts gerichtet ist.
Leuchtet es? Wahrscheinlich nicht, da :math:`1,5\,V` im Allgemeinen nicht ausreichen,
um eine LED einzuschalten. Wir brauchen eine Möglichkeit, die :math:`1,5\,V` auf eine höhere
Spannung anzuheben, um eine einzelne LED zu betreiben, geschweige denn zwei in
Reihe geschaltete LEDs.


Ein Aufwärtswandler (Hochsetzsteller) ist ein DC/DC-Leistungswandler,
der die Spannung (beim Absenken des Stroms) von seinem Eingang (Versorgung)
zu seinem Ausgang (Last) erhöht. Es handelt sich um eine Klasse von Schaltnetzteilen (SMPS),
die mindestens zwei Halbleiter (eine Diode und einen Transistor) und mindestens ein
Energiespeicherelement enthalten: einen Kondensator, einen Induktor oder die beiden
in Kombination. Um die Spannungswelligkeit zu reduzieren, werden in der Regel Filter
aus Kondensatoren (teilweise in Kombination mit Induktoren) an den Ausgang (lastseitiger Filter)
und Eingang (versorgungsseitiger Filter) eines solchen Umrichters angefügt.


.. note::
   Die Funktionsweise des DC-DC Aufwärtswandlers wird in diesem Wikipedia-Artikel_
   ausführlich erläutert. Vor der Versuchsdurchführung wird ein kurzer Überblick
   über die Theorie empfohlen.

Die klassische DC-DC Aufwärtswandlerschaltung ist in :numref:`28_fig_01` dargestellt.
Abhängig von der gewünschten Betriebs-(Schalt-)Frequenz und dem maximalen Nennstrom
ist die Induktivität :math:`L_1` auszuwählen. In diesem Experiment wird für :math:`L_1`
eine :math:`100\,\mu H` Leistungsinduktivität mit :math:`1\,A` -Nennstrom verwendet.
Die Betriebs-(Schalt-)Frequenz sollte im Bereich von :math:`10-50\,kHz` liegen.
Für die Gleichrichter :math:`D_1` kann klassische 1N4001_ oder 1N3064 Dioden verwendet werden.
Für den :math:`M_1` -Transistor verwenden wir IRLU120N_. Wir haben diesen Leistungs-MOSFET-Transistor
ausgewählt, da er eine niedrige Schwellenspannung :math:`V_TH` aufweist.
Wenn Sie FET-Transistoren mit hoher Schwellenspannung und Niederspannungs-Treibersignal (Gatesignal)
verwenden, kann das Schalten des MOSFETs nicht optimal sein. Der ausgewählte MOSFET hat bereits eine
integrierte Bulk-Diode, so dass eine externe Diode D2 nicht erforderlich ist.

.. note::
   Der einfache DC-DC-Aufwärtswandler-Rechner_ ist auch auf der Adafruit-Webseite verfügbar..

Für den Speicherkondensator :math:`C_1` elektrolytischer Hochkapazitätskondensator gewählt werden.
Die Auswahl dieses Kondensators hängt von den Nennströmen, der Schaltfrequenz und dem Wert der Indutivität ab.
Aber um auf der sicheren Seite zu sein, wären Werte über :math:`10\,\mu F` ausreichend.
Ein in diesem Experiment verwendeter DC-DC-Aufwärtswandler ist in :numref:`28_fig_01` dargestellt.




.. figure:: img/ Activity_28_Fig_01.png
   :name: 28_fig_01
   :align: center

   DC-DC-Aufwärtswandler

In :numref:`28_fig_01` ist die grundlegende DC-DC-Aufwärtswandlerschaltung dargestellt.
Der Umrichterschaltung wird eine :math:`200\,\Omega` Last hinzugefügt. Für den stabilen
Betrieb des DC-DC-Aufwärtswandlers ist entweder eine konstante Last oder eine Lastregelung
erforderlich. Ohne Regelung wirkt sich jede Änderung der Last auf den Ausgangsspannungspegel aus.
Deshalb haben wir :math:`200\,\Omega` Last eingestellt, um die Ausgangsspannung zu stabilisieren.
Parallel zur Last werden zwei LED-Dioden in Reihe mit :math:`1\,k\Omega` -Widerständen hinzugefügt.
Beachten Sie, dass das Hinzufügen oder Entfernen zusätzlicher LEDs parallel zur Last keinen
Einfluss auf die Ausgangsspannung hat, da die Stromaufnahme der LEDs viel geringer ist als die
Stromaufnahme der :math:`200\,\Omega`  Last. LEDs dienen als Anzeige dafür, dass unsere
DC-Batteriespannung von :math:`1,5\,V` auf :math:`\approx 5\,V` erhöht wird. Wenn die LEDs
aus sind, bedeutet das, dass unsere Batteriespannung unter der LED-Vorspannung (:math:`2 \cdot 1,8\,V`) liegt
und somit anzeigt, dass die DC-DC-Aufwärtswandlerschaltung nicht ordnungsgemäß funktioniert.

Red Pitaya STEMlab-Ausgänge können Spannungssignale mit einem maximalen Ausgangsbereich
von :math:`+/- 1\,V` (:math:`2\,V_{pp}`) erzeugen. Da für das MOSFET-Schalten die höheren
Signalamplituden erforderlich sind, haben wir zwei NPN-Transistoren im Schaltmodus als
Zwischenstufe, zwischen OUT1-Schaltsignal und MOSFET-Transistor verwendet. Das Rechtecksignal
OUT1 schaltet den ersten NPN-Transistor ein und aus, wodurch die Kollektorspannung zwischen
:math:`0-5\,V` schwankt. Diese Kollektorspannung steuert dann den zweiten NPN-Transistor und
seine Kollektorspannung, die ebenfalls zwischen :math:`0-5\,V` schwankt, schaltet dann
den MOSFET-Transistor ein und aus. Der Grund für die Verwendung von zwei NPN-Transistoren
ist, dass das OUT1- und MOSFET-Gatesignal phasenrichtig sein müssen. D.h. wenn OUT1 high
ist, sollte das Signal auf dem MOSFET-Gate ebenfalls high sein. Die Verwendung nur eines
Transistors führt zu einer Phasenverschiebung von :math:`180\Grad`. Sie können hier auch
das andere wichtigere Problem sehen. Wenn wir nur einen NPN-Transistor verwenden, dann wird
der MOSFET-Transistor, wenn OUT1 ständig ausgeschaltet wird, ständig eingeschaltet und erzeugt
einen Kurzschluss: Batterie - Induktivität - Mosfet - gnd. Die Verwendung von zwei NPN-Transistoren
verhindert dies.


.. warning::
   Beachten Sie, dass die :math:`+5\,V` -Spannungsschiene des STEMlab nur für die
   Transistorschaltung und nicht für die Lastversorgung verwendet wird. D.h. die
   elektrische Energie fließt von der Batterie zum LOAD und den LEDs.

   
Materialien
-----------

- Rotes Pitaya STEMlab
- 1x 1kΩ Widerstand
- 3 x 470Ω Widerstand
- 1x 10kΩ Widerstand
- 1x :math:`100 \ mu H` Leistungsinduktivität
- 1x :math:`47 \ mu F` Kondensator
- 2x LED (rot)
- 1x 1W :math:`200\,\Omega` Widerstand
- 1x Signaldiode (1N4001_)
- 2x Kleinsignal-NPN-Transistor (2N3904_)
- 1x Leistungs-MOS-Transistor (IRLU120N_)
- 1x AA :math:`1,5\,V` Batterie
- 1x lötfreies Steckbrett

  
Verfahren
---------

1. Nach den obigen Anweisungen und den Schaltplänen von :numref:`28_fig_01`
   bauen Sie die Schaltung auf dem Steckbrett auf.
   


.. figure:: img/ Activity_28_Fig_02.png

   Abbildung 2: DC - DC Boost Converter auf dem Steckbrett

   
2. ** Setze IN1 und IN2 Scope Probes Dämpfungen auf x10 **
   
3. Verbinden Sie den IN1-Scope-Sensor mit dem Punkt 3 (:numref:`28_fig_01`)
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
5, :numref:`28_fig_01`). Für DC-Signale (keine Umschaltung) verhält sich die
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
    die IN1-Sonde auf den Punkt 2 (:numref:`28_fig_01`) und die IN2-Sonde auf
    den Punkt 4 (:numref:`28_fig_01`).
    
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
    stellen Sie den IN1-Fühler auf den Punkt 2 (:numref:`28_fig_01`) und den
    IN2-Fühler auf den Punkt 5 (:numref:`28_fig_01`).
    
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
   

















































































































































