Diodes und Jupyter Notebook Beispiel
====================================

Zielsetzung
-----------

Der Zweck dieser Aktivität besteht darin, den Strom gegen die Spannung
zu untersuchen Eigenschaften von verschiedenen Festkörper - PN -
Übergangsdioden, wie z konventionelle Si - Diode, die Schottky -
Diode, die Zener - Diode und Leuchtdiode (LED).

Anmerkungen
-----------

.. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
.. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Jupyter: http://jupyter.org/index.html
.. _Notebook: http://jupyter.org/index.html


In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch
wenn man sich auf die Verbindungen zum Red Pitaya STEMlab Board bezieht
Hardware_.

Erweiterungssteckerstifte für **-3.3V** und **+3.3V** Spannung
Versorgung finden Sie in der Dokumentation here_.

Oscilloscope_ & Signal_ generator_ Anwendung wird zum Generieren verwendet
und Beobachten von Signalen auf der Schaltung.


Hintergrund
-----------

Die PN-Sperrschichtdiode ist eine Vorrichtung, die üblicherweise in
der Schaltung verwendet wird Anwendungen wie Rektifikation, wo Strom
fließen darf nur eine Richtung. Wenn die Diode in Silizium hergestellt
wird, die Vorwärtsspannungsabfall beträgt typischerweise 0,7 V und
das :math:`{V_D}` vs. :math:`{I_D}` - Charakteristik in Bezug auf
Diodenspannung und -strom kann durch eine exponentielle Beziehung
beschrieben werden: 

.. math::
   :label: 19_eq_01

   I_D = I_S \ bigg (e ^ {\ frac {V_Dq} {nkT}} - 1 \ bigg) \ quad (1)

wo :math:`I_ {S}` und n sind Skalierungsfaktoren und :math:`kT / q`
(25,4 mV bei Raumtemperatur) ist die sogenannte thermische
Spannung :math:`{V_T}`.


Diode schematische Symbole
--------------------------

Jeder Typ von Diode hat ein spezifisches schematisches Symbol, das ist
Variationen des herkömmlichen Diodensymbols links in
Abbildung 1. Eine Art "Z" -förmige Kathode bezeichnet eine Zener-Diode wie in der
zweites Symbol in Fig. 1. Eine "S" -förmige Kathode bezeichnet einen Schottky
Diode wie im nächsten Symbol. Die Pfeile zeigen von der Diode weg
bezeichnet eine LED wie im rechten Symbol. Pfeile zeigen in Richtung
die Diode würde einen Photodioden-Lichtdetektor darstellen.


.. figure:: img/Activity_19_Fig_01.png
   :name: 19_fig_01
   :align: center

   Diodeschemasymbole

   
Zener-Dioden-Grundlagen
-----------------------
Eine Zener-Diode ist im Aufbau und in der Funktionsweise ähnlich
Diode. Im Gegensatz zu einer herkömmlichen Diode, bei der die
beabsichtigte Verwendung ist Strom in umgekehrter Richtung verhindern,
wird meistens eine Zenerdiode verwendet im umgekehrten Bereich
oberhalb der Durchbruchspannung. Es ist :math:`I` vs,
:math:`V` -Kennlinie ist ähnlich wie eine gewöhnliche Diode. Durch 
das Einstellen der Dotierung der P- und N-Seiten der Kreuzung ist es
möglich, eine Zener-Diode zu entwerfen, die irgendwo aufbricht
von ein paar Volt bis zu einigen hundert Volt. Siehe Abbildung 2. In diesem
Durchbruch oder Zener-Bereich wird die Diodenspannung bleiben
über einen weiten Bereich von Strömen ungefähr konstant. Das
maximales Sperrspannungspotential, das vorher angewendet werden kann
Das Eintreten in die Zener-Region wird als Peak Inverse Voltage bezeichnet
(PIV) oder die Spitzensperrspannung (PRV).


.. figure:: img/Activity_19_Fig_02.png
   :name: 19_fig_02
   :align: center

   Vorwärts- und Rückwärts-Zenerdiode :math:`I/V` -Charakteristik
   

