Messung eines Lautsprecherimpedanzprofils
##################################################

Zielsetzung
__________

Das Ziel dieses Experiments ist es, das Impedanzprofil und die Resonanzfrequenz eines Permanentmagnet-Lautsprechers zu messen.

Anmerkungen
_______

..hardware: http://redpitaya.readthedocs.io/en/latest/index.html
.. _Impedance: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _analyzer: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _HERE: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn Sie sich auf die Verbindungen zur Red Pitaya STEMlab-Board-Hardware beziehen.
Impedance_analysator_ Anwendung wird verwendet, um RLC-Schaltung impedane zu messen :math:`Z (f)`. ** Hier verwenden wir die Impedanzanalysator-Anwendung ohne LCR-Zähler-Frontend wie beschrieben ** HIER_.
Die Impedanzanalysator-Anwendung ermöglicht Messungen von Impedanz, Phase und anderen Parametern des ausgewählten DUT (Device Under Test). Messungen können im Frequenz-Sweep-Modus mit 1 Hz Frequenzauflösung oder im Sweep-Modus Messungen mit der gewünschten Anzahl von Messungen bei konstanter Frequenz durchgeführt werden. Der wählbare Frequenzbereich reicht von 1 Hz bis 60 MHz, obwohl der empfohlene Frequenzbereich bis zu 1 MHz beträgt. Der Impedanzbereich reicht von 0,1 Ohm bis 10 MOhm. Wenn Sie die Impedanzanalysatoranwendung mit dem LCR-Erweiterungsmodul verwenden, setzen Sie 0 in das Shunt-Widerstandsfeld ein.

Hintergrund
____________

Die wichtigste elektrische Eigenschaft eines dynamischen Lautsprechers ist seine elektrische Impedanz als Funktion der Frequenz. Es kann visualisiert werden, indem man es als Kurve aufzeichnet, die Impedanzkurve genannt wird.
Der häufigste Typ von Lautsprecher ist ein elektromechanischer Wandler, der eine Schwingspule verwendet, die mit einer Membran oder einem Konus verbunden ist. Die Schwingspule in Schwingspulenlautsprechern ist in einem von einem Permanentmagneten bereitgestellten Magnetfeld aufgehängt. Wenn elektrischer Strom durch die Schwingspule von einem Audioverstärker fließt, reagiert das durch den Strom in der Spule erzeugte elektromagnetische Feld gegen das feste Feld des Permanentmagneten und bewegt die Schwingspule (auch der Kegel). Wechselstrom wird den Kegel hin und her bewegen. Die Bewegung des Kegels vibriert die Luft, die den Klang erzeugt.

Das bewegliche System des Lautsprechers, einschließlich des Konus, der Kegelaufhängung, der Spinne und der Schwingspule, hat eine gewisse Masse und Nachgiebigkeit. Dies wird am häufigsten als einfache Masse modelliert, die an einer Feder aufgehängt ist, die eine bestimmte Resonanzfrequenz aufweist, bei der das System am freiesten schwingt.

Diese Frequenz ist als "Freiraumresonanz" des Lautsprechers bekannt und wird bezeichnet durch :math:`F_S`. Da bei dieser Frequenz die Schwingspule mit der maximalen Spitze-zu-Spitze-Amplitude und Geschwindigkeit schwingt, ist auch die durch die Spulenbewegung in einem Magnetfeld erzeugte Gegen-EMK maximal. Dies bewirkt, dass die effektive elektrische Impedanz des Lautsprechers bei :math:`F_S`, bekannt als
 :math:`F_ {max}`. Für Frequenzen knapp unterhalb der Resonanz steigt die Impedanz schnell an, wenn sich die Frequenz nähert :math:`F_S` und ist induktiv in der Natur. Bei der Resonanz ist die Impedanz rein ohmisch und darüber hinaus, wenn die Impedanz abnimmt, sieht sie kapazitiv aus. Die Impedanz erreicht einen minimalen Wert :math:`Z_ {min}`, bei einer Frequenz, bei der das Verhalten über einen Bereich von Frequenzen größtenteils (aber nicht perfekt) resistiv ist. Die Nenn- oder Nennimpedanz eines Sprechers, :math:`Z_ {nom}`, wird davon abgeleitet :math:`Z_ {min}` value.

Die Kenntnis der Resonanzfrequenz und der minimalen und maximalen Impedanzen ist wichtig, wenn Cross-Over-Filter-Netzwerke für mehrere Treiberlautsprecher und das physische Gehäuse, in dem die Lautsprecher eingebaut sind, entworfen werden.

Lautsprecherimpedanzmodell
____________________________

Um Ihnen zu helfen, die Messungen zu verstehen, die Sie machen werden, ist in Abbildung 1 ein vereinfachtes elektrisches Modell eines Lautsprechers dargestellt.


.. figure:: img/ Activity_12_Fig_1.png

Abbildung 1: Lautsprecherimpedanzmodell

Die Schaltung in Abbildung 1 hat einen Gleichstromwiderstand, der in Reihe mit einem verlustbehafteten Parallelschwingkreis geschaltet ist, bestehend aus :math:`L`,: math:` R` und :math:`C`, der die dynamische Impedanz des Lautsprecher über den Frequenzbereich von Interesse.

- :math:`R_ {dc}` ist der Gleichstromwiderstand des Lautsprechers, gemessen mit einem DC Ohmmeter. Der DC-Widerstand wird in einem Lautsprecher- / Subwoofer-Datenblatt oft als "math:` DCR "bezeichnet. Die DC-Widerstandsmessung ist normalerweise kleiner als die Nennimpedanz des Treibers :math:`Z_ {nom}`.  :math:`R_ {dc}` ist normalerweise kleiner als die spezifizierte Lautsprecherimpedanz und der unerfahrene Lautsprecherenthusiast kann befürchten, dass der Treiberverstärker überlastet wird. Da jedoch die Induktivität: math: "L" eines Lautsprechers mit einer Zunahme der Frequenz zunimmt, ist es unwahrscheinlich, dass der Treiberverstärker tatsächlich den Gleichstromwiderstand als seine Last betrachtet.

