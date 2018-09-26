Transient Response der RC-Beschaltung
#####################################


Zielsetzung
___________

Das Ziel dieser Labortätigkeit ist es, das transiente Verhalten einer RC-Schaltung zu untersuchen und das Konzept der Zeitkonstante unter Verwendung von Pulswellenformen zu verstehen.

Notizen
_______

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab-Board Hardware_ geht. Die Oszilloskop- und Signalgeneratoranwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet. 


Hintergrund
___________

In dieser Labortätigkeit wenden Sie eine Pulswellenform auf die RC-Schaltung an, um das transiente Verhalten der Schaltung zu analysieren. Die Impulsbreite in Bezug auf die Zeitkonstante einer Schaltung bestimmt, wie sie von einer RC-Schaltung beeinflusst wird. 

Zeitkonstante (t): Ein Maß für die Zeit, die für bestimmte Änderungen von Spannungen und Strömen in RC- und RL-Kreisen benötigt wird. Im Allgemeinen, wenn die verstrichene Zeit fünf Zeitkonstanten (5t) nach dem Schalten überschreitet, haben die Ströme und Spannungen ihren Endwert erreicht, der auch als stationäre Reaktion bezeichnet wird. 

Die Zeitkonstante einer RC-Schaltung ist das Produkt aus Ersatzkapazität und Thévenin-Widerstand, bezogen auf die Anschlüsse des Ersatzkondensators 

.. math::
	
	t = R \cdot C 

Ein Impuls ist eine Spannung oder ein Strom, der von einem Niveau zum anderen und wieder zurück wechselt. Wenn die hohe Zeit einer Wellenform gleich ihrer niedrigen Zeit ist, wird sie als Rechteckwelle bezeichnet. Die Länge jedes Zyklus eines Impulses ist seine Periode (T). 

Die Impulsbreite (tp) einer idealen Rechteckwelle entspricht der Hälfte der Zeitspanne. 

Das Verhältnis zwischen Impulsbreite und Frequenz wird dann durch, 

.. math::
	
	f = \frac{1}{2t_p} 

.. image:: img/Activity_06_Fig_01.png

Abbildung 1: RC-Beschaltung der Serie.

Aus den Gesetzen Kirchhoffs lässt sich nachweisen, dass die Ladespannung V\ :sub:`C`\ (t) über dem Kondensator durch gegeben ist: 

.. math::	
	V_C (t) = V( 1- e^{- \frac{t}{RC}}) t >= 0 

wobei V die an die Schaltung angelegte Quellspannung für t = 0 ist, RC = t die Zeitkonstante ist. Die Ansprechkurve nimmt zu und ist in Abbildung 2 dargestellt. 

.. image:: img/Activity_06_Fig_02.png

Abbildung 2: Kondensatorladung für die RC-Beschaltung der Serie auf einen Schritt-Eingang mit Zeitachse normiert um t

Die Entladungsspannung für den Kondensator wird durch angegeben: 

.. math::

	V_C (t) = V_o e^{-\frac{t}{RC}} ;t >= 0 

Dabei ist V\ :sub:`0`\ die im Kondensator gespeicherte Anfangsspannung bei t = 0 und RC = t die Zeitkonstante. Die Reaktionskurve ist eine abnehmende Exponentialfunktion, wie in Abbildung 3 dargestellt. 

.. image:: img/Activity_06_Fig_03.png

Abbildung 3: Kondensatorentladung für die RC-Beschaltung der Serie RC

Materialien
___________

Red Pitaya STEMlab 125-14 oder STEMlab 125-10 

Widerstände: 
	2.2 KΩ, 
	10 KΩ

Kondensatoren: 
	1 µF, 
	0,01 µF 

Vorgehensweise
______________

1. Richten Sie die in Abbildung 4 dargestellte Schaltung auf Ihrer lötfreien Leiterplatte mit den Bauteilwerten R\ :sub:`1`\ = 2.2 KΩ und C\ :sub:`1`\ = 1 µF ein. 

	-Schließen Sie die Sonden des Oszilloskops und des Signalgenerators wie in Abbildung 5 dargestellt an.
	-Stellen Sie die Oszilloskop-Dämpfung auf x1 ein.

.. figure:: img/Activity_06_Fig_04.png

Abbildung 4. Breadboard-Diagramm der RC-Schaltung R\ :sub:`1`\ = 2.2 KΩ und C\ :sub:`1`\ = 1 µF. 


.. figure:: img/Activity_06_Fig_05.png

Abbildung 5. Breadboard RC-Schaltung R\ :sub:`1`\ = 2.2 KΩ und C\ :sub:`1`\ = 1 µF. 

Starten Sie die Anwendung Oszilloskop & Signalgenerator. 