Bei Spannungen oberhalb des Ausbruchsbeginns wurde ein Anstieg angewendet
Spannung wird dazu führen, dass mehr Strom in der Diode fließt, aber die Spannung
über die Diode bleibt fast bei :math:`V_Z`. Eine Zener-Diode
im Rückwärtsbetrieb betriebene Breakdown kann eine Referenzspannung für liefern
Systeme wie Spannungsregler oder Spannungsvergleicher.


Schottky-Dioden-Grundlagen
--------------------------

Eine Schottky-Diode verwendet einen gleichrichtenden Metall-Halbleiter
Verbindung, die durch Plattieren, Verdampfen oder Sputtern von einer Vielzahl gebildet wird
von Metallen auf n-Typ- oder p-Typ-Halbleitermaterial. Allgemein,
Im Handel sind Silizium vom n-Typ und GaAs vom n-Typ verwendet
Schottky-Dioden. Die Eigenschaften einer in Vorwärtsrichtung vorgespannten Schottky-Barriere
Dioden werden durch Majoritätsträgerphänomene bestimmt. Eine herkömmliche PN
Die Eigenschaften der Sperrschichtdiode werden durch Minorität bestimmt
Träger. Schottky-Dioden sind Majority-Carrier-Geräte, die sein können
schnell umgeschaltet von Vorwärts- zu Sperrspannung ohne Minoritätsträger
Speichereffekte.

Der normale Strom gegen Spannung :math:`I/V` -Kurve einer Schottky-Barriere
Diode ähnelt der einer PN-Diode mit dem folgenden
Ausnahmen:

1. Die Durchbruchspannung einer Schottky-Diode ist niedriger
   und der Sperr-Leckstrom ist höher als der eines PN-Übergangs
   Diode hergestellt unter Verwendung des Halbleitermaterials mit dem
   gleichen spezifischen Widerstand. 
   
2. Die Vorwärtsspannung bei einem bestimmten Vorwärtsstrom ist auch niedriger für
   eine Schottky-Diode als für eine PN-Diode. Beispielsweise,
   bei 2 mA Durchlassvorspannung eine Silizium-Schottky-Diode mit
   niedriger Sperrschicht wird eine Vorwärtsspannung von ~ 0,3 Volt
   haben, während ein Silizium PN Die Sperrschichtdiode hat eine
   Spannung von ~ 0,7 Volt. Das ist niedriger Vorwärtsspannungsabfall
   kann die Verlustleistung in der Diode durch abschneiden mehr als
   die Hälfte. Diese Energieeinsparung kann sehr bedeutend sein, wenn
   Die Dioden müssen große Vorwärtsströme führen. Die jetzige 
   vs. Spannung ( :math:`I / V`) Beziehung für eine Schottky-Diode
   ist durch die folgende Gleichung gegeben, die als Richardson bekannt ist
   Gleichung. Der Hauptunterschied zur herkömmlichen Diode
   Gleichung ist in :math:`I_S` mit dem Zusatz der modifizierten
   Richardson-Konstante :math:`A ^ *`.
   

.. math::
   :label: 19_eq_02

   I_D = I_S \ bigg (e ^ {\ frac {V_Dq} {nkT}} - 1 \ bigg) \ quad (2)

.. math::
   :label: 19_eq_03

   I_S = A A ^ * T ^ 2 e ^ {- \ Frac {q \ Phi B} {kT}} \ quad (3)

   
Woher:

* :math:`A` = Verbindungsbereich
  
* :math:`A ^ *` = modifizierte Richardson-Konstante (der Wert variiert
  je nach Material und Dotierstoff) = :math:`110 A / (° K ^ 2-cm ^ 2)` für Si vom n-Typ
  
* :math:`T` = absolute Temperatur in :math:`K` (Kelvins)
  
* :math:`q` = elektronische Ladung = :math:`1.6E-19 \ quad C`
  
* :math:`\ Phi B` = Barrierenhöhe in Volt

