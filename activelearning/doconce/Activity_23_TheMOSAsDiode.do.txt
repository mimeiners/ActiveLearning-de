Der MOS-Transistor ist als Diode geschaltet
###########################################

Zielsetzung
___________

Der Zweck dieser Experimente besteht darin, die
Vorwärtsstrom-Spannungs-Charakteristik eines MOS-Feldeffekttransistors
(NMOS und PMOS), der als eine Diode verbunden ist, zu
untersuchen. Bevor dieses Experiment durchgeführt wird, wird ein
Überblick über das vorherige Experiment empfohlen.



Anmerkungen
___________

.. -hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Oszilloskop: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
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

Die für die Spannungsversorgung ** + 5V **, ** - 3.3V ** und ** + 3.3V
** verwendeten Steckerstifte sind in der Dokumentation hier
aufgeführt.


.. note::
   Red Pitaya STEMlab-Ausgänge können Spannungssignale mit einem
   maximalen Ausgangsbereich von +/- 1V (2Vpp) erzeugen. Für dieses
   Experiment sind die höheren Signalamplituden erforderlich. Aus
   diesem Grund werden wir einen OP484_ in der inverting_opamp
   Konfiguration verwenden, um die Signalverstärkung von OUT1 / OUT2
   zu ermöglichen und einen Spannungshub von +4,7V bis -3,2V zu
   erreichen. Ein OP484 wird von STEMlab + 5V und -3.3V
   Spannungsschienen geliefert. Die Verstärkung des invertierenden
   Verstärkers wird auf ~ 5 gesetzt, wobei gilt :math:`R_i = 2.2k \
   Omega` und: math:` R_f = 10k \ Omega`
   
   Versuchen Sie zu beantworten, warum wir ein OP484 anstelle von OP27
   oder OP97 verwendet haben. (note "Schiene-zu-Schiene").
   

Materialien
-----------

- Rotes Pitaya STEMlab
- 1x OP484_ Quad-Rail-Rail-Operationsverstärker
- 1x 1kΩ Widerstand
- 1x Kleinsignal-NMOS-Transistor (ZVN211_)
- 1x Kleinsignal-PMOS-Transistor (ZVP211_)
- 1x lötfreies Steckbrett

  
NMOS als Diode
--------------

Die Verbindung des NMOS in Diodenkonfiguration ist in Fig. 2
gezeigt. NMOS arbeitet anders als der NPN BJT-Transistor in einer
Diodenkonfiguration.

Die Vorwärts-Drop-Down-Spannung ist nicht typisch 0,7 V, aber sie
hängt von der Transistorgröße, der Spezifikation usw. ab. Für den
ausgewählten NMOS-Transistor so genannte Schwellenspannung :math:`V_
{TH}` ist etwa 2.4V. Dies bedeutet, wenn die Gate (G) Spannung
überschreitet :math:`V_ {TH}` der Transistor wird eingeschaltet und
beginnt zu leiten. Da der Drain (D) -Pin natürlich mit dem Gate-Pin
des Transistors verbunden ist, bleibt das Potential von :math:`D-G`
auf dem Pegel der Schwellenspannung :math:`V_ {TH}`.


.. note::
   Diese Konfiguration von NMOS wird effektiv eine Diode mit einer
   Vorwärtsabfallspannung erzeugen, die gleich ist zu :math:`V_ {TH}` 


.. figure:: img/Activity_23_Fig_1.png

   Abbildung 1: ZVN211_ Spezifikationen

Auf dem Steckbrett die Schaltung aus Abbildung 2 aufbauen und mit den Messungen fortfahren.


.. figure:: img/Activity_23_Fig_2.png

   Abbildung 2: Anschlussdiagramm der NMOS-Diode


Verfahren
----------

1. Erstellen Sie die Schaltung aus Abbildung 1 auf dem Steckbrett. Stellen Sie R1 = 2.2kΩ, R2 = 10kΩ und R3 = 1kΩ ein. Für M1 nehmen Sie ZVN211.

.. figure:: img/Activity_22_Fig_3.png

   Abbildung 3: NMOS-Diodenverbindung auf dem Steckbrett

   
.. Warnung::
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



.. figure:: img/Activity_23_Fig_4.png

   Abbildung 4: NMOS-Diodenanschluss-Messungen

   
VI-Kurvenmessungen
----------------------

Da sich NMOS wie eine Diode mit einer Vorwärtsspannung verhalten kann,
die der folgenden Gleichung entspricht :math:`V_ {TH}` (Konfiguration
in Abbildung 2) können wir die VI-Charakteristik wie bei
Diodenmessungen messen. Für diese Aufgabe wird Jupyter verwendet
Notebook-Webanwendung. Wie man Jupyter Notebook startet und ein neues
Projekt erstellt, zeigt das Flussdiagramm in Abbildung 5.


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
   


.. figure:: img/ Activity_19_Fig_7.png

   Abbildung 5: Erstellen eines neuen Jupyter-Notebooks


Wenn Sie erfolgreich ein neues Jupyter-Notizbuch erstellt haben,
kopieren Sie den Code und fügen Sie ihn ein.

Der Code unten erzeugt das gleiche Signal wie in Abbildung 4, aber es
wird sie im XY-Diagramm darstellen.

Zum Messen :math:`VI`-Kurve wird ein "XY"-Plot benötigt, wobei die
x-Achse die Diodenspannung darstellt

 :math:`IN_2` und y-Achse ein Diodenstrom: math:` (IN_1 - IN_2) / R_3`.


