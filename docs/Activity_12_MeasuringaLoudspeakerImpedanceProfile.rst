Messung eines Lautsprecherimpedanzprofils
#########################################

Zielsetzung
___________

Das Ziel dieses Experiments ist es, das Impedanzprofil und die Resonanzfrequenz eines Permanentmagnet-Lautsprechers zu messen.

Anmerkungen
___________

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/index.html
.. _Impedanz: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _analysators: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer
.. _HIER: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/marketplace/marketplace.html#impedance-analyzer

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab Board Hardware_ geht. Die Anwendung des Impedanz_ analysators_ dient zur Messung der RLC-Schaltungsimpedanz :math:`Z(f)`. Hier verwenden wir die Impedanzanalysatoranwendung ohne LCR-Meter-Frontend, wie HIER_ beschrieben. Die Anwendung Impedanzanalysator ermöglicht Messungen der Impedanz, Phase und anderer Parameter des ausgewählten Prüflings (Device Under Test). Messungen können im Frequenzsweep-Modus mit 1Hz Frequenzauflösung oder im Messsweep-Modus mit der gewünschten Anzahl von Messungen bei konstanter Frequenz durchgeführt werden. Der wählbare Frequenzbereich liegt zwischen 1Hz und 60MHz, obwohl der empfohlene Frequenzbereich bis zu 1MHz beträgt. Der Impedanzbereich liegt zwischen 0,1 Ohm und 10 Mohm. Wenn Sie die Impedanzanalysator-Anwendung mit dem LCR-Erweiterungsmodul verwenden, fügen Sie 0 in das Feld Nebenschlusswiderstand ein.

Hintergrund
___________

Die wichtigste elektrische Eigenschaft eines dynamischen Lautsprechers ist seine elektrische Impedanz in Abhängigkeit von der Frequenz. Es kann visualisiert werden, indem es als Diagramm, die Impedanzkurve genannt, dargestellt wird. Die gebräuchlichste Art von Lautsprechern ist ein elektromechanischer Wandler mit einer Schwingspule, die mit einer Membran oder einem Membrankonus verbunden ist. Die Schwingspule in Schwingspulenlautsprechern ist in einem Magnetfeld aufgehängt, das von einem Permanentmagneten erzeugt wird. Wenn elektrischer Strom durch die Schwingspule von einem Audioverstärker fließt, reagiert das durch den Strom in der Spule erzeugte elektromagnetische Feld gegen das Festfeld des Permanentmagneten und bewegt die Schwingspule (auch den Konus). Wechselstrom bewegt den Konus hin und her. Die Bewegung des Membrankonus vibriert die Luft, die den Klang erzeugt.

Das bewegliche System des Lautsprechers, einschließlich Konus, Kegelaufhängung, Spinne und Schwingspule, hat eine bestimmte Masse und Nachgiebigkeit. Dies wird am häufigsten als eine einfache Masse modelliert, die an einer Feder aufgehängt ist, die eine bestimmte Resonanzfrequenz hat, bei der das System am freisten schwingt.

Diese Frequenz wird als "Freiraumresonanz" des Lautsprechers bezeichnet und mit :math:`F_S` abgekürzt. Bei dieser Frequenz, da die Schwingspule mit der maximalen Spitze-Spitze-Amplitude und -Geschwindigkeit schwingt, ist auch der durch die Spulenbewegung in einem Magnetfeld erzeugte Gegenstrom maximal. Dadurch erreicht die effektive elektrische Impedanz des Lautsprechers bei :math:`F_S`, bekannt als :math:`F_{max}`, ihr Maximum. Bei Frequenzen knapp unterhalb der Resonanz steigt die Impedanz schnell an, wenn sich die Frequenz :math:`F_S` nähert und ist induktiv. Bei der Resonanz ist die Impedanz rein resistiv und darüber hinaus, wenn die Impedanz sinkt, wirkt sie kapazitiv. Die Impedanz erreicht bei einer bestimmten Frequenz einen Minimalwert, :math:`Z_{min}`, bei dem das Verhalten über einen bestimmten Frequenzbereich überwiegend (aber nicht perfekt) resistiv ist. Aus diesem :math:`Z_{min}` -Wert wird die Nominale- oder Nennimpedanz eines Lautsprechers, :math:`Z_{nom}`, abgeleitet.