* k = Boltzman-Konstante = 1.37 * 10-23 J / K = :math:`1.37E-23 \ quad J / K`
  
* :math:`n` = Idealitätsfaktor (Vorwärtsneigungsfaktor, bestimmt durch
  Metall-Halbleiter-Schnittstelle) 

  

LED-Grundlagen
--------------

Die LED ist eine Sperrdiode, die bei Vorwärtsbetrieb Licht emittiert
voreingenommen. Tatsächlich emittieren alle PN-Übergangsdioden
Photonen, wenn sie vorwärts gehen Voreingenommen ist es nur, dass die
Photonen im Infrarotband liegen und die Die physikalische Form der
Diode lässt die Photonen nicht austreten Paket. Um die Eigenschaft der
Emission von sichtbarem Licht zu erreichen, ist es notwendig, um die
LED aus Materialien mit größeren Bandlücken herzustellen anders als
Silizium. Infolgedessen sinkt der Vorwärtsspannungsabfall der LED ist
größer als 0,7 V; in der Regel in der Größenordnung von 1,5 bis 2 Volt
abhängig auf der Wellenlänge des emittierten Lichts. Die LED ist
ebenfalls in einem eingebaut spezielle transparente Verpackung wie in
Abbildung 3 gezeigt.


.. figure:: img/Activity_19_Fig_03.png
   :name: 19_fig_03
   :align: center

   Leuchtdioden

Eine LED ist ein Halbleitergerät, das elektromagnetische Strahlung emittiert
bei optischen und Infrarotfrequenzen. Das Gerät ist eine PN-Diode
hergestellt aus Halbleitern vom p-Typ und n-Typ, gewöhnlich GaAs, GaP
oder SiC. Sie geben nur dann Licht ab, wenn eine externe angelegte
Spannung verwendet wird Vorspannung die Diode über einen minimalen
Schwellenwert. Der Gewinn in die von dieser Spannung abgegebene
elektrische potentielle Energie reicht dazu aus erzwingen, dass
Elektronen aus dem n-Typ-Material über die Sperrschicht und in die
p-Typ-Region. Diese Schwellenspannung für den Beginn des Stromflusses
über die Kreuzung und die Produktion des Lichts ist :math:`V_0`. Die
Emission von Licht erfolgt nach Elektronen Eintritt in die p-Region
(und Löcher in die n-Region). Diese Elektronen sind eine kleine
Minderheit, die von Löchern umgeben ist (im Wesentlichen die
Antiteilchen der Elektronen) und sie werden schnell ein Loch finden
rekombinieren mit. Energetisch entspannt sich das Elektron vom
Erregten Zustand (Leitungsband) zum Grundzustand (Valenzband). Die
Dioden Man nennt das Licht emittieren, weil die Energie vom Elektron
abgegeben wird wenn es sich entspannt, wird es als Photon
emittiert. Über dem Schwellenwert, der Strom und Lichtleistung steigen
exponentiell mit der Vorspannung an über die Diode. Die Quanten der
Energie oder des Photons haben eine Energie :math:`E = hf`. Die
Beziehung zwischen der Photonenenergie und der Einschaltspannung
:math:`V_0`, ist: 

      
.. math::
   
   eV_0 = E_g = hf = \ frac {hc} {\ lambda} \ quad (4)

   
woher:

* :math:`E_g` ist die Größe der Energielücke
  
* :math:`V_0` ist die Schwellenspannung
  
* :math:`f` und :math:`\lambda` sind die Frequenz und Wellenlänge von
  die emittierten Photonen 
  
* :math:`c` ist die Lichtgeschwindigkeit
  
* :math:`e` ist die elektronische Ladung
  
* :math:`h` ist Plancks Konstante

  
pn-Flächendiode I/V-Charakteristik
----------------------------------

