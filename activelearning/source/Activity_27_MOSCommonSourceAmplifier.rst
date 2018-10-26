MOS-Transistor-Source-Verstärker
================================

Zielsetzung
-----------

Der Zweck dieses Experiments ist es, die Common - Source - Verstärkerkonfiguration des MOS-Transistors zu untersuchen.


Anmerkungen
-----------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Signalgeneratoranwendung: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Dokumentation: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _BJT common emitter amplifier: http://red-pitaya-active-learning.readthedocs.io/en/latest/Activity26_BJTCommonEmitterAmplifier.html#bjt-common-emitter-amplifier
.. _Wikipedia Common Source: https://en.wikipedia.org/wiki/Common_source
.. _Common Source Amplifier Tutorial 1: http://www.electronics-tutorials.ws/amplifier/amp_3.html
.. _MIT Common Source Amplifier Lecture: https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-012-microelectronic-devices-and-circuits-fall-2005/lecture-notes/lecture19annotat.pdf
.. _Common Source Amplifier with Source Degeneration: http://examcrazy.com/Engineering/Electronics-Communication/Common_Source_Amplifier_with_Source_Degeneration.asp
.. _Common Source Amplifier Tutorial 2: https://www.slideshare.net/yordibautista/fet-basics1
.. _Transconductance: https://en.wikipedia.org/wiki/Transconductance
.. _Drain Output Resistance: http://www.ittc.ku.edu/~jstiles/312/handouts/Drain%20Output%20Resistance.pdf

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch,
wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht.
Die Oszilloskop- und Signalgeneratoranwendung_ wird zum Erzeugen und Beobachten von
Signalen auf der Schaltung verwendet. Die Erweiterungsstecker-Pins für die
Spannungsversorgung **+5V**, **-3,3V** und **+3,3V** sind in der Dokumentation dargestellt.


Hintergrund
-----------

Die in Abbildung 1 dargestellte Konfiguration zeigt den NMOS-Transistor,
der als Common-Source-Verstärker verwendet wird. Um die Transistor - :math:`V_{GS}` - Spannung
für den selbstvorbelasteten DC-Betriebspunkt einzustellen, wird der
Spannungsteiler :math:`\frac{R_1}{R_2}` gewählt. Der Widerstand :math:`R_G` dient zur
Einstellung des **Gewinns** des Verstärkers. Der Wert des :math:`R_G` - Widerstandes
in Kombination mit den Widerständen :math:`R_1` und :math:`R_2` beeinflusst,
wie viel :math:`V_{in}` zur :math:`V_{GS}` - Spannung addiert wird und somit direkt
der **Gewinn** des Verstärkers eingestellt wird. Der Ausgangslastwiderstand :math:`R_L`
ist so gewählt, dass für den gewünschten Nenn-Drainstrom :math:`I_D` die am :math:`V_{DS}`
auftretende Spannung etwa ein Drittel der :math:`V_{DD}` - Versorgungsspannung beträgt.
Der Widerstand :math:`R_S` wird verwendet, um die Quellendegeneration hinzuzufügen,
um den DC-Betriebspunkt zu stabilisieren. Der beste Ansatz für die Auswahl von :math:`R_L`
und :math:`R_S` besteht darin, Spannungsabfälle über :math:`M_1`, :math:`R_L` und :math:`R_S`
zu ermöglichen, die dem 1/3 des :math:`V_{DD}` entsprechen (bei DC-Betriebszustand).
Daher ist :math:`R_S` = :math:`R_L`. Das Hinzufügen des Quell-Degenerationswiderstandes
hat die Stabilität des DC-Betriebspunktes bei gleichzeitig reduziertem Gewinn verbessert.
Eine höhere Verstärkung für Wechselstromsignale, kann bis zu einem gewissen Grad wiederhergestellt
werden, indem der Kondensator :math:`C_S` über den Degenerationswiderstand :math:`R_S` hinzugefügt wird,
wodurch der Wert ":math:`R_S`" für Wechselstromsignale nahe Null gesetzt wird. Der Kondensator :math:`C_2`
wird hinzugefügt, um die DC-Komponente des Ausgangssignals zu blockieren. Aufgrund der hohen
Eingangsimpedanz kann die Kapazität :math:`C_1` im Bereich von :math:`<\mu F` ausgewählt werden.

