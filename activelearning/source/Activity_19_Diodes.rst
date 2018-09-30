Diodes und Jupyter Notebook Beispiel
====================================

Zielsetzung
-----------

Ziel dieser Übung ist es, die Strom-/Spannungseigenschaften verschiedener
PN-Halbleiterdioden wie der konventionellen Si-Diode, der Schottky-Barrierediode,
der Zenerdiode und der lichtemittierenden Diode (LED) zu untersuchen.

Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signalgeneratoranwendung: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Notebook: http://jupyter.org/index.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch,
wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht.

Die Erweiterungsstecker-Pins für die Spannungsversorgung **-3,3V** und **+3,3V** sind in der Dokumentation_ dargestellt.

Die Oszilloskop_ und Signalgeneratoranwendung_ wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet.


Hintergrund
-----------

Die PN-Sperrschichtdiode ist ein el. Bauelement, das häufig in Schaltungsanwendungen
wie der Gleichrichtung verwendet wird, bei denen der Strom nur in eine
Richtung fließen darf. Wenn die Diode aus Silizium hergestellt wird, liegt die
Durchlassspannung typischerweise bei :math:`0,7 V` und die :math:`V_D` - zu - :math:`I_D` -Charakteristik
in Bezug auf Diodenspannung und -strom kann durch eine exponentielle Beziehung beschrieben werden:
 
.. math::
   :label: 19_eq_01

   I_D = I_S \left(e^{\frac{V_D q}{n k T}} - 1 \right)

wobei :math:`I_ {S}` und n Skalierungsfaktoren sind und :math:`kT / q`
(:math:`25,4 mV` bei Raumtemperatur) ist die sogenannte thermische
Spannung :math:`{V_T}`.


Diode schematische Symbole
--------------------------

Jeder Diodentyp hat ein spezifisches Schaltplansymbol, das Abweichungen
vom herkömmlichen Diodensymbol darstellt, das links in Abbildung 1 dargestellt
ist. Eine Art "Z"-förmige Kathode bezeichnet eine Zenerdiode wie im zweiten
Symbol in :numref:`19_fig_01`. Eine "S"-förmige Kathode bezeichnet eine Schottky-Diode wie
im nächsten Symbol. Die Pfeile, die von der Diode weg zeigen, kennzeichnen eine
LED wie im rechten Symbol. Pfeile, die auf die Diode zeigen, würden einen Photodioden-Lichtsensor darstellen.


.. figure:: img/Activity_19_Fig_01.png
   :name: 19_fig_01
   :align: center

   Diodeschemasymbole

   
Zener-Dioden-Grundlagen
-----------------------

Eine Zenerdiode ist in Aufbau und Betrieb ähnlich wie eine gewöhnliche Diode.
Im Gegensatz zu einer herkömmlichen Diode, bei der der Zweck darin besteht,
Strom in umgekehrter Richtung zu verhindern, wird eine Zenerdiode meist im
umgekehrten Bereich oberhalb der Durchbruchspannung eingesetzt. Die :math:`I` vs. :math:`V` -Kennlinie
ist ähnlich wie bei herkömmlichen Dioden. Durch die Einstellung der Dotierung
der P- und N-Seite der Verbindung ist es möglich, eine Zenerdiode zu entwerfen,
die bei einigen Volt bis einigen hundert Volt zusammenbricht. Siehe :numref:`19_fig_02`.
In diesem Durchbruch- oder Zenerbereich bleibt die Diodenspannung über einen weiten
Strombereich annähernd konstant. Das maximale Umkehrvorspannungspotential, das vor
dem Betreten des Zenerbereichs angelegt werden kann, wird als Peak Inverse Voltage (PIV)
oder Peak Reverse Voltage (PRV) bezeichnet.

.. figure:: img/Activity_19_Fig_02.png
   :name: 19_fig_02
   :align: center

   Vorwärts- und Rückwärts-Zenerdiode :math:`I/V` -Charakteristik
   
