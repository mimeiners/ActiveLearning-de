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
Transistors führt zu einer Phasenverschiebung von :math:`180\,^\circ`. Sie können hier auch
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
- 1x :math:`1\,k\Omega` Widerstand
- 3 x :math:`470\,\Omega` Widerstand
- 1x :math:`10\,k\Omega` Widerstand
- 1x :math:`100 \ mu H` Leistungsinduktivität
- 1x :math:`47 \ mu F` Kondensator
- 2x LED (rot)
- 1x 1W :math:`200\,\Omega` Widerstand
- 1x Signaldiode (1N4001_)
- 2x Kleinsignal-NPN-Transistor (2N3904_)
- 1x Leistungs-MOS-Transistor (IRLU120N_)
- 1x AA :math:`1,5\,V` Batterie oder Labornetzteil
- 1x lötfreies Steckbrett

  
Verfahren
---------

1. Bauen Sie die Schaltung aus :numref:`28_fig_01` auf. Befolgen Sie dabei die obigen
   Anweisungen und orientieren Sie sich am Schaltzplan.  
   
.. figure:: img/ Activity_28_Fig_02.png
   :name: 28_fig_02
   :align: center

   DC - DC Boost Converter auf dem Steckbrett

   
2. **Stellen Sie die Dämpfung der IN1- und IN2-Scope-Sonden auf x10 ein.**
   
3. Verbinden Sie die IN1-Scope-Sonde mit dem Punkt 3
   und dem IN2-Scope-Sonde mit dem Punkt 5 auf Ihrer Schaltung (:numref:`28_fig_01`). 
   
4. Starten Sie die Applikation Oszilloskop & Signalgenerator - **OUT1 muss deaktiviert (ausgeschaltet) sein**
   
5. Stellen Sie in den Menüeinstellungen IN1 und IN2 die Sondendämpfung
   auf x10 ein
   
6. Wählen Sie im Menü MEASUREMENTS die Option MEAN für IN1 und IN2.
   
7. Was sind die Werte der Gleichspannung an Punkt 3 und 5 (:numref:`28_fig_01`)?
   
An dieser Stelle, wenn das Schaltsignal OUT1 deaktiviert ist, ist der DC-DC-Aufwärtswandler
nicht funktionsfähig. Der Transistor :math:`M_1` wird ausgeschaltet (Leerlauf) und die
Batteriespannung wird über die Induktivität :math:`L_1` und die Diode :math:`D_1` auf die
Lastseite übertragen (Punkt 5 in :numref:`28_fig_01`). Bei Gleichstromsignalen (kein Schalten)
verhält sich die :math:`L_1` -Induktivität wie ein Kurzschluss, daher wird die Ausgangsspannung
durch die Batteriespannung um die Schwellspannung der :math:`D_1` -Diode verringert:
:math:`V_{out} = V_{Batterie} - V_{Diode}`. Dieser Zustand ist in den Messungen auf
:numref:`28_fig_03` dargestellt. Wie erwartet, werden die :math:`LED_1` und :math:`LED_2`
nicht leuchten, da die Ausgangsspannung unter der Durchlassspannung
der LEDs liegt (:math:`2 \cdot 1,8\,V`).
	    

.. figure:: img/ Activity_28_Fig_03.png
   :name: 28_fig_03
   :align: center

   DC - DC - Boost - Konverter ist ausgeschaltet

8. Stellen Sie in den OUT1-Menüeinstellungen die Frequenz auf :math:`10\,kHz`,
   die Wellenform auf PWM, die Amplitude auf :math:`0,5\,V`, den DC-Offset auf
   :math:`0,5\,V` ein, deaktivieren Sie SHOW und wählen Sie Enable.
   
9. Wählen Sie im Menü MEASUREMENTS P2P-Messungen für IN1 und IN2
   
10. Setzen Sie :math:`t/div` -Wert auf :math:`100\,us/div` (Sie können :math:`t/div` mit
    horizontalen +/- Reglern einstellen)
    

An diesem Punkt, an dem das  Schaltsignal OUT1 aktiviert ist, ist der
DC-DC-Aufwärtswandler funktionsfähig und verhält sich wie oben in der
Theorie beschrieben. Die Ausgangsspannung wird auf ca. :math:`5\,V` angehoben und die LEDs leuchten.
Dieser Zustand ist in :numref:`28_fig_04` dargestellt. Wie wir aus den Messungen ersehen können,
tritt bei Batterie und Ausgangsspannung eine Restwelligkeit auf, die durch
Batteriespannungswelligkeit und Transistor :math:`M_1` -Schaltung verursacht wird.
Die Spannungswelligkeit der Batterie ist darauf zurückzuführen, dass die Batterie keine
ideale Spannungsquelle ist, und wenn M1 eingeschaltet wird, verursacht der von der Batterie
abgegeber Strom einen Spannungsabfall.