.. note::
   Einer der Hauptvorteile des MOS Common-Source-Verstärkers gegenüber dem
   BJT Common-Emitter-Verstärker ist eine extrem hohe Eingangsimpedanz bei gleichzeitig
   rauscharmem Ausgang, was ihn ideal für den Einsatz in Verstärkerschaltungen mit sehr
   kleinen Eingangssignalen macht. Die Eingangsimpedanz ist faktisch nur von der
   Eingangskapazität :math:`C_{iss}`, den Widerständen :math:`R_1` und :math:`R_2`,
   die im Bereich von :math:`M\Omega` ausgewählt werden können, abhängig.

.. figure:: img/ Activity_27_Fig_01.png
   :name: 27_fig_01

   Common-Source-Verstärker-Konfiguration

.. warning::
   Die Berechnung und das Design eines Common Source Verstärkers ist nicht einfach.
   Das Design eines herkömmlichen Source-Verstärkers hängt weitgehend vom gewählten
   Transistor (dessen Parametern), dem gewünschten Frequenzbereich und der Endverstärkung ab.
   In der Praxis beeinflussen viele Faktoren wie die Eingangskapazität das Schaltungsverhalten,
   während diese Faktoren aus den verfügbaren Tutorials und der Theorie weitgehend
   ausgeschlossen sind. Für ein tieferes Verständnis der gängigen Quellverstärker werden die
   folgenden Links vorgeschlagen:
   
   - [1] `Wikipedia Common Source`_
   - [2] `Common Source Amplifier Tutorial 1`_
   - [3] `MIT Common Source Amplifier Lecture`_
   - [4] `Common Source Amplifier with Source Degeneration`_
   - [5] `Common Source Amplifier Tutorial 2`_
   - [6] `Transconductance`_ :math:`g_m`
   - [7] `Drain Output Resistance`_ :math:`r_o`

**Durch Vereinfachungen, die im Folgenden aufgeführt sind, kann die ungefähre
Verstärkung für einen Common-Source-Verstärker** (:numref:`27_fig_01`),
**wie in Gleichung** (:eq:`27_eq_2`) **dargestellt**, beschrieben werden.


1. Vernachlässigung des Spannungsabfalls am :math:`C_1` - Kondensator.
   Wir können den Spannungsabfall am Kondensator :math:`C_1` vernachlässigen,
   wenn :math:`1/(2\pi f C_1) <<< R_G` .
   
2. Vernachlässigung der :math:`C_S` - Impedanz. Wenn der :math:`C_S` - Wert im Bereich
   :math:`C_S >> 10\mu F` ausgewählt wird, ist seine Impedanz vernachlässigbar und geht für
   alle AC-Signale effektiv auf :math:`0\,\Omega`.
   
3. Drain-Ausgangswiderstand geht im Falle von :math:`\lambda = 0` gegen
   Unendlich :math:`r_o \to \infty`, und kann daher in
   Gleichung (1) vernachlässigt werden.
   
.. note::
   Transkonduktanz :math:`g_m` ist die Änderung des Drainstroms dividiert durch die
   geringe Änderung der Gate-/Source-Spannung bei konstanter Drain-/Source-Spannung.
   Typische Werte von :math:`g_m` für einen Kleinsignal-Feldeffekttransistor
   sind :math:`1` bis :math:`30\,mS` (Millisiemens).
	 