Bei Spannungen über dem Durchbruchbeginn führt ein Anstieg der angelegten
Spannung dazu, dass mehr Strom in der Diode fließt, aber die Spannung über
der Diode bleibt sehr nahe bei :math:`V_Z`. Eine Zenerdiode, die im
Rückwärtsdurchbruch betrieben wird, kann eine Referenzspannung für Systeme
wie Spannungsregler oder Spannungskomparatoren liefern.


Schottky-Dioden-Grundlagen
--------------------------

Die Schottky-Barrierediode verwendet einen gleichrichtenden Metall-Halbleiter-Übergang,
der durch Beschichten, Verdampfen oder Kathodisieren eines aus einer Vielzahl von
Metallen auf n- oder p-Halbleitermaterial gebildet wird. Im Allgemeinen werden n-Typ
Silizium und n-Typ GaAs in handelsüblichen Schottky-Dioden verwendet. Die Eigenschaften
einer vorwärtsgerichteten Schottky-Barrierediode werden durch die meisten
Trägerphänomene bestimmt. Die Eigenschaften einer herkömmlichen PN-Übergangsdiode
werden durch Minderheitsträger bestimmt. Schottky-Dioden sind Majoritätetenträgerbauelemente,
die schnell von Vorwärts- auf Rückwärtsvorspannung umgeschaltet werden können,
ohne dass Minoritätenträgerspeichereffekte auftreten.

Die Normalstrom-/Spannungs-:math:`I/V` -Kurve einer Schottky-Barrierediode ähnelt der einer
PN-Übergangsdiode mit den folgenden Ausnahmen:

1. Die Durchbruchspannung einer Schottky-Diode ist niedriger
   und der Sperr-Leckstrom ist höher als der eines PN-Übergangs
   Diode hergestellt unter Verwendung des Halbleitermaterials mit dem
   gleichen spezifischen Widerstand. 
   
2. Die Durchlassspannung bei einem bestimmten Durchlassstrom ist auch bei einer
   Schottky-Diode niedriger als bei einer PN-Übergangsdiode. So hat beispielsweise
   eine Schottky-Diode mit niedriger Sperrschicht bei :math:`2 mA` Vorwärtsvorspannung eine
   Durchlassspannung von :math:`\approx 0,3 \, Volt`, während eine PN-Übergangsdiode aus Silizium eine
   Spannung von :math:`\approx 0,7 Volt` hat. Dieser geringere Vorwärtsspannung kann die in der Diode
   abgegebene Leistung um mehr als die Hälfte reduzieren. Diese Energieeinsparung kann
   sehr bedeutend sein, wenn die Dioden große Durchlassströme leiten müssen. Die Beziehung
   zwischen Strom und Spannung (:math:`I/V`) für eine Schottky-Diode wird durch die folgende Gleichung,
   die als Richardson-Gleichung bekannt ist, bestimmt. Der primäre Unterschied zur herkömmlichen
   Diodengleichung liegt im IS mit der Ergänzung der modifizierten Richardson-Konstante :math:`A^*`.
   

.. math::
   :label: 19_eq_02

   I_D = I_S \left(e^{\frac{V_D q}{n k T}} - 1 \right)
   
.. math::
   :label: 19_eq_03

   I_S = A A^* T^2 e^{-\frac{q \phi_B}{kT}}

   
Wo:

* :math:`A` = Sperrbereich
  
* :math:`A^*` = modifizierte Richardson-Konstante (der Wert variiert
  je nach Material und Dotierstoff) = :math:`110 A /(^{\circ}K^2 - cm^2)` für Si vom n-Typ
  
* :math:`T` = absolute Temperatur in :math:`K` (Kelvin)
  
* :math:`q` = elektrische Ladung = :math:`1.6E-19 \, C`
  
* :math:`\phi_B` = Barrierenhöhe in Volt

* k = Boltzman-Konstante = 1.37 * 10-23 J / K = :math:`1.37E-23 \, J/K`
  
* :math:`n` = Idealitätsfaktor (Vorwärtsneigungsfaktor, bestimmt durch
  Metall-Halbleiter-Schnittstelle) 

  

LED-Grundlagen
--------------

