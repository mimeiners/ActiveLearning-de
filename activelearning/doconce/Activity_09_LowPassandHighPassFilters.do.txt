Tiefpass- und Hochpassfilter
============================

Zielsetzung
-----------

Das Ziel dieser Labortätigkeit ist es, die Eigenschaften von
passive Filter durch Erhalten des Frequenzgangs von Tiefpass RC
Filter und Hochpass-RL-Filter.  

Notizen
-------

.. _hardware: http://redpitaya.readthedocs.io/en/latest/index.html
.. _Oscillosope: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _Bode: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/bode/bode.html
.. _Signal: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html
.. _generator: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/oscSigGen/osc.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch.
wenn es um die Anschlüsse an die Red Pitaya STEMlab-Karte geht.
hardware_.

Die Anwendung Oscilloscope_ & Signal_ Generator_ wird zur Erzeugung von
und Beobachten von Signalen auf dem Schaltkreis. Bode_ Analysator Anwendung ist
wird zur Messung des Frequenzgangs von Tiefpass- und Hochpassfiltern verwendet. 

Hintergrund
----------

Die Impedanz eines Induktors ist proportional zur Frequenz und die Impedanz des Induktors ist proportional.
Die Impedanz eines Kondensators ist umgekehrt proportional zur Frequenz. Diese
Merkmale können verwendet werden, um bestimmte Frequenzen von
ein Eingangssignal. Diese Auswahl und Ablehnung von Frequenzen wird als
Filtern, und eine Schaltung, die dies tut, wird als Filter bezeichnet. 

.. figure:: img/Activity_09_Fig_1.png

	    Abbildung 1: Tiefpassfilter RC.

   
.. figure:: img/Activity_09_Fig_2.png

	    Abbildung 2: Hochpass-RL-Filter.

   
Wenn ein Filter hohe Frequenzen durchläuft und tiefe Frequenzen ablehnt, dann wird
es ist ein Hochpassfilter. Umgekehrt, wenn es niedrige Frequenzen passiert und
verwirft hohe Frequenzen, es ist ein Tiefpassfilter. Filter, wie die meisten Dinge,
nicht perfekt sind. Sie passieren nicht unbedingt einige Frequenzen und
andere absolut ablehnen. Eine Frequenz gilt als bestanden, wenn ihre
Größe (Spannungsamplitude) liegt innerhalb von 70% oder 1/sqrt(2) der
maximale Amplitude bestanden und anderweitig abgelehnt. Die 70%ige
Frequenz ist genannt Eckfrequenz, Abrollfrequenz oder
Halbleistungsfrequenz.


Die Eckfrequenzen für RC-Filter und RL-Filter sind wie folgt:

Für RC-Filter: 

.. math::
   
   f_c = \frac{1}{2 \pi RC} (1) 

Für RL-Filter: 

.. math::	

   f_c = \frac{R}{2 \pi L} (2) 

   
Frequenzgang: Es ist ein Diagramm der Größe der Ausgangsspannung.
des Filters in Abhängigkeit von der Frequenz. Es wird im Allgemeinen verwendet, um
den Frequenzbereich charakterisieren, in dem der Filter ausgelegt ist.
um darin zu operieren. 

.. figure:: img/Activity_09_Fig_3.png

	    Abbildung 3: Frequenzgang eines typischen Tiefpassfilters mit einer Grenzfrequenz fc

   
Materialien:
----------

- Rote Pitaya STEMlab 125-14 oder STEMlab 125-10 
- Widerstände: 1 KΩ 
- Kondensatoren: 1 µF
- Induktor: 22 mH 

  
Vorgehensweise
--------------

Tiefpassfilter für RC-Filter:***

1. Richten Sie die RC-Schaltung wie in Abbildung 1 auf Ihrer lötfreien
   Leiterplatte mit den Bauteilwerten R1 = 1 KΩ, C1 = 1 µF ein:
   

2. Verbinden Sie die STEMlab-Platine mit Ihrer Schaltung:

   - Schließen Sie die Sonden des Oszilloskops und des
     Signalgenerators wie in Abbildung 4 dargestellt an.
     

   - Stellen Sie die Oszilloskopdämpfung auf x1 ein.

     
.. figure:: img/Activity_09_Fig_4.png

	    Abbildung 4: Tiefpass RC-Filter Breadboard-Schaltung

   
3. Starten Sie die Anwendung Oszilloskop & Signalgenerator:

   Im Menü OUT1 Einstellungen den DC-Offsetwert auf 0,5 einstellen und
   Amplitudenwert auf 0,5V, um eine 1Vp-p Sinuskurve zu erzeugen, die auf den folgenden Punkten zentriert ist
   0,5 V als Eingangsspannung für die Schaltung. Aus dem Wellenform-Menü
   Wählen Sie SINUS-Signal, deaktivieren Sie die SHOW-Taste und wählen Sie Enable. Ein
   links unten auf dem Bildschirm stellen Sie sicher, dass IN1 V/div und IN2
   V/div sind beide auf 200mV/div eingestellt (Sie können V/div einstellen, indem Sie die Option
   den gewünschten Kanal und mit vertikalen +/- Reglern) In der IN1
   und IN2 Einstellungsmenü stellen Sie den Wert des vertikalen Versatzes auf -500mV ein.
   Für die stabile Aufnahme den Triggerpegel im Menü TRIGGER einstellen.
   auf 0,5V und wählen Sie NORMAL.