.. math::
   :label: 27_eq_1
	   
   A_v \approx -\frac{R_1 || R_2 || Z_{iss}}{R_G + (R_1 || R_2 || Z_{iss})} g_m (r_o || R_L || R_S) 
   

mit der Vernachlässigung des :math:`r_o` (:math:`r_o \to \infty`), erhalten wir:

.. math::
   :label: 27_eq_2
   
   A_v \approx -\frac{R_1 || R_2 || Z_{iss}}{R_G + (R_1 || R_2 || Z_{iss})} g_m  (R_L || R_S)
   

wobei :math:`Z_{iss}` die Gate-Impedanz aufgrund der
Eingangskapazität :math:`C_{iss}` (Common-Source-Schaltung
Eingangskapazität) des MOS-Transistors ist.

.. math::
   :label: 27_eq_3

   Z_{iss} = \frac{1}{2 \pi f C_{iss}}

**Wenn wir annehmen, dass die Transistorparameter** :math:`C_{iss}` **und** :math:`g_m`
**konstante Werte aus** :eq:`27_eq_2` **sind, folgt daraus, dass der Gewinn des
Common-Source-Verstärkers abhängig von den peripheren Widerständen**
:math:`R_1, R_2, R_G, R_L, R_S` **und der Eingangssignalfrequenz** :math:`f`.


**Wenn** :math:`C_{iss}` **auf Null geht, dann hängt die
Verstärkung nur von den peripheren Widerständen** :math:`R_1, R_2,
R_G, R_L, R_S` **und Transistor-Transkonduktanz** :math:`g_m` **ab**.


.. note::
   In der Praxis ist die Eingangskapazität der Common-Source-Schaltung
   :math:`C_{iss}` nicht Null und kann von der Gatespannung und dem Verstärkungsfaktor
   abhängig sein. Hier werden wir annehmen, dass der :math:`C_{iss}` ein
   konstanter Wert ist. :math:`C_{iss}` und :math:`g_m` Werte sind üblicherweise im Datenblatt des
   Transistors angegeben.

Materialien
-----------

- Red Pitaya STEMlab
- 4x :math:`1\,M\Omega` Widerstand
- 2x :math:`470\,Omega` Widerstand
- 1x :math:`100\,k\Omega` Trimer
- 2x :math:`10\,\mu F` Kondensator
- 1x :math:`1\,\mu F` Kondensator
- 1x kleinsignal NOMS-Transistor (ZVN211_)
- 1x lötfreies Steckbrett

.. _ZVN211: http://www.redrok.com/MOSFET_ZVN2110A_100V_320mA_4O_Vth2.4_TO-92_ELine.pdf


Verfahren
---------

Angenommen, wir möchten einen Verstärker mit der Verstärkung
:math:`A_v = 5` und :math:`I_L = 5mA` mit dem Transistor ZVN211_ und
der Spannungsversorgung :math:`V_ {DD} = 5V` konstruiren.
Nach den obigen Berechnungen und Richtwerten haben wir den in
:numref:`27_fig_02` gezeigten Common-Source-Verstärker aufgebaut.

Der erste Schritt ist die Einstellung des **DC-Arbeitspunkt** durch die
Wahl der Spannungen über :math:`R_L`, :math:`R_S` und :math:`M_1` .

.. math::
   :label: 27_eq_4
      
   V_{R_L} + V_{DS} + V_{R_S} = V_{CC}

   
Wenn wir das Verhältnis von 1/3 der Spannungen auf :math:`R_L`,
:math:`R_D` und :math:`M_1` berücksichtigen, erhalten wir folgendes:
      
.. math::
   :label: 27_eq_5
      
   1,5 V + 2,0 V + 1,5 V = 5 V

:math:`V_{DS}` ist die Spannung über :math:`M_1` im Sättigungszustand.
Aus dem Sollwert für :math:`I_L` können wir :math:`R_L` berechnen als:

.. math::
   :label: 27_eq_6
      
   R_L = \frac{V_{R_L}}{I_L} = \frac{1,5\,V}{5\,mA} = 300\,\Omega