.. note:: Kopieren Sie den Code von unten in die Zelle 1

.. code-block:: python
      
      # Bibliotheken importieren
      von redpitaya.overlay.quecksilber importieren Quecksilber als Overlay

      von bokeh.io import push_notebook, anzeigen, output_notebook
      aus bokeh.models importieren HoverTool, Range1d, LinearAxis, LabelSet, Label
      aus bokeh.plotting Importfigur, Ausgabedatei, anzeigen
      aus bokeh.resources importieren INLINE
      output_notebook (Ressourcen = INLINE)

      importiere numpy als np
      
      # Initialisiere fpga-Module
      fpga = Überlagerung ()
      gen0 = fpga.gen (0)
      osc = [fpga.osc (ch, 1.0) für ch im Bereich (fpga.MNO)]
      
      # Konfigurieren Sie den Generatorkanal OUT1
      gen0.amplitude = 0,45
      gen0.offset = -0,45
      gen0.waveform = gen0.sawzahn (0.5)
      gen0.frequency = 2000
      gen0.start ()
      gen0.enable = Wahr
      gen0.trigger ()
    
      # R1 Widerstandswert
      R3 = 1000

      # Konfigurieren Sie die Eingangskanäle IN1 und IN2 des Oszilloskops
      für ch in osc:
          ch.filter_bypass = Wahr
          # Datenrate Dezimierung
          ch.decimation = 10
          # Trigger-Timing [Beispielperioden]
          N = ch.buffer_size
          ch.trigger_pre = 0
          ch.trigger_post = N
          # osc0 steuert beide Kanäle
          ch.sync_src = fpga.sync_src ["osc0"]
          ch.trig_src = fpga.trig_src ["osc0"]
          # Triggerpegel [V], Flanke ['neg', 'pos'] und Haltezeit [Abtastperioden]
          ch.level = 0,01
          ch.edg = 'pos'
          ch.holdoff = 0
       
      # Diodenstrom und -spannung initialisieren
      V = I = np.zeros (N)

      # Plotten
      hover = HoverTool (Modus = 'vline', Tooltips = [("V", "@x"), ("I", "@y")])
      tools = "rad_zoom, box_zoom, zurücksetzen, schwenken"
      p = Zahl (plot_height = 500, plot_width = 900, title = "XY-Plot der Charakteristik des NMOS-Transistors VI", toolbar_location = "right", tools = (Werkzeuge, Hover))
      p.xaxis.axis_label = 'Spannung [V]'
      p.yaxis.axis_label = 'Strom [mA]'
      r = p.line (V, I, Zeilenbreite = 1, Zeilenfarbe = 0.7, Farbe = "Blau")
      # Get und explizite Handle um die nächste Show Zelle zu aktualisieren
      Ziel = anzeigen (p, notebook_handle = True)

 
 Erstelle eine neue Zelle (Einfügen -> Zelle darunter) und kopiere
 Code von unten hinein.
 

 .. code-block:: python

      # Messen von I, V und Neuplotten
      wahr:
          # zurücksetzen und starten
          osc [0] .reset ()
          osc [0] .start ()
          # warte auf Daten
          while (osc [0] .status_run ()): passiere
          V0 = osz [0] .data (N-100) * 10 # IN1-Signal
          V1 = osz [1] .data (N-100) * 10 # IN2-Signal
          I = ((V0-V1) / R3) * 1E3 # 1E3 Umwandlung in mA
          r.data_source.data ['x'] = V0
          r.data_source.data ['y'] = I
          push_notebook (handle = Ziel)

	  
 Führen Sie Zelle 1 und Zelle 2 aus. notezelle 2 ist eine
 Hauptschleife für die Erfassung und das erneute Plotten. Wenn Sie die
 Erfassung stoppen, führen Sie nur die Zelle 2 aus um die Messung erneut zu starten.


Nach dem Ausführen des obigen Codes sollten Sie die Diode
VI-Charakteristik erhalten, wie in Abbildung 5 gezeigt.


.. figure:: img/ Activity_23_Fig_5.png

   Abbildung 6: NMOS VI-Kennlinie gemessen mit Jupyter Notebook

   
PMOS als Diode
----------------

Gleiche Maße können auch für PMOS-Transistor gelten. Beim
PMOS-Transistor ist die Polarität der Spannung umgekehrt, so dass die
Konfiguration der PMOS-Diode anders sein muss NMOS eins. Die
Konfiguration der PMOS-Diode ist in Abbildung 7 dargestellt.



.. figure:: img/ Activity_23_Fig_6.png

   Abbildung 7: Anschlussdiagramm der PMOS-Diode

   

Verfahren
---------

1. Erstellen Sie die Schaltung aus Abbildung 7 auf dem Steckbrett. Stellen Sie R1 = 2.2kΩ, R2 = 10kΩ und R3 = 1kΩ ein. Für M1 nimm ZVP211.

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


.. figure:: img/ Activity_23_Fig_7.png

   Abbildung 8: PMOS-Diodenanschlussmessungen

   
Wie in Abbildung 8 zu sehen, verhält sich der PMOS in der
Diodenkonfiguration wie eine Diode mit einer Vorwärtsabfallspannung
gleich dem PMOS :math:`V_ {TH}`. Vergleichen Sie die Abbildungen 8 und
4 und versuchen Sie, den Unterschied zwischen NMOS- und
PMOS-Diodenkonfigurationen zu erklären.
























































































































































































































