Die Strom-Spannungs-Kennlinie der pn-Diode kann gemessen werden mit
dem STEMlab und den folgenden Verbindungen in Abbildung 4. Stellen Sie
das Steckbrett mit dem OUT1-Ausgang des Generators ein an einem Ende
des Widerstands angebracht. Das andere Ende des Widerstands ist
verbunden mit einem Ende der Diode gemessen wie in der Diagramm. Die
Eingangskanäle IN1 und IN2 sind ebenfalls unterschiedlich verbunden
beendet den Widerstand, daher werden Diodenstrom und -spannung
angegeben wie:

.. math::

   I_d = (IN_1 - IN_2) / R_1 \\
   
   V_d = IN_2

   
.. figure:: img/Activity_19_Fig_04.png
   :name: 19_fig_04
   :align: center

   Anschlussplan für Dioden I- und V-Kurven

Zur Messung der Strom-Spannungs-Kennlinie des PN-Übergangs
Diode OUT1 Generator sollte als 1kHz Dreieckswelle mit 1 konfiguriert
werden V max und 0 V min Werte. Zum Messen: math: VI-Kurve und
XY-Kurve wird benötigt, wenn die x-Achse die Diodenspannung darstellt 
:math:`IN_2` und y-Achse ein Diodenstrom :math:`(IN_1 - IN_2) / R_1`.
Für diese Aufgabe verwenden wir die Jupyter Notebook Web-Anwendung.

.. note::
   Das Jupyter_ Notebook_ ist eine Webanwendung, die es Ihnen
   ermöglicht erstellen und teilen Sie Dokumente, die Live-Code,
   Gleichungen, Visualisierungen und erklärender Text. Sie haben auch
   die Unterstützung sichergestellt für die Jupyter-Anwendung mit Red
   Pitaya-Bibliotheken aktivieren Kontrolle aller Features der STEMlab
   Boards wie: Signal Erfassung, Signalerzeugung, digitale
   Signalsteuerung, Kommunikation usw. Das Jupyter Notebook wird auf
   die gleiche Weise gestartet wie alle anderen Anwendungen. Nach dem
   Start von Jupyter Anwendung ein Web basiertes Notizbuch ist
   geöffnet. Diese Kombination des Notebooks, STEMlab und Python
   Features macht das STEMlab zu einem ausgezeichneten Werkzeug für
   Prototyping und schnelle Programmierung. Seit Jupyter Notebook
   ermöglicht Text, Gleichung und Bildbearbeitung ist dies ein
   perfektes Werkzeug für Tutorials, Beispiele usw.

   
Aber bevor Sie messen VI-Kurve sollten Sie Spannungen überprüfen
Signale mit Oszilloskop & Signalgenerator Anwendung.



Materialien
-----------

- Lötfreies Steckbrett
  
- Widerstand 10 Ω
  
- Herkömmliche Diode (1N4001 oder ähnlich)
  

Zeitbereichsmessungen
---------------------

1. Erstellen Sie die Schaltung aus Abbildung 4 auf dem Steckbrett

   .. figure:: img/Activity_19_Fig_05.png
      :name: 19_fig_05
      :align: center

      Verbindungen auf dem Steckbrett

      
2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,5 V, DC-Offset auf ein
   0,5 V, um eine Dreieckswelle als Eingangsspannung anzulegen. Von dem
   Waveform-Menü TRIANGLE auswählen, SHOW-Button deaktivieren und auswählen
   aktivieren.
   
4. Stellen Sie sicher, dass IN1 V / div am linken unteren Bildschirmrand steht
   200mV / div (Sie können V / div einstellen, indem Sie den gewünschten Kanal und auswählen
   mit vertikalen +/- Kontrollen)
   
5. Vergewissern Sie sich, dass IN2 V / div auf der linken unteren Seite des Bildschirms steht
   200mV / div (Sie können V / div einstellen, indem Sie den gewünschten Kanal und auswählen
   mit vertikalen +/- Kontrollen)
   
6. Setzen Sie t / div-Wert auf 200us / div (Sie können t / div mit horizontalem einstellen
   +/- Kontrollen)
   