Die Kenntnis der Resonanzfrequenz sowie der minimalen und maximalen Impedanzen ist wichtig, wenn es darum geht, Crossover-Filternetzwerke für mehrere Treiberlautsprecher und das physikalische Gehäuse, in dem die Lautsprecher montiert sind, zu entwickeln.

Lautsprecherimpedanzmodell
__________________________

Um Ihnen zu helfen, die Messungen zu verstehen, die Sie machen werden, ist in :numref:`12_fig_01` ein vereinfachtes elektrisches Modell eines Lautsprechers dargestellt.

.. _12_fig_01:
.. figure:: img/ Activity_12_Fig_01.png

	    Lautsprecherimpedanzmodell

Die Schaltung in :numref:`12_fig_01` hat einen Gleichstromwiderstand, der in Reihe mit einem verlustbehafteten Parallelschwingkreis geschaltet ist, bestehend aus :math:`L`, :math:`R` und :math:`C`, der die dynamische Impedanz des Lautsprecher über den interessierenden Frequenzbereich modelliert.

- :math:`R_ {dc}` ist der Gleichstromwiderstand des Lautsprechers, gemessen mit einem DC Ohmmeter.
  Der DC-Widerstand wird in einem Lautsprecher- / Subwoofer-Datenblatt oft als :math:`DCR` bezeichnet.
  Der gemessene Gleichstromwiderstand ist normalerweise kleiner als die Nennimpedanz des Treibers :math:`Z_ {nom}`.
  :math:`R_ {dc}` ist normalerweise kleiner als die spezifizierte Lautsprecherimpedanz und der unerfahrene Lautsprecherenthusiast kann befürchten, dass der Treiberverstärker überlastet wird. Da jedoch die Induktivität :math:`L` eines Lautsprechers mit der steigenden Frequenz zunimmt, ist es unwahrscheinlich, dass der Treiberverstärker tatsächlich den Gleichstromwiderstand als seine Last betrachtet.

- :math:`L` ist die Schwingspuleninduktivität, die üblicherweise in MilliHenries :math:`mH` gemessen wird. Typischerweise ist der Industriestandard die Messung der Schwingspuleninduktivität bei :math:`1kHz`. Wenn die Frequenzen über :math:`0Hz` ansteigen, steigt die Impedanz über den :math:`R_{DC}` -Wert. Der Grund dafür ist, dass die Schwingspule wie eine Induktivität wirkt. Folglich ist die Gesamtimpedanz eines Lautsprechers keine konstante Impedanz, sondern kann als dynamisches Profil dargestellt werden, das sich mit der Eingangsfrequenz ändert, wie wir bei Messungen sehen werden. Die maximale Impedanz, :math:`Z_{max}`, des Lautsprechers tritt bei der Resonanzfrequenz, :math:`F_s`, des Lautsprechers auf.

- :math:`F_s` ist die Resonanzfrequenz eines Lautsprechers. Die Impedanz eines Lautsprechers ist bei :math:`Z_s` maximal. Die Resonanzfrequenz ist der Punkt, an dem die Gesamtmasse der beweglichen Teile des Lautsprechers während der Bewegung mit der Kraft der Lautsprecheraufhängung ausgeglichen wird. Die Resonanzfrequenzinformation ist wichtig, um zu verhindern, dass ein Gehäuse klingelt. Im Allgemeinen sind die Masse der beweglichen Teile und die Starrheit der Lautsprecheraufhängung die Schlüsselelemente, die die Resonanzfrequenz beeinflussen. Ein belüftetes Gehäuse (Bassreflex) ist auf :math:`F_s` abgestimmt, so dass die beiden im Einklang arbeiten. In der Regel ist ein Lautsprecher mit einem niedrigeren :math:`F_s` für die Tieftonwiedergabe besser als ein Lautsprecher mit einem höheren :math:`F_s`.

