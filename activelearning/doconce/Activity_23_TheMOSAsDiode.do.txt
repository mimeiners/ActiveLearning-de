Der MOS-Transistor ist als Diode geschaltet
===========================================

Zielsetzung
-----------

Der Zweck dieser Experimente besteht darin, die
Vorwärtsstrom-Spannungs-Charakteristik eines MOS-Feldeffekttransistors
(NMOS und PMOS), der als eine Diode verbunden ist, zu
untersuchen. Bevor dieses Experiment durchgeführt wird, wird ein
Überblick über das vorherige Experiment empfohlen.



.. note::
   
   .. _hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
   .. _Oscilloscope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
   .. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
   .. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
   .. _here: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extt.html#extension-connector-e2
   .. _simple: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
   .. _rectifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity20_DiodeRectifiers.html
   .. _OP484: http://www.analog.com/media/en/technical-documentation/data-sheets/OP184_284_484.pdf
   .. _inverting: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity13_BasicOPAmpConfigurations.html#inverting-amplifier
   .. _Jupyter: http://jupyter.org/index.html
   .. _Notebook: http://jupyter.org/index.html
   .. _ZVN211: http://www.redrok.com/MOSFET_ZVN2110A_100V_320mA_4O_Vth2.4_TO-92_ELine.pdf
   .. _ZVP211: https://www.diodes.com/assets/Datenblätter/ZVP2110A.pdf
   .. _empfohlen: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity22_TheBJTasDiode.html


   In diesen Tutorials verwenden wir die Terminologie aus dem
   Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya
   STEMlab-Board-Hardware beziehen.

   Oscilloscope_ & Signal_generator_Anwendung wird zum Erzeugen und
   Beobachten von Signalen auf der Schaltung verwendet.

   Die für die Spannungsversorgung **+5V**, **-3.3V** und **+3.3V**
   verwendeten Steckerstifte sind in der Dokumentation hier
   aufgeführt.


.. hint::
   Red Pitaya STEMlab-Ausgänge können Spannungssignale mit einem
   maximalen Ausgangsbereich von +/- 1V (2Vpp) erzeugen. Für dieses
   Experiment sind die höheren Signalamplituden erforderlich. Aus
   diesem Grund werden wir einen OP484_ in der inverting_opamp
   Konfiguration verwenden, um die Signalverstärkung von OUT1 / OUT2
   zu ermöglichen und einen Spannungshub von +4,7V bis -3,2V zu
   erreichen. Ein OP484 wird von STEMlab + 5V und -3.3V
   Spannungsschienen geliefert. Die Verstärkung des invertierenden
   Verstärkers wird auf ~ 5 gesetzt, wobei gilt
   :math:`R_i = 2.2\,k\Omega` und :math:`R_f = 10 \,k\Omega`

   
Versuchen Sie zu beantworten, warum wir ein OP484 anstelle von OP27
oder OP97 verwendet haben. (note "Schiene-zu-Schiene").
   

Materialien
-----------

- Red Pitaya STEMlab
- OP484_ Quad-Rail-Rail-Operationsverstärker
- 1kΩ Widerstand
- Kleinsignal-NMOS-Transistor (ZVN211_)
- Kleinsignal-PMOS-Transistor (ZVP211_)
- lötfreies Steckbrett

  
NMOS als Diode
--------------

Die Verbindung des NMOS in Diodenkonfiguration ist in Fig. 2
gezeigt. NMOS arbeitet anders als der NPN BJT-Transistor in einer
Diodenkonfiguration.

Die Vorwärts-Drop-Down-Spannung ist nicht typisch 0,7 V, aber sie
hängt von der Transistorgröße, der Spezifikation usw. ab. Für den
ausgewählten NMOS-Transistor so genannte Schwellenspannung
:math:`V_{TH}` ist etwa 2.4V. Dies bedeutet, wenn die Gate (G) Spannung
überschreitet :math:`V_ {TH}` der Transistor wird eingeschaltet und
beginnt zu leiten. Da der Drain (D) -Pin natürlich mit dem Gate-Pin
des Transistors verbunden ist, bleibt das Potential von :math:`D-G`
auf dem Pegel der Schwellenspannung :math:`V_{TH}`.


.. note::
   Diese Konfiguration von NMOS wird effektiv eine Diode mit einer
   Vorwärtsabfallspannung erzeugen, die gleich ist zu :math:`V_ {TH}` 


.. figure:: img/Activity_23_Fig_01.png
   :name: 23_fig_01

   ZVN211_ Spezifikationen