2. Im Einstellungsmenü OUT1 den DC-Offsetwert auf 0,5 und den Amplitudenwert auf 0,5V einstellen, um eine 1Vp-p Rechteckwelle mit einer Zentrierung von 0,5 V als Eingangsspannung für die Schaltung anzulegen. Wählen Sie aus dem Wellenform-Menü SQUARE-Signal, deaktivieren Sie die SHOW-Taste und wählen Sie enable. 
Stellen Sie sicher, dass IN1 V/div und IN2 V/div beide auf 200mV/div eingestellt sind (Sie können V/div einstellen, indem Sie den gewünschten Kanal auswählen und vertikale +/- Regler verwenden).
Im Einstellungsmenü IN1 und IN2 den Wert des vertikalen Versatzes auf -500mV einstellen. 
Für die stabile Aufnahme stellen Sie den Triggerpegel im TRIGGER-Menü auf 0,5V und wählen Sie NORMAL.

3. Beobachten Sie das Verhalten der Schaltung in den folgenden drei Fällen und notieren Sie die Ergebnisse. 

a. Impulsbreite größer als 5t (z.B. 15t): Stellen Sie die Frequenz des Ausgangs OUT1 so ein, dass der Kondensator bei jedem Zyklus der Rechteckwelle genügend Zeit zum vollständigen Laden und Entladen hat. Lassen Sie also die Impulsbreite 15t betragen und stellen Sie die Frequenz nach Gleichung (2) ein. Der von Ihnen gefundene Wert sollte etwa 15 Hz betragen. 

note: Berechnen Sie die Frequenz von OUT1, so dass die Impulsbreite von OUT1 gleich der gewünschten ist. 
Wert von x*t durch Gleichung (2):

.. math::

	f_out = \frac{1}{2 \cdot x \cdot t} 

Zum Beispiel: Wenn wir die Impulsbreite Ihres OUT1-Quadratsignals gleich 5*t haben wollen. 
(t - Zeitkonstante des RC-Kreises t = R * C)

.. math::

	t = R \cdot C = 2.2E3 \cdot 1E-6 = 2.2E-3-3

.. math::

	f_out = \frac{1}{2 \cdot 5 \cdot 2.2E-3} = 45Hz
	

Bestimmen Sie die Zeitkonstante aus den auf dem Bildschirm angezeigten Wellenformen, wenn möglich. Wenn Sie die Zeitkonstante nicht ohne weiteres erhalten können, erläutern Sie mögliche Gründe. 

Zur Bestimmung der Zeitkonstante verwenden Sie die Option "CURSOR".
Öffnen Sie das Menü CURSOR und wählen Sie alle vier Cursor aus: X1, X2, Y1, Y1, Y2. 
Für den Y-Cursor wählen Sie IN2 für die Quelle.
Steuern/Bewegen von Cursorn mit einem Linksklick+Maussteuerung auf der Cursor-Markierung (ein Pfeil am Ende der Cursorlinie).



Stellen Sie die **Zeitbasis** mit dem **horizontalen +/-** Regler so ein, dass Sie etwa zwei Zyklen der Rechteckwelle auf dem Anzeigegitter haben. 

.. figure:: img/Activity_06_Fig_06.png

Abbildung 6. Oszilloskop-Schnittstelle und Signale IN1 und IN2 auf der RC-Beschaltung 

Um die Cursor genauer einzustellen, stellen Sie die Zeitbasis ein, bis Sie etwa eine oder die Hälfte des Zyklus der Rechteckwelle auf dem Anzeigegitter haben. 

.. figure:: img/Activity_06_Fig_07.png

Abbildung 7: Messung der Zeitkonstante t für OUT1 Impulsbreite >> 5t . 

Setzen Sie den Cursor wie in Abbildung 2 dargestellt, indem Sie die Deltawerte auslesen und die Zeitkonstante berechnen.


b. Impulsbreite = 5t: Stellen Sie die Frequenz von OUT1 so ein, dass die Impulsbreite = 5t (dies sollte etwa 45 Hz sein). Da die Impulsbreite 5t beträgt, sollte der Kondensator bei jedem Impulszyklus nur vollständig auf- und abgeladen werden können. Mit dem Cursor-Tool bestimmen t.

.. figure:: img/Activity_06_Fig_08.png

Abbildung 8: Messung der Zeitkonstante t für OUT1 Impulsbreite = 5t


c. Impulsbreite kleiner als 5t (z.B. 1t): In diesem Fall hat der Kondensator keine Zeit zum Aufladen, bevor er auf Entladung geschaltet wird, und umgekehrt. Die Impulsbreite soll in diesem Fall nur 1,0t betragen und die Frequenz entsprechend eingestellt werden (diese sollte ca. 240 Hz betragen). 

.. figure:: img/Activity_06_Fig_09.png

Abbildung 9: Messung der Zeitkonstante t für OUT1 Impulsbreite = 1t


4. Wiederholen Sie den Vorgang mit R\ :sub:`1`\ = 10 KΩ und C\ :sub:`1`\= 0,01 µF und notieren Sie die Messungen.
Fragen:

	1. Berechnen Sie die Zeitkonstante nach Gleichung (1) und vergleichen Sie sie mit dem Messwert aus 3a. Wiederholen Sie dies für einen anderen Satz von R- und C-Werten.

	2. Diskutieren Sie die Auswirkungen von Änderungen der Komponentenwerte.


















































































































