Die LED ist eine Verbindungsdiode, die bei Vorwärtsvorspannung Licht erzeugt.
Tatsächlich strahlen alle PN-Übergangsdioden Photonen aus, wenn sie vorwärts
gerichtet sind, es ist nur, dass sich die Photonen im Infrarotband befinden und die
physikalische Form der Diode es den Photonen nicht erlaubt, aus dem Gehäuse zu entweichen.
Um die Eigenschaft der sichtbaren Lichtemission zu erreichen, ist es notwendig, die LED aus
Materialien mit größeren Bandlücken als Silizium herzustellen. Infolgedessen ist der
Durchlassspannung der LED größer als :math:`0,7 /, V`; normalerweise in der Größenordnung von :math:`1,5 - 2 /, Volt`,
abhängig von der Wellenlänge des ausgestrahlten Lichts. Die LED ist ebenfalls in einem
speziellen transparenten Gehäuse eingebaut, wie in :numfig:`19_fig_03` dargestellt.


.. figure:: img/Activity_19_Fig_03.png
   :name: 19_fig_03
   :align: center

   Leuchtdioden

Eine LED ist eine Halbleitervorrichtung, die elektromagnetische Strahlung bei
optischen und Infrarotfrequenzen abgibt. Das Bauelement ist eine PN-Übergangsdiode
aus p- und n-Halbleitern, meist GaAs, GaP oder SiC. Sie strahlen nur dann Licht aus,
wenn eine externe Spannung verwendet wird, um die Diode über einen minimalen
Schwellenwert hinaus vorzuspannen. Der Gewinn an elektrischer Potentialenergie,
der durch diese Spannung geliefert wird, ist ausreichend, um Elektronen zu zwingen,
aus dem n-Typ-Material, über die Verbindungsbarriere und in den p-Typ-Bereich zu fließen.
Diese Schwellenspannung für den Beginn des Stromflusses über die Verbindung und die
Erzeugung von Licht ist :math:`V_0`. Die Lichtemission erfolgt, nachdem Elektronen in
die p-Region (und Löcher in die n-Region) gelangt sind. Diese Elektronen sind eine
kleine Minorität, die von Löchern umgeben ist (im Wesentlichen die Antiteilchen der
Elektronen) und sie werden schnell ein Loch finden, mit dem sie sich wieder verbinden
können. Energetisch entspannt sich das Elektron aus dem angeregten Zustand (Leitungsband)
in den Grundzustand (Valenzband). Die Dioden werden als lichtemittierend bezeichnet,
da die vom Elektron beim Entspannen abgegebene Energie als Photon abgegeben wird.
Oberhalb des Schwellenwerts steigt die Strom- und Lichtleistung exponentiell mit der
Vorspannung über der Diode an. Die Quanten von Energie oder Photon haben eine Energie
:math:`E = hf`. Das Verhältnis zwischen der Photonenenergie und der Einschaltspannung :math:`V_0` ist:
    
.. math::
   :label: 19_eq_4
   
   eV_0 = E_g = hf = \frac{hc}{\lambda}

   
wo:

* :math:`E_g` ist die Größe der Energielücke
  
* :math:`V_0` ist die Schwellenspannung
  
* :math:`f` und :math:`\lambda` sind die Frequenz und Wellenlänge von
  die emittierten Photonen 
  
* :math:`c` ist die Lichtgeschwindigkeit
  
* :math:`e` ist die elektrische Ladung
  
* :math:`h` ist Planck - Konstante

  
pn-Übergangsdiode :math:`I/V` - Charakteristik
----------------------------------------------

Die Strom-/Spannungseigenschaften der PN-Übergangsdiode können mit dem STEMlab
und den folgenden in :numref:`19_fig_04` dargestellten Anschlüssen gemessen werden.
Richten Sie die Steckplatine mit dem Generator OUT1-Kanalausgang an einem Ende
des Widerstandes ein. Das andere Ende des Widerstandes ist mit einem Ende der zu
messenden Diode verbunden, wie im Diagramm dargestellt. Die Eingangskanäle IN1
und IN2 sind ebenfalls unterschiedlich angeschlossen, daher werden Diodenstrom und -spannung als:

.. math::

   I_d = (IN_1 - IN_2) / R_1
   
   V_d = IN_2

   
.. figure:: img/Activity_19_Fig_04.png
   :name: 19_fig_04
   :align: center

   Anschlussplan für Dioden I- und V-Kurven

Zur Messung der Strom-/Spannungseigenschaften der PN-Übergangsdiode sollte
der OUT1-Generator als 1kHz-Dreieckswelle mit :math:`1 V` max und :mazh:`0 V` min Werten
konfiguriert werden. Für die Messung der :math:`VI` -Kurve ist ein "XY"-Plot erforderlich,
wobei die x-Achse die Diodenspannung IN2 und die y-Achse einen
Diodenstrom :math:`(IN1-IN2)/R1` darstellt. Für diese Aufgabe verwenden wir die
Webanwendung Jupyter Notebook.

.. note::
   Das Jupyter Notebook_ ist eine Webanwendung, mit der Sie Dokumente erstellen
   und freigeben können, die Live-Code, Gleichungen, Visualisierungen und erklärenden
   Text enthalten. Sie haben auch die Unterstützung für die Jupyter-Anwendung mit Red
   Pitaya-Bibliotheken sichergestellt, die die Steuerung aller Funktionen der STEMlab-Boards
   ermöglichen, wie z.B.: Signalerfassung, Signalerzeugung, digitale Signalsteuerung,
   Kommunikation usw. Das Jupyter Notebook wird auf die gleiche Weise gestartet wie alle
   anderen Anwendungen. Nach dem Start der Jupyter-Anwendung wird ein webbasiertes Notebook
   geöffnet. Diese Kombination aus Notebook, STEMlab und Python macht das STEMlab zu einem
   hervorragenden Werkzeug für Prototyping und schnelle Programmierung. Da Jupyter Notebook
   Text-, Gleichungs- und Bildbearbeitung ermöglicht, ist es ein perfektes Werkzeug für
   Tutorials, Beispiele etc.

   
Aber vor der Messung der VI-Kurve sollten Sie die Spannungssignale mit Hilfe
von Oszilloskopen und Signalgeneratoren überprüfen.



Materialien
-----------

- Lötfreies Steckbrett
  
- Widerstand 10 Ω
  
- Herkömmliche Diode (1N4001 oder ähnlich)
  

Zeitbereichsmessungen
---------------------

1. Bauen Sie die Schaltung aus :numref:`19_fig_04` auf dem Steckbrett auf

   .. figure:: img/Activity_19_Fig_05.png
      :name: 19_fig_05
      :align: center

      Verbindungen auf dem Steckbrett

      
2. Starten Sie die Oszilloskop & Signalgenerator - Anwendung
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf :math:`0,5 /, V`, DC-Offset auf ein
   :math:`0,5 /, V`, um eine Dreieckswelle als Eingangsspannung anzulegen. Von dem
   Waveform-Menü TRIANGLE auswählen, SHOW-Button deaktivieren und auswählen
   aktivieren.
   
4. Stellen Sie sicher, dass IN1 :math:`V/div` am linken unteren Bildschirmrand steht
   :math:`200 /, mV/div` (Sie können :math:`V/div` einstellen, indem Sie den gewünschten Kanal und auswählen
   mit vertikalen +/- Kontrollen)
   
5. Vergewissern Sie sich, dass IN2 :math:`V/div` auf der linken unteren Seite des Bildschirms steht
   :math:`200 /, mV/div` (Sie können :math:`V/div` einstellen, indem Sie den gewünschten Kanal und auswählen
   mit vertikalen +/- Kontrollen)
   
6. Setzen Sie :math:`t/div` -Wert auf :math:`200 /, us/div` (Sie können t / div mit horizontalem einstellen
   +/- Kontrollen)
   
7. Im Menü MATH settings IN1-IN2 einstellen und enable auswählen. Die mathematische Kurve,
   skaliert mit dem Faktor :math:`R1`, stellt den Diodenstrom dar.
   

   .. figure:: img/Activity_19_Fig_06.png
      :name: 19_fig_06
      :align: center

      Spannungen und Strom auf der Diode (zeitabhängig)
      