Auf dem Steckbrett die Schaltung aus :numref:`23_fig_02` aufbauen und mit den
Messungen fortfahren.



.. figure:: img/Activity_23_Fig_02.png
   :name: 23_fig_02
   :align: center

   Anschlussdiagramm der NMOS-Diode


Verfahren
----------

1. Erstellen Sie die Schaltung aus :numref:`23_fig_01` auf dem
   Steckbrett. Stellen Sie R1 = 2.2kΩ, R2 = 10kΩ und R3 = 1kΩ ein. Für
   M1 nehmen Sie ZVN211.
   

   .. figure:: img/Activity_23_Fig_03.png
      :name: 23_fig_03
      :align: center

      NMOS-Diodenverbindung auf dem Steckbrett

   
   .. warning::
      Bevor Sie den Stromkreis an die STEMlab -3.3V und + 3.3V Anschlüsse
      anschließen, überprüfen Sie Ihren Stromkreis. Die
      Spannungsversorgungsstifte -3,3 V und + 3,3 V haben keinen
      Kurzschluss und können im Falle eines Kurzschlusses beschädigt
      werden.
   

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,45
   V, den DC-Offset auf -0,45 V und die Frequenz auf 1 kHz ein, um die
   Eingangsspannung anzulegen.
   
   Wählen Sie im Wellenform-Menü TRIANGLE, deaktivieren Sie SHOW und
   wählen Sie enable.
   
4. Stellen Sie sicher, dass IN1, IN2 und MATH V / div auf der linken
   unteren Seite des Bildschirms auf 1V / div eingestellt sind (Sie
   können V / div einstellen, indem Sie die gewünschte Option
   auswählen Kanal und mit vertikalen +/- Kontrollen)
   
5. Setzen Sie t / div Wert auf 200us / div (Sie können t / div mit
   horizontalen +/- Kontrollen einstellen)
   
6. Stellen Sie unter MATH-Kanaleinstellungen folgendes ein
   :math:`IN1-IN2` und wählen Sie ENABLE.
	 
7. Stellen Sie unter den Menüeinstellungen IN1 und IN2 den Messtaster
   auf x10 und den vertikalen Offset auf 0.
   
8. Stellen Sie unter Einstellungen des Menüs MATH den vertikalen
   Offset auf 0 ein.
   
9. Stellen Sie unter TRIGER-Einstellungen den Triggerpegel auf 1V ein



   .. figure:: img/Activity_23_Fig_04.png
      :name: 23_fig_04
      :align: center

      NMOS-Diodenanschluss-Messungen

   
VI-Kurvenmessungen
------------------

Da sich NMOS wie eine Diode mit einer Vorwärtsspannung verhalten kann,
die der folgenden Gleichung entspricht :math:`V_ {TH}` (Konfiguration
in :numref:`23_fig_02`) können wir die VI-Charakteristik wie bei
Diodenmessungen messen. Für diese Aufgabe wird Jupyter verwendet
Notebook-Webanwendung. Wie man Jupyter Notebook startet und ein neues
Projekt erstellt, zeigt das Flussdiagramm in :numref:`23_fig_05`.


.. note::
   Das Jupyter_ Notebook_ ist eine Webanwendung, mit der Sie Dokumente
   erstellen und freigeben können, die Live-Code, Gleichungen,
   Visualisierungen und erklärenden Text enthalten. Sie haben auch die
   Unterstützung der Jupyter-Anwendung mit Red Pitaya-Bibliotheken
   sichergestellt, die die Steuerung aller Funktionen der
   STEMlab-Boards ermöglichen: Signalerfassung, Signalerzeugung,
   digitale Signalsteuerung, Kommunikation usw. Das Jupyter-Notebook
   wird auf die gleiche Weise gestartet wie jedes andere
   Anwendungen. Nach dem Start der Jupyter-Anwendung wird ein
   webbasiertes Notizbuch geöffnet. Diese Kombination aus Notebook,
   STEMlab und Python macht das STEMlab zu einem hervorragenden
   Werkzeug für das Prototyping und die schnelle Programmierung. Seit
   Jupyter Notebook ermöglicht Text, Gleichung und Bildbearbeitung ist
   dies ein perfektes Werkzeug für Tutorials, Beispiele und ect.
   


.. figure:: img/Activity_19_Fig_07.png
   :name: 23_fig_05
   :align: center

   Erstellen eines neuen Jupyter-Notebooks


Wenn Sie erfolgreich ein neues Jupyter-Notizbuch erstellt haben,
kopieren Sie den Code und fügen Sie ihn ein.