.. figure:: img/ Activity_28_Fig_04.png
   :name: 28_fig_04
   :align: center

   DC - DC - Boost - Konverter ist eingeschaltet

.. note::
   Welligkeitsspannungswerte sind einer der wichtigsten Parameter der DC-DC-Wandlerqualität.
   Die geringere Ausgangswelligkeit entspricht einem besseren DC-DC-Aufwärtswandler.
   Der Kondensator :math:`C_1` wird daher benötigt, um die an Induktivität :math:`L_1` und
   Diode :math:`D_1` auftretende Schaltspannung zu kompensieren und zu glätten.
   Versuchen Sie, :math:`C_1` zu entfernen und beobachten Sie :math:`V_{out}`.


11. Um die Schaltspannungen des :math:`M_1` -MOS-Transistors zu beobachten, setzen Sie
    die IN1-Sonde auf den Punkt 2 (:numref:`28_fig_01`) und die IN2-Sonde auf
    den Punkt 4 (:numref:`28_fig_01`).
    
12. Stellen Sie im IN2-Einstellungsmenü den vertikalen Offset auf :math:`-4,0\,V`
    ein (um das Signal IN2 besser sehen zu können).
    
13. Wählen Sie im TRIGGER-Menü NORMAL und stellen Sie den Triggerpegel
    auf :math:`3,0\,V` ein.
    
14. Setze :math:`t/div` Wert auf :math:`20\,us/div` (Sie können :math:`t/div` mit
    horizontalen +/- Reglern einstellen)
    

.. figure:: img/ Activity_28_Fig_05.png
   :name: 28_fig_05
   :align: center

   M1 Schaltspannungen

Auf der :numref:`28_fig_05` sind :math:`M_1` Gate- und Drain-Signale dargestellt. Aus :numref:`28_fig_05` können wir ersehen, dass das Gatesignal eine schaltende Rechteckwelle ist, die den Transistor steuert. Das Drain-Signal entspricht den Zuständen "offen/geschlossen" des Transistors :math:`M_1`, aber im Zustand "aus" sind deutliche Schwingungen sichtbar. Dies ist die Auswirkung der Induktivität :math:`L_1`, da diese jede Stromänderung durch sie hindurch annimmt, die die Drainspannung :math:`M_1` beeinflusst.

.. note::
   Der Ausgangsspannungswert des DC-DC-Aufwärtswandlers wird oft mit dem
   Tastverhältnis (Duty-Cycle) des Schaltsignals (PWM-Signal) gesteuert.
   
15. Um die Auswirkungen des Schaltsignals (OUT1) zu beobachten,
    setzen Sie die IN1-Sonde auf den Punkt 2 (:numref:`28_fig_01`) und die
    IN2-Sonde auf den Punkt 5 (:numref:`28_fig_01`).
    
16. Stellen Sie in den Menü Einstellungen IN1 und IN2 den vertikalen
    Offset auf :math:`-3,0\,V` ein.
    
17. Setzen Sie :math:`t/div` Wert auf :math:`50\,us/div` (Sie können :math:`t/div` mit
    horizontalen +/- Reglern einstellen)
    
18. In den Einstellungen des Menüs OUT1 das Tastverhältnis von 30% auf 80% ändern und die Ergebnisse beobachten.
	  

.. figure:: img/ Activity_28_Fig_06.png
	   
.. figure:: img/ Activity_28_Fig_07.png
   :name: 28_fig_06
   :align: center

   Oben: Ausgangsspannung bei 40% Einschaltdauer. Unten: Ausgangsspannung bei 80% Tastverhältnis
   

.. warning::
   Aus :numref:`28_fig_06` können wir den Einfluss des Tastverhältnisses auf
   die Ausgangsspannung beobachten. Wenn wir mit der Tastverhältnis auf 0% oder 100% gehen,
   dann schalten wir den M1-Transistor aus oder schließen diesen kurz. Zur Vermeidung eines
   Kurzschlüßes und der damit verbundenen Schäden an der Schaltung, sollte die
   Einschaltdauen (high) begrenzt werden. 
	 


Fragen
------

1. Ändern Sie den Lastwert auf :math:`470\,\Omega` und beobachten Sie
   die Ergebnisse.
   
2. Ändern Sie die OUT1-Frequenz auf :math:`5 - 20\,kHz`. Messen und zeichnen
   Sie die Wellenform der verstärkten Ausgangsspannung und des
   Ausgangsstroms auf. Erklären Sie, was sich geändert hat und warum?
   
3. Wie würde das Hinzufügen eines LC-Filters am Umrichterausgang die
   Spannungswelligkeit beeinflussen?
   

















































































































