4. Beginnen Sie mit einer niedrigen Frequenz, 50 Hz, und messen Sie die Ausgangsspannung IN1.
   von Spitze zu Spitze vom Scope Bildschirm aus. Es sollte das gleiche wie der Kanal sein.
   Ausgang OUT1. Erhöhen Sie die Frequenz von OUT1 in kleinen Schritten.
   bis die Spitzenspannung des Kanals IN2 etwa das 0,7-fache der Spitzenspannung beträgt.
   Spitze-Spitze-Spannung für Kanal IN1. Berechnen Sie die 70 % von Vp-p-p und
   erhalten Sie die Frequenz, mit der dies auf dem Oszilloskop geschieht.
   
   Daraus ergibt sich die Grenzfrequenz (Roll-off) für die konstruierte Low
   RC-Filter bestehen. Bei Änderung der Frequenz OUT1 Zeit/Div einstellen mit Hilfe von
   horizontale -/+ Kontrollen. Für die Peak-Peak-Messung in der
   Messmenü "P2P" auswählen, IN1, IN2 auswählen und DONE drücken.

.. figure:: img/Activity_09_Fig_5.png

	    Abbildung 5: Tiefpass RC-Filterreaktion bei 50Hz

   
.. figure:: img/Activity_09_Fig_6.png

	    Abbildung 6: Tiefpass RC-Filterreaktion bei 500Hz

Hochpass-RL-Filter:**Hochpass-RL-Filter:**

1. Stellen Sie den RL-Schaltkreis wie in Abbildung 2 auf Ihrem lötfreien
   Breadboard, mit den Komponentenwerten R1 = 1 KΩ, L1 = 22 mH.
   
2. Verbinden Sie die STEMlab-Platine mit Ihrer Schaltung:

   - Schließen Sie die Sonden des Oszilloskops und des Signalgenerators wie in Abbildung 7 dargestellt an. 

   - Stellen Sie die Oszilloskopdämpfung auf x1 ein.

.. figure:: img/Activity_09_Figur_7.png

	    Abbildung 7: Hochpass RL-Filter Breadboard-Schaltung

3. Beginnen Sie mit einer Hochfrequenz von 50 KHz und messen Sie die Ausgangsspannung IN2.
   von Spitze zu Spitze vom Scope Bildschirm aus. Es sollte das gleiche wie der Kanal sein.
   IN1 von Spitze zu Spitze. Senken Sie die Frequenz des Kanals OUT1 auf klein.
   Inkremente, bis die Spitzenspannung des Kanals IN2 etwa gleich hoch ist.
   0,7-fache der Spitzenspannung für Kanal A. Berechnen Sie die 70 %ige
   von Vp-p und erhalten die Frequenz, mit der dies geschieht, auf dem
   Oszilloskop. Daraus ergibt sich die Grenzfrequenz (Roll-off) für die
   konstruierten Hochpass-RL-Filter.

.. figure:: img/Activity_09_Fig_8.png

	    Abbildung 8: Hochpass-RL-Filterreaktion bei 50kHz

   
.. figure:: img/Activity_09_Fig_9.png

   Abbildung 9: Hochpass-RL-Filterreaktion bei 500Hz

   
Frequenzgang-Diagramme mit Bode Analayzer**

Die Bode Analysator-Anwendung führt einen Frequenz-Sweep durch.
es erzeugt ein Sinussignal auf OUT1 innerhalb des gewählten Frequenzbereichs.
von uns (im Einstellungsmenü). Das Eingangssignal IN1 ist direkt mit dem folgenden Gerät verbunden
OUT1 folgt auf IN1=Vin. IN2 ist auf der anderen Seite des Gerätes angeschlossen.
RL(RC)-Filter und daraus IN2=Vout. Bode Analysator Anwendung wird
dann für jeden Frequenzschritt das Verhältnis von IN1/IN2 nehmen und berechnen.
Frequenzgang.

.. figure:: img/Activity_09_Fig_10.png

   Abbildung 10: Tiefpassfilterreaktion des RC-Filters mit der Bode-Analysatoranwendung

.. figure:: img/Activity_09_Fig_11.png

   Abbildung 11: Hochpass-RL-Filterreaktion mit der Bode-Analysatoranwendung

Fragen
------
Berechnung der Grenzfrequenzen für den RC-Tiefpass und RL-Hochpass
Filter unter Verwendung der Gleichungen (1) und (2). Vergleichen Sie
die berechnete theoretische Werte zu den Werten aus den
experimentellen Messungen und eine geeignete Erklärung für etwaige
Unterschiede liefern.











































































































































































































