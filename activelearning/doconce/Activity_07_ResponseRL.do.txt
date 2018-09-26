Transient Response einer RL-Schaltung
#####################################

Zielsetzung
___________

Das Ziel dieser Labortätigkeit ist es, das transiente Verhalten von Induktionsschaltungen mit einer RL-Konfiguration der Serie zu untersuchen und das Konzept der Zeitkonstante zu verstehen.

Notizen
_______

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch, wenn es um die Verbindungen zur Red Pitaya STEMlab-Board Hardware_ geht.
Die Oszilloskop- und Signalgeneratoranwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet. 

Hintergrund
___________

Diese Labortätigkeit ist ähnlich wie die RC Lab Aktivität 5, nur dass der Kondensator durch einen Induktor ersetzt wird. In diesem Experiment wenden Sie eine rechteckige Wellenform auf die RL-Schaltung an, um das transiente Verhalten der Schaltung zu analysieren. Die Impulsbreite in Bezug auf die Zeitkonstante der Schaltung bestimmt, wie sie von der RL-Schaltung beeinflusst wird. 

Zeitkonstante (t): Es ist ein Maß für die Zeit, die für bestimmte Änderungen von Spannungen und Strömen in RC- und RL-Kreisen benötigt wird. Im Allgemeinen, wenn die verstrichene Zeit fünf Zeitkonstanten (5t) nach dem Schalten überschreitet, haben die Ströme und Spannungen ihren Endwert erreicht, der auch als stationäre Reaktion bezeichnet wird. 
 
Die Zeitkonstante einer RL-Schaltung ist die äquivalente Induktivität dividiert durch den Thévenin-Widerstand, bezogen auf die Anschlüsse des äquivalenten Induktors. 

.. math::
	f=\frac{L}{R}{R} 



Ein Impuls ist eine Spannung oder ein Strom, der von einem Niveau zum anderen und wieder zurück wechselt. Wenn die hohe Zeit einer Wellenform gleich ihrer niedrigen Zeit ist, wird sie als Rechteckwelle bezeichnet. Die Länge eines jeden Zyklus einer Impulsfolge ist seine Periode (T). Die Impulsbreite (tp) einer idealen Rechteckwelle entspricht der Hälfte der Zeitspanne. 

Das Verhältnis zwischen Impulsbreite und Frequenz für die Rechteckwelle wird durch: 
 
.. math::

	f=\frac{1}{2t_p} 
	

.. image:: img/Activity_07_Fig_01.png

Abbildung 1: Serien-RL-Schaltung

In einem R-L-Kreis nimmt die Spannung über dem Induktor mit der Zeit ab, während in dem RC-Kreis die Spannung über dem Kondensator mit der Zeit zunimmt. Somit hat der Strom in einer RL-Schaltung die gleiche Form wie die Spannung in einer RC-Schaltung: Sie steigen beide exponentiell auf ihren Endwert an.

Der Ausdruck für den Strom im Induktor wird durch:

.. math::
	
	I_L(t) = RV( 1 - e^{-\frac{R}{L}t} ) ; t >= 0

wobei V die an die Schaltung angelegte Quellspannung für t = 0 ist, die Ansprechkurve steigt und ist in Figur 2 dargestellt. 

.. image:: img/Activity_07_Fig_02.png

Abbildung 2: Der Strom im Induktor steigt in einem Serien-RL-Kreis an.

(Zeitachse normiert um t) 

Der Ausdruck für den Stromabfall über den Induktor wird durch: 
 
.. math:: 
 
	I_L(t) = I_0 e^{- \frac{R}{L}t} ; t >= 0 

wo, I\ :sub:`0`\ ist der Anfangsstrom, der im Induktor bei t = 0 gespeichert ist.  
L/R = t ist die Zeitkonstante. 
 
Die Reaktionskurve ist eine abklingende Exponentialfunktion und ist in Abbildung 3 dargestellt. 

.. image:: img/Activity_07_Fig_03.png

Da es nicht möglich ist, den Strom durch den Induktor direkt zu messen (Strom, der von der Antriebsquelle OUT1 geliefert wird), werden wir die Ausgangsspannung über den Widerstand in Reihe mit dem Induktor messen. Die Wellenform des Widerstandes wird die gleiche Form wie der Induktorstrom haben, da wir aus dem ohmschen Gesetz wissen, dass Strom und Spannung durch den Widerstand mit V :sub:`R` = I :sub:`R` * R verbunden sind. Unsere Schaltung hat zwei Elemente (Widerstand und Induktor) in Reihe, was bedeutet, dass der gleiche Strom durch beide Komponenten fließt I :sub:`circuit` = I :sub:`L` = I :sub:`R` 
Wir wissen, dass das Signal am Eingang IN2 eine Spannung über dem Widerstand V :sub:`R`, das ist der Strom durch den Induktor multipliziert mit dem Widerstand R.

.. math::
	
	IN2 = R \cdot I_L 