7. Stellen Sie im Menü MATH settings IN1-IN2 ein und wählen Sie
   enable. math Spur mit Faktor R1 skaliert Diodenstrom
   

   .. figure:: img/Activity_19_Fig_06.png
      :name: 19_fig_06
      :align: center

      Spannungen und Strom auf der Diode (zeitabhängig)
      

Aus Abbildung 6 können wir sehen, dass die Diode bei der Spannung
leitend wird darauf überschreiten Diodenspannung, die etwa 0,6 V ist. 

Außerdem ist der mit der MATH-Spur dargestellte Diodenstrom
beobachtbar. Wir können deutlich sehen, dass, wenn die Diodenspannung
unter 0,6 liegt der Diodenstrom ist 0A. Zu dem Zeitpunkt, zu dem die
Diodenspannung 0,6 V überschreitet, beginnt die Diode Leiten und der
Pfadstrom wird nur durch den Widerstand R1 begrenzt. 


Vorgehensweise - VI-Merkmalsmessungen
-------------------------------------

Für diese Aufgabe verwenden wir die Jupyter Notebook Web-Anwendung. 
Wie man Jupyter Notebook startet und ein neues Projekt erstellt, zeigt
das Flussdiagramm in Abbildung 7. 

.. figure:: img/Activity_19_Fig_07.png
   :name: 19_fig_07
   :align: center

   Erstellen eines neuen Jupyter-Notebooks.
   

Wenn Sie erfolgreich ein neues Jupyter-Notizbuch erstellt haben,
kopieren und einfügen Code unten und führen Sie es aus. Code unten
erzeugt das gleiche Signal wie von Abbildung 6, aber es wird sie in
XY-Graphen darstellen. Zum Messen :math:`VI` Kurve ein "XY"
Diagramm ist erforderlich, wo x-Achse Diode darstellt Spannung
:math:`IN_2` und y-Achse ein Diodenstrom :math:`(IN_1 - IN_2)/R_1`. 

Kopieren Sie den Code von unten in die Zelle 1.
  
.. literalinclude:: code/Activity_19_Code_01.py
   :language: python
   :linenos:


      
Erstelle eine neue Zelle (Einfügen -> Zelle darunter) und kopiere Code
von unten in es.

.. literalinclude:: code/Activity_19_Code_02.py
   :language: python
   :linenos:

   
Führen Sie Zelle 1 und Zelle 2 aus. note Zelle 2 ist eine
Hauptschleife für die Akquisition und Neuplanung. Wenn Sie die
Erfassung stoppen, fahren Sie einfach fort nur Zelle 2 zum erneuten
Starten der Messungen. 


Nach dem Ausführen des obigen Codes sollten Sie die Diode VI als
charakteristisch erhalten ist in Abb. 8 dargestellt.

.. figure:: img/Activity_19_Fig_08.png
   :name: 19_fig_08
   :align: center

   Didoes VI-Charakteristik gemessen mit Jupyter Notebook

Aus der Abbildung 8 ist die typische Dioden-VI-Charakteristik
ersichtlich. Von die Zahl 8 können wir sehen, wie die Spannung an der
Diode ist steigend (von 0 bis 0,5 V) bleibt der Diodenstrom nahe Null
bis Spannung erreicht Werte in der Nähe der Schwellenspannung (~ 0,6
V). An diesem Punkt Diode ist "eingeschaltet" und der Pfad Strom
(Diodenstrom) ist nur begrenzt durch Widerstand R1. In dem Fall, wenn
die Diodenspannung abnimmt die VI-Kurve ist nicht die gleiche, was zu
der Diodenhysterese führt. Oberer, höher Die Kurve aus Abbildung 8
zeigt, dass nach dem Einschalten der Diode die Eine niedrigere
Diodenspannung verursacht einen höheren Strom als in dem Fall, wenn
die Diode wurde vorher "ausgeschaltet". Eine ideale Diode hätte das
nicht Hysterese, d.h. der Diodenstrom wäre unabhängig von vorherigem 
Diodenzustände aber nur auf der Diodenspannung.

.. note::
   Versuchen Sie zu beantworten, was die Diodenhysterese verursacht.