- :math:`L` ist die Schwingspuleninduktivität, die normalerweise in MilliHerren gemessen wird: math:` mH`. Üblicherweise misst der Industriestandard die Schwingspuleninduktivität bei :math:`1kHz`. Wenn sich die Frequenzen erhöhen :math:`0Hz`, steigt die Impedanz über den Wert: math:` R_ {dc} `. Dies liegt daran, dass die Schwingspule als ein Induktor wirkt. Folglich ist die Gesamtimpedanz eines Lautsprechers keine konstante Impedanz, sondern kann als ein dynamisches Profil dargestellt werden, das sich mit der Eingangsfrequenz ändert, wie wir sehen werden, wenn wir Messungen vornehmen. Maximale Impedanz, :math:`Z_ {max}`, des Lautsprechers tritt bei der Resonanzfrequenz auf, :math:`F_s`, des Lautsprechers.

- :math:`F_s` ist die Resonanzfrequenz eines Lautsprechers. Die Impedanz eines Lautsprechers ist maximal bei :math:`Z_s`. Die Resonanzfrequenz ist der Punkt, an dem sich die Gesamtmasse der beweglichen Teile des Lautsprechers mit der Kraft der Lautsprechersuspension bei Bewegung ausgleicht. Die Resonanzfrequenzinformation ist wichtig, um zu verhindern, dass ein Gehäuse klingelt. Im Allgemeinen sind die Masse der beweglichen Teile und die Steifigkeit der Lautsprecherfederung die Schlüsselelemente, die die Resonanzfrequenz beeinflussen. Ein belüftetes Gehäuse (Bassreflex) ist abgestimmt auf :math:`F_s`, so dass die beiden im Einklang arbeiten. In der Regel ist ein Lautsprecher mit einem niedrigeren :math:`F_s` besser für die Wiedergabe mit niedriger Frequenz als ein Sprecher mit einem höheren: math:` F_s`.

-: math: "R" steht für den mechanischen Widerstand der Federungsverluste eines Fahrers.

Materialien
__________

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10
- Widerstand - :math:`R_ {shunt}`: 10 Ω
- Lautsprecher, ist es am besten, wenn der Lautsprecher mit einem Konusdurchmesser größer als 10 cm ist, so dass er eine relativ niedrige Resonanzfrequenz hat.

Verfahren
__________

1. Bauen Sie zuerst die in Abbildung 1 und Abbildung 2 gezeigte Schaltung ein. Der Lautsprecher kann sich in einem Gehäuse befinden oder nicht.

.. figure:: img/ Activity_12_Fig_2.png

Abbildung 2: Lautsprecheranschlüsse

.. figure:: img/ Activity_12_Fig_3.png

Abbildung 3: STEMlab mit Shunt-Widerstand Impedanzanalysator und Lautsprecher


2. Starten Sie die Anwendung Impedanzanalysator.

.. note::
    Der Impedanzanalysator ist eine Gemeinschaftsanwendung und muss vom Application Marketplace (Basar) heruntergeladen werden.
    Klicken Sie auf Application marketplace icon und wählen Sie Install for Impedance analyzer.

3. Starten Sie den Impedanzanalysator und:
    - unter ** Menü Messeinstellungen ** Anzahl der Schritte einstellen: 30
    - unter ** Measurement settings menu ** set :math:`R_ {shunt}` value zu :math:`10 \ Omega`
    - unter ** Frequenz-Sweep ** Startfrequenz auf 10 Hz und Endfrequenz auf 10 kHz einstellen
    - Wählen Sie ** Messung starten **

.. figure:: img/ Activity_12_Fig_4.png

Abbildung 4: Grafik der Impedanz der Lautsprecherimpedanz, die mit der Anwendung des Impedanzanalysators aufgenommen wurde

4.Plot mesured Phase
    - unter ** Grafikeinstellungen ** für ** Y-Achse ** wählen ** P [Grad] **

.. figure:: img/ Activity_12_Fig_5.png

Abbildung 5: Grafik der Lautsprecherimpedanzphase, die mit der Anwendung des Impedanzanalysators aufgenommen wurde

.. note::
     Die Frequenz, bei der dies auftritt ** (Phase = 0) ** wird als Resonanzfrequenz bezeichnet.

Wie im Lautsprechermodell (Abbildung 1) gezeigt Widerstand :math:`R 'repräsentieren den mechanischen Widerstand eines Fahrers Federungsverluste.
Um einen Effekt dieses modellierten Widerstandes zu sehen :math:`R` flipover Lautsprecher so, dass seine Membran zur Arbeitsbank zeigt. Damit werden wir uns verändern
akustisch-mechanische Umgebung des Lautsprechers, die die Lautsprecherimpedanz beeinflusst.

5. Flipover-Lautsprecher wie in Abbildung 6 gezeigt und Impedanzmessungen wiederholen

.. figure:: img/ Activity_12_Fig_6.png

Abbildung 6: Lautsprecher in unterschiedlicher akustisch-mechanischer Umgebung

Wie wir aus Abbildung 7 sehen können, ist die Impedanz des Lautsprechers jetzt anders und der Effekt von
akustomechanische Umgebung ist deutlich sichtbar.

.. figure:: img/ Activity_12_Fig_7.png

Abbildung 7: Lautsprecherimpedanz in verschiedenen akustisch-mechanischen Umgebungen



















































































