Daraus folgt, dass wir bei der Beobachtung des Signals IN2 den Strom durch den Induktor beobachten, und das Einzige, was wir beachten müssen, ist der Skalierungsfaktor - Widerstand R.
     
Aus den Wellenformen des Scopes sollten wir die Zeitkonstante t messen können, die gleich t = L / R :sub:`total` sein sollte.
Hier ist R :sub:`total` der Gesamtwiderstand und kann aus R :sub:`total` = R :sub:`Induktivität` + R berechnet werden.
Die R-Induktivität ist der Messwert des Induktionswiderstandes und kann mit einem Multimeter vor der Durchführung des Experiments gemessen werden. (Messen Sie die R-Induktivität genauso, wie Sie den normalen Widerstand messen würden.)


Materialien
___________

Red Pitaya STEMlab 125-14 oder STEMlab 125-10 

Widerstand 220 Ω

Induktor 20 mH (2x10 mH in Serie)

Vorgehensweise
______________

1. Messen Sie den kombinierten Induktor- und Widerstandswiderstand R \ :sub:`total` \ mit einem Multimeter.




.. figure:: img/Activity_07_Fig_04.png

2. Richten Sie die in Abbildung 5 dargestellte Schaltung auf Ihrer lötfreien Leiterplatte mit den Bauteilwerten R :sub:`1` = 220 Ω und L :sub:`1` = 20mH ein. 
-Schließen Sie die Sonden des Oszilloskops und des Signalgenerators wie in Abbildung 5 dargestellt an.
-Stellen Sie die Oszilloskop-Dämpfung auf x1 ein.

Abbildung 5: Versuchsaufbau 

Starten Sie die Anwendung Oszilloskop & Signalgenerator.


3. Im Einstellungsmenü OUT1 den DC-Offsetwert auf 0,5 und den Amplitudenwert auf 0,5V einstellen, um eine 1Vp-p Rechteckwelle mit einer Zentrierung von 0,5 V als Eingangsspannung für die Schaltung anzulegen. Wählen Sie aus dem Wellenform-Menü SQUARE-Signal, deaktivieren Sie die SHOW-Taste und wählen Sie enable. 
Stellen Sie sicher, dass IN1 V/div und IN2 V/div beide auf 200mV/div eingestellt sind (Sie können V/div einstellen, indem Sie den gewünschten Kanal auswählen und vertikale +/- Regler verwenden).
Im Einstellungsmenü IN1 und IN2 den Wert des vertikalen Versatzes auf -500mV einstellen. 
Für die stabile Aufnahme stellen Sie den Triggerpegel im TRIGGER-Menü auf 0,5V und wählen Sie NORMAL.

Berechnen Sie die angewandte Frequenz nach Gleichung (2) für tp = 5t . Im Menü OUT1 Einstellungen die Frequenz entsprechend der Berechnung einstellen.

Stellen Sie die Zeitbasis mit der horizontalen +/- Steuerung so ein, dass Sie etwa zwei Zyklen der Rechteckwelle auf dem Anzeigegitter haben. 


4. Die VR (IN2) Wellenform hat die gleiche Form wie die IL(t) Wellenform. Messen Sie aus VR die Zeitkonstante t und vergleichen Sie sie mit derjenigen, die Sie aus L/R :sub:`total` berechnet haben. 

.. hint:: 
	
	Bei der Messung des RC-Transienteneffekts haben wir den Cursor verwendet, um 0,63*Vc zu finden, hier interessieren wir uns für den Strom I :sub:`L` = IN2/R und nicht für die Spannung.
	
	Gemäß der Abbildung 3 sollten Sie den Cursor Y1 auf den Maximalwert von IN2 und den Cursor Y2 auf den Wert 0,37*IN2 stellen. 
	Die Cursor X1 und X2 auf die Kreuzungspunkte einstellen und die Zeitkonstante messen.


Zur Bestimmung der Zeitkonstante verwenden Sie die Option "CURSOR".
Öffnen Sie das Menü CURSOR und wählen Sie alle vier Cursor aus: X1, X2, Y1, Y2. 
Für den Y-Cursor wählen Sie IN2 für die Quelle.
Steuern/Bewegen von Cursorn mit einem Linksklick+Maussteuerung auf der Cursor-Markierung (ein Pfeil am Ende der Cursorlinie).

Um die Cursor genauer einzustellen, stellen Sie die Zeitbasis ein, bis Sie etwa eine oder die Hälfte des Zyklus der Rechteckwelle auf dem Anzeigegitter haben. 


5. Beobachten Sie die Reaktion der Schaltung und notieren Sie die Ergebnisse erneut für tp = 25t und tp = 0,5t.

Fragen zu
_________

- Fügen Sie Diagramme von IL und VR für verschiedene tp-Werte hinzu, die oben in Verfahren 4 beschrieben sind.
- Ein Kondensator speichert die Ladung. Was denkst du, was ein Inductor speichert? Antworte kurz.
























































































































































