Bandpassfilter
=================

Zielsetzung
---------

Das Ziel dieser Labortätigkeit ist es,: 

1. Konstruieren Sie einen Bandpassfilter, indem Sie einen Tiefpassfilter und einen Hochpassfilter kaskadieren. 

2. Erhalten Sie den Frequenzgang des Filters mit Hilfe der Anwendung Bode_ analyzer.


Notizen
-----

.. Hardware: http://redpitaya.readthedocs.io/en/latest/index.html
.. _Bode: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/bode/bode.html 

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch.
wenn es um die Anschlüsse an die Red Pitaya STEMlab-Karte geht.
hardware_.

Die Bode_ Analysatoranwendung wird zur Messung des Frequenzgangs von
Tiefpass- und Hochpassfilter.

Der Bode Analysator ist eine ideale Anwendung zur Messung der Frequenz.
Reaktionen der passiven/aktiven Filter, komplexe Impedanzen und beliebige
andere elektronische Schaltung. Der Gain/Phase Frequenzgang kann wie folgt eingestellt werden
um jedes zu testende Gerät vollständig zu charakterisieren, können Sie Folgendes durchführen
lineare und logarithmische Sweeps. Verstärkung und Phase können ab 1Hz gemessen werden.
auf 60MHz. Die grundlegende Benutzeroberfläche ermöglicht eine schnelle Interaktion und
Parametereinstellungen. Der Bode-Analysator kann für die Messung verwendet werden.
der Stabilität von Regelkreisen wie den DC/DC-Wandlern im Leistungsbereich
Versorgungsspannungen, Einfluss der Terminierung auf Verstärker oder Filter,
Ultraschall- und Piezoelektriksysteme und dergleichen.


Hintergrund
----------

Ein Bandpassfilter ermöglicht den Durchgang eines bestimmten Frequenzbereichs,
beim Blockieren oder Dämpfen niedrigerer und höherer Frequenzen. Es geht vorbei
Frequenzen zwischen den beiden Grenzfrequenzen bei gleichzeitiger Dämpfung.
Frequenzen außerhalb der Grenzfrequenzen. Eine typische Anwendung
eines Bandpassfilters befindet sich in der Audiosignalverarbeitung, wobei eine bestimmte
Bereich der Schallfrequenzen sind erwünscht, während die Dämpfung der
Ruhe. Eine weitere Anwendung ist die Auswahl eines bestimmten Signals.
aus einer Reihe von Signalen in Kommunikationssystemen. Bandpassfilter
kann durch Kaskadierung eines Hochpass-RL-Filters mit einem Abrollvorgang konstruiert werden.
Frequenz :math:`f_L` und ein Tiefpassfilter mit einem Roll-off
Frequenz :math:`f_H`, so dass:

... Mathe:...:	

   f_L < f_H 

Die untere Grenzfrequenz wird als: 

... Mathe:...:	

   f_L = \frac{R}{2 \pi L} \quad (1)

Die höhere Grenzfrequenz wird als: 

... Mathe:...:

   f_H = \frac{1}{2 \pi RC} \quad (2) 

Die **Bandbreite** der übergebenen Frequenzen wird durch: 

... Mathe:...:

   BW = f_L < f_{BW} < f_H \quad (3) 

Alle Signalfrequenzen :math:`f` unterhalb :math:`f_L` und darüber
:math:`f_H` werden gedämpft und die Frequenzen dazwischen werden von der
den Filter.
      

... Abbildung:: img/Aktivität_10_Figur_1.png

   Abbildung 1: Bandpass-Filterschaltung 

   
Frequenzgang
------------------

Um zu zeigen, wie eine Schaltung auf einen Frequenzbereich reagiert, wird eine Darstellung der
Größe ( Amplitude) der Ausgangsspannung des Filters als
Funktion der Frequenz kann gezeichnet werden. Es wird im Allgemeinen verwendet, um
den Frequenzbereich charakterisieren, in dem der Filter ausgelegt ist.
um darin zu operieren. Abbildung 2 zeigt einen typischen Frequenzgang eines
Bandpassfilter.


... Abbildung:: img/Aktivität_10_Figur_2.png

   Abbildung 2: Bandpassfilter Frequenzgang

   
Materialien:
----------


- Rote Pitaya STEMlab 125-14 oder STEMlab 125-10 

- Widerstand: 1 KΩ 

- Kondensator: 0,047 µF

- Induktor: 22 mH 


Vorgehensweise
---------


1. Stellen Sie den Filterschaltkreis wie in Abbildung 1 und Abbildung 3 an Ihrem
   lötfreie Lochrasterplatine, mit den Bauteilwerten R1 = 1 KΩ, C1 =
   0,047 µF, L1 =22 mH.

   ... Abbildung:: img/Aktivität_10_Figur_3.png

   Abbildung 3: Bandpassfilter auf lötfreier Leiterplatte

2. Starten Sie die Anwendung Bode analyzer. Die Bode Analysator-Anwendung
   wird einen Frequenzdurchlauf machen, so dass er Sinus erzeugt.
   Signal auf :math:`OUT1` innerhalb des von uns gewählten Frequenzbereichs (in
   :math:`IN1`Eingangssignal ist direkt verbunden mit dem
   :math:`OUT_1` nach diesem :math:`IN1=V_{in}`. :math:`IN2` ist
   die auf der anderen Seite des Filters und davon ausgehend angeschlossen sind.
   :math:`IN2=V_{out}`. Bode Analysator Anwendung wird dann für die
   Jeder Frequenzschritt nimmt das Verhältnis von :math:`IN1/IN2`.
   (:math:`V_{in}/V_{out}`) und berechnen der Frequenz
   Antwort.  

3. Im Menü Einstellungen des Bode-Analysators ist das Menü auf:

   - Startfrequenz: 500 Hz

   - Endfrequenz: 30 kHz

   - Anzahl der Schritte: 50

   - Maßstab: Protokoll 

   - RUN-Taste auswählen

   ... Abbildung:: img/Aktivität_10_Figur_4.png

   Abbildung 4: Bandpassfilter **gemessen** Frequenzgang

   
Fragen:
----------

1. Berechnung der Grenzfrequenzen für jeden Bandpassfilter
   konstruiert unter Verwendung der Formel in den Gleichungen (1) und (2). Vergleichen Sie
   diese theoretischen Werte zu denjenigen, die aus dem Experiment gewonnen wurden.
   und geben Sie eine geeignete Erklärung für eventuelle Unterschiede. 



































































































































