Nach einem Spannungsabfall von :math:`1/3 V_{DD}` über :math:`R_L`,
:math:`R_D` und :math:`M_1`, setzen wir :math:`R_S = R_L`.
      
.. note::

   Aufgrund der Verfügbarkeit wurde ein :math:`R_S = R_L = 470\,\Omega` Widerstand gewählt.
	 

Um die :math:`V_{GS}` -Spannung des MOS-Transistors für den
selbstvorbelasteten DC-Arbeitspunkt einzustellen, wird der
Spannungsteiler :math:`\frac{R_1}{R_2}` so gewählt, dass
:math:`V_G` oberhalb des Spannungswertes :math:`V_{TH} + V_S`
(bei DC-Betrieb) eingestellt wird.
      
.. math::
   :label: 27_eq_7

   V_G > (V_{TH} + V_{S}) > (2,0\,V + 1,6\,V) > 3,6\,V


:math:`2,0\,V` ist die Schwellenspannung von ZVN211_, :math:`1,6\,V` ist die Gleichspannung über :math:`R_S`.


.. math::
   :label: 27_eq_8
	   
   V_G = \frac{R_2}{R_1 + R_2} V_{DD}

   
Für die ausgewählte Spannung :math:`V_G = 3.7\,V` und  den Widerstand :math:`R_1 = 1\,M \Omega`
erhalten wir (nächstmöglichet Wert) für :math:`R_2 = 3\,M \Omega`.

.. figure:: img/ Activity_27_Fig_02.png
   :name: 27_fig_02
   :align: center

   Gemeinsamer Quellverstärker mit Komponentenwerten

.. note::
   Für Verstärker aus :numref:`27_fig_02` und Eingangssignalfrequenz von :math:`10\,kHz` können
   wir die Spannungsverstärkung mit :eq:`27_eq_2` berechnen. Für ZVN211_
   nehmen wir :math:`g_m = 25\,mS` und :math:`C_{iss} = 100\,pF` an.

   .. math::
	      
      R_1 || R_2 || Z_{iss} = 1 / \bigg( \frac{1}{R_1}+\frac{1}{R_2}+\frac{1}{Z_{iss}}
      = \frac{1}{R_1}+\frac{1}{R_2} + 2 \pi f C_{iss} \bigg)

     .

      = 1 / \bigg( \frac{1}{1 \times 10^6}+\frac{1}{3 \times 10^6} + 2 \cdot \pi \cdot 10 \times
      10^3  \cdot 100 \times 10^{-12} \bigg) = 131 k \Omega

     .

     R_L || R_S = \frac{R_S R_L}{R_S + R_L} = \frac{470 \cdot 470}{470 + 470} = 235 \Omega

     .
     
     \text{ setzen Sie den Trimmer } R_G  \text{ auf }  50\,k \Omega \text{ und Sie bekommen: }  

     .
     
     A_v \approx - \frac{131 k \Omega } {50 k \Omega + 131 k \Omega} \cdot 25 \times 10^{-3} \frac{1}{\Omega} \cdot  235\Omega  

     .
    
     A_v \approx - 4.2


     
1. Bauen Sie die Schaltung aus :numref:`27_fig_02` auf dem Steckbrett auf.
   
   .. figure:: img/ Activity_27_Fig_03.png
      :name: 27_fig_03
      :align: center

      Common Source Verstärker auf dem Steckbrett
      

2. Starten Sie die Anwendung Oszilloskop & Signalgenerator
   
3. Stellen Sie im Menü OUT1-Einstellungen Amplitudenwert auf :math:`0,1\,V`,
   DC-Offset auf :math:`0\,V` und Frequenz auf :math:`10\,kHz` ein, um die
   Eingangsspannung anzulegen. Wählen Sie im Wellenformmenü SINE,
   Deaktivieren Sie den SHOW-Button und wählen Sie Enable.
   