Der Code unten erzeugt das gleiche Signal wie in :numref:`23_fig_04`, aber es
wird sie im XY-Diagramm darstellen.

Zum Messen VI-Kurve wird ein "XY"-Plot benötigt, wobei die
x-Achse die Diodenspannung darstellt
:math:`IN_2` und y-Achse ein Diodenstrom :math:`(IN_1 - IN_2) / R_3`.

**Kopieren Sie den Code von unten in die Zelle 1**

.. literalinclude:: code/Activity_23_Code_01.py
   :language: python
   :linenos:
      
    
Erstelle eine neue Zelle (Einfügen -> Zelle darunter) und kopiere
Code von unten hinein.
 

.. literalinclude:: code/Activity_23_Code_02.py
   :language: python
   :linenos:

	  
Führen Sie Zelle 1 und Zelle 2 aus. notezelle 2 ist eine
Hauptschleife für die Erfassung und das erneute Plotten. Wenn Sie die
Erfassung stoppen, führen Sie nur die Zelle 2 aus um die Messung erneut zu starten.


Nach dem Ausführen des obigen Codes sollten Sie die Diode
VI-Charakteristik erhalten, wie in :numref:`23_fig_05` gezeigt.


.. figure:: img/Activity_23_Fig_06.png
   :name: 23_fig_06
   :align: center

   NMOS VI-Kennlinie gemessen mit Jupyter Notebook

   
   
PMOS als Diode
--------------

Gleiche Maße können auch für PMOS-Transistor gelten. Beim
PMOS-Transistor ist die Polarität der Spannung umgekehrt, so dass die
Konfiguration der PMOS-Diode anders sein muss NMOS eins. Die
Konfiguration der PMOS-Diode ist in :numref:`23_fig_07` dargestellt.



.. figure:: img/Activity_23_Fig_07.png
   :name: 23_fig_07
   :align: center

   Anschlussdiagramm der PMOS-Diode

   

Verfahren
---------

1. Erstellen Sie die Schaltung aus :numref:`23_fig_07` auf dem
   Steckbrett. Stellen Sie R1 = 2.2kΩ, R2 = 10kΩ und R3 = 1kΩ ein. Für
   M1 nimm ZVP211.

   .. warning::
      Bevor Sie den Stromkreis an die STEMlab :math:`-3.3\,\text{V}` und
      :math:`+3.3\,\text{V}` Anschlüsse anschließen, überprüfen Sie Ihren
      Stromkreis. Die Spannungsversorgungsstifte -3,3 V und +3,3 V haben
      keinen Kurzschluss und können im Falle eines Kurzschlusses
      beschädigt werden.
   

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen den Amplitudenwert auf 0,45
   V, den DC-Offset auf -0,45 V und die Frequenz auf 1 kHz ein, um die
   Eingangsspannung anzulegen.
   
   Wählen Sie im Wellenform-Menü TRIANGLE, deaktivieren Sie SHOW und
   wählen Sie enable.
   
4. Stellen Sie sicher, dass IN1, IN2 und MATH V / div auf der linken
   unteren Seite des Bildschirms auf 1V / div eingestellt sind (Sie
   können V / div einstellen, indem Sie die gewünschte Option
   auswählen Kanal und mit vertikalen +/- Kontrollen)
   
5. Setzen Sie t / div Wert auf 200us / div (Sie können t / div mit
   horizontalen +/- Kontrollen einstellen)
   
6. Stellen Sie unter MATH-Kanaleinstellungen folgendes ein
   :math:`IN1-IN2` und wählen Sie ENABLE.
	 
7. Stellen Sie unter den Menüeinstellungen IN1 und IN2 den Messtaster
   auf x10 und den vertikalen Offset auf 0.
   
8. Stellen Sie unter Einstellungen des Menüs MATH den vertikalen
   Offset auf 0 ein.
   
9. Stellen Sie unter TRIGER-Einstellungen den Triggerpegel auf 1V ein


.. figure:: img/Activity_23_Fig_08.png
   :name: 23_fig_08
   :align: center

   PMOS-Diodenanschlussmessungen

   
Wie in :numref:`23_fig_08` zu sehen, verhält sich der PMOS in der
Diodenkonfiguration wie eine Diode mit einer Vorwärtsabfallspannung
gleich dem PMOS :math:`V_ {TH}`. Vergleichen Sie die Abbildungen 8 und
4 und versuchen Sie, den Unterschied zwischen NMOS- und
PMOS-Diodenkonfigurationen zu erklären.
























































































































































































































