- :math:`R` tellt die mechanischen Verlust der Treibersystems dar.

Materialien
___________

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10
- Widerstand - :math:`R_ {shunt}`: 10 :math:`\Omega`
- Lautsprecher, ist es am besten, wenn der Lautsprecher mit einem Konusdurchmesser größer als 10 cm ist,
  so dass er eine relativ niedrige Resonanzfrequenz hat.

Verfahren
_________

1. Bauen Sie zuerst die in :numref:`12_fig_01` und :numref:`12_fig_02` gezeigte Schaltung auf. Der Lautsprecher kann sich in einem Gehäuse befinden oder nicht.

.. _12_fig_02:
.. figure:: img/ Activity_12_Fig_02.png

	    Lautsprecheranschlüsse

.. _12_fig_03:
.. figure:: img/ Activity_12_Fig_03.png

	    STEMlab mit Shunt-Widerstand Impedanzanalysator und Lautsprecher


2. Starten Sie die Anwendung Impedanzanalysator.

.. note::
    Der Impedanzanalysator ist eine Gemeinschaftsanwendung und muss vom Application Marketplace (Basar) heruntergeladen werden. Klicken Sie auf Application marketplace icon und wählen Sie Install for Impedance analyzer.

3. Starten Sie den Impedanzanalysator und:
    - unter **Messeinstelungen** Anzahl der Schritte einstellen: 30
    - unter **Messeinstellungen** den :math:`R_ {shunt}` auf :math:`10 \ Omega` setzen
    - unter **Frequenz-Sweep** Startfrequenz auf 10 Hz und Endfrequenz auf 10 kHz einstellen
    - Wählen Sie **Messung Starten**

.. _12_fig_04:
.. figure:: img/ Activity_12_Fig_04.png

	    Grafik der Impedanz der Lautsprecherimpedanz, die mit der Anwendung des Impedanzanalysators aufgenommen wurde

4.Ploten der gemessenen Phase
    - unter **Grafikeinstellungen** für **Y-Achse** wählen Sie **P [deg]**

.. _12_fig_05:
.. figure:: img/ Activity_12_Fig_05.png

	    Grafik der Lautsprecherimpedanzphase, die mit der Anwendung des Impedanzanalysators aufgenommen wurde

.. note::
     Die Frequenz, bei der **(Phase = 0)** auftritt, wird als Resonanzfrequenz bezeichnet.

Wie im Lautsprecher-Modell (:numref:`12_fig_01`) dargestellt, stellt der Widerstand :math:`R` den mechanischen Verluste des Schwingsystems dar. Um einen Effekt dieses modellierten Widerstandes zu sehen, drehen Sie den Lautsprecher um,so dass seine Membran zur Werkbank zeigt. Damit werden wir die akustisch-mechanische Umgebung des Lautsprechers verändern, was sich auf die Lautsprecherimpedanz auswirkt.

5. Flipover-Lautsprecher wie in Abbildung 6 gezeigt und Impedanzmessungen wiederholen

.. _12_fig_06:   
.. figure:: img/ Activity_12_Fig_06.png

	    Lautsprecher in unterschiedlicher akustisch-mechanischer Umgebung

Wie wir aus :numref:`12_fig_07` sehen können, ist die Impedanz des Lautsprechers jetzt anders und der Effekt von
akustomechanische Umgebung ist deutlich sichtbar.

.. _12_fig_07:
.. figure:: img/ Activity_12_Fig_07.png

	    Lautsprecherimpedanz in verschiedenen akustisch-mechanischen Umgebungen



















































































