4. Stellen Sie sicher, dass IN1 und IN2 :math:`V/div` am linken unteren
   Bildschirmrand auf :math:`200\,mV/div` eingestellt sind (Sie können :math:`V/div`
   einstellen, indem Sie den gewünschten Kanal auswählen und die
   vertikalen +/- Regler verwenden)
   
5. Setzen Sie :math:`t/div` Wert auf :math:`20\,us/div` (Sie können :math:`t/div` mit
   horizontalen +/- Reglern einstellen)
   
6. In dem Trigger-Menu wählen Sie bitte Einstellungen
   und stellen diese auf NORMAL
   
7. Wählen Sie im Messmenü P2P für IN1 und IN2

   .. figure:: img/ Activity_27_Fig_04.png
      :name: 27_fig_04

      Gemeinsame Quellenverstärker-Messungen

In :numref:`27_fig_04` sind die Messungen des Common-Source-Verstärkers dargestellt.
Aus den P2P-Messungen können wir den erzielten Gewinn berechnen. Dieser liegt bei :math:`A \approx 4` .
Warum ist gitb es eine Differenz zwischen berechneter und gemessener Verstärkung?
Dies liegt an der Eingangskapazität, die wir als :math:`100\,pF` angenommen haben.
In Wirklichkeit kann Sie einen anderen Wert annehmen. Auch Werte anderer
Komponenten haben bestimmte Toleranzen oder können mit einem bestimmtem Wert nicht annehmen.



8. Um den Einfluss der Eingangssignalfrequenz auf den verstärkungsfaktor zu sehen,
   stellen Sie die OUT1-Frequenz auf :math:`5\,kHz` ein
   und messen Sie den Gewinn des Verstärkers.
   

.. figure:: img/ Activity_27_Fig_05.png
   :name: 27_fig_05
   :align: center

   Gemeinsame Quellenverstärkung bei :math:`5\,kHz` Frequenz von :math:`V_{in}`
	 

.. note::
   Wir könnten :math:`1\,M\Omega` Widerstand in Reihe mit MOSFET-Gate-Eingang schalten.
   Dies würde den Einfluss der parasitären Kapazität verringern und eine
   hohe Eingangsimpedanz, unabhängig von der Eingangssignalfrequenz ermöglichen.
   Wie Sie aus der :eq:`27_eq_2` ersehen können, wird bei Zufügen eines :math:`1\,M\Omega` Widerstandes
   der Ziss "konstant" und wirdbei hoher Frequenz größer, wodurch der
   Eingangsteiler RG/R2 weniger beeinflusst wird.
   Die Eingangsimpedanz würde sich erhöhen:

   .. math::

      Z_{iss} = 1\,M\Omega + \frac {1}{2 \pi f C_{iss}}

      
   und :math:`Z_{iss}` -Kapazität beeinflussen 

   
   .. math::
 
      \frac{1}{2 \pi f C_{iss}}

      
   hätte viel weniger Einfluss auf die Verstärkung. D.h. die Frequenz
   des Eingangssignals hätte weniger Einfluss auf den Gewinn des
   Verstärkers.
   

   
Fragen
------

1. Versuchen Sie, :math:`1\,M\Omega` -Widerstand in Reihe mit Transistor-Gate-Pin hinzuzufügen.
   Messen Sie den Gewinn des Verstärkers. Was passiert, wenn die Frequenz
   OUT1 geändert wird?
   
2. Versuchen Sie den Wert von :math:`R_{G_{pot}}` zu ändern und
   beobachten Sie die Veränderung der Verstärkung?
   
3. Versuchen Sie zu :math:`R_1` und :math:`R_2` auf :math:`100k \ Omega`
   und :math:`300k \ Omega` zu ändern. Was ist die Verstärkungsabhängigkeit von der
   :math:`V_{in}` -Frequenz??