Aus :numref:`19_fig_06` können wir sehen, dass die Diode anfängt zu leiten,
wenn die Spannung an ihr die Schwellenspannung der Diode überschreitet,
die etwa :math:`0,6 /, V` beträgt. 

Außerdem ist der mit der MATH-Trace dargestellte Diodenstrom beobachtbar.
Wir können deutlich sehen, dass, wenn die Diodenspannung unter :math:`0,6 /, V` liegt, der
Diodenstrom :math:`0 /, A` beträgt. Zu einem Zeitpunkt, an dem die Diodenspannung größer
als :math:`0,6 /, V` ist, beginnt die Diode zu leiten und der Pfadstrom wird nur durch den
Widerstand :math:`R1` begrenzt. 


Vorgehensweise - VI-Merkmalsmessungen
-------------------------------------

Für diese Aufgabe verwenden wir die Webanwendung Jupyter Notebook. Wie Sie Jupyter
Notebook starten und ein neues Projekt erstellen, ist in :numref:`19_fig_07` des
Flussdiagramms dargestellt.

.. figure:: img/Activity_19_Fig_07.png
   :name: 19_fig_07
   :align: center

   Erstellen eines neuen Jupyter-Notebooks.
   
Wenn Sie erfolgreich ein neues Jupyter-Notebook erstellt haben, kopieren Sie
den untenstehenden Code und führen Sie ihn aus. Der untenstehende Code erzeugt
das gleiche Signal wie in :numref:`19_fig_06`, aber er zeichnet sie im XY-Diagramm auf.
Für die Messung der :math:`VI` -Kurve ist ein "XY"-Plot erforderlich, wobei die x-Achse
die Diodenspannung IN2 und die y-Achse einen Diodenstrom :math:`(IN1-IN2)/R1` darstellt. 

.. note::
   Kopieren Sie den Code von unten in die Zelle 1.
  
.. literalinclude:: code/Activity_19_Code_01.py
   :language: python
   :linenos:


      
Erstelle eine neue Zelle (Einfügen -> Zelle darunter) und kopiere Code
von unten in es.

.. literalinclude:: code/Activity_19_Code_02.py
   :language: python
   :linenos:

Führen Sie Zelle 1 und Zelle 2 aus. Hinweis Zelle 2 ist eine Hauptschleife
für die Erfassung und Neuaufnahme. Wenn Sie die Erfassung stoppen, führen
Sie einfach nur Zelle 2 aus, um die Messungen erneut zu starten. 

Nach dem Ausführen des obigen Codes sollten Sie die Charakteristik der
Diode :math:`VI` erhalten, wie in :numref:`19_fig_08` dargestellt.

.. figure:: img/Activity_19_Fig_08.png
   :name: 19_fig_08
   :align: center

   Didoes VI-Charakteristik gemessen mit Jupyter Notebook

In der :numref:`19_fig_08` ist die typische :math:`VI` -Dioden-Kennlinie dargestellt.
Aus der :numref:`19_fig_08` ist ersichtlich, dass bei steigender Spannung an der
Diode (von :math:`0 - 0,5 /, V`) der Diodenstrom nahe Null bleibt, bis die Spannung Werte
nahe der Schwellenspannung (:math:`\approx 0,6 /, V`) erreicht. An dieser Stelle wird die Diode
"eingeschaltet" und der Wegstrom (Diodenstrom) wird nur durch den Widerstand :math:`R1`
begrenzt. Falls bei abnehmender Diodenspannung die :math:`VI` -Kurve nicht gleich ist,
führt dies zur Diodenhysterese. Die obere Kurve aus :numref:`19_fig_08` zeigt, dass die
untere Diodenspannung nach dem "Einschalten" der Diode einen höheren Strom
verursacht als bei der vorherigen "Abschaltung" der Diode. Eine ideale Diode hätte
keine Hysterese, d.h. der Diodenstrom wäre unabhängig von früheren Diodenzuständen,
sondern nur von der Diodenspannung.

.. note::
   Versuchen Sie zu beantworten, was die Ursache der Diodenhysterese ist?
