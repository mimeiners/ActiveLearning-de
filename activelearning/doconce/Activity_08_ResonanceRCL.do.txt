Resonanz in RLC-Schaltungen
===========================

Zielsetzung
-----------

Das Ziel dieser Labortätigkeit ist es, das Phänomen des Resonanz in RLC-Schaltungen. Bestimmen Sie die Resonanzfrequenz und die Bandbreite des gegebenen Netzwerks unter Verwendung des Amplitudenverlaufs zu einem sinusförmige Quelle. 

Notizen
-------

.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html
.. _Bode: http://redpitaya.readthedocs.io/en/latest/doc/appsFeatures/apps-featured/bode/bode.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch. wenn es um die Anschlüsse an die Red Pitaya STEMlab-Karte geht. hardware_.

Die Oszilloskop- und Signalgeneratoranwendung wird zum Erzeugen und Beobachten von Signalen auf der Schaltung verwendet. Die Bode_ Analysatoranwendung wird verwendet, um den Frequenzgang der RLC-Schaltung zu messen. 


Hintergrund
-----------

Ein Resonanzkreis, auch Abstimmkreis genannt, besteht aus einem Induktor und einem Kondensator sowie einer Spannungs- oder Stromquelle. Es ist eine der wichtigsten Schaltungen in der Elektronik. Ein Resonanzkreis in einer von vielen Formen ermöglicht es uns beispielsweise, aus der Vielzahl der Signale, die uns jederzeit umgeben, einen gewünschten Radio- oder Fernsehsender einzustellen.

Ein Netzwerk ist in Resonanz, wenn Spannung und Strom an den Netzeingangsklemmen in Phase sind und die Eingangsimpedanz des Netzwerks rein ohmscher Natur ist.  

.. figure:: img/Activity_08_Fig_01.png

   Abbildung 1: Parallel-Resonanzkreis

   
Berücksichtigen Sie die parallele RLC-Schaltung von Abb. 1. Die von der Schaltung angebotene stationäre Admittanz ist: 

.. math::

   Y = \frac{1}{R} + j \left( \omega C - \frac{1}{\omega L} \right) 

Resonanz entsteht, wenn Spannung und Strom an den Eingangsklemmen phasenrichtig sind. Dies entspricht einem rein realen Zutritt, so dass die notwendige Bedingung gegeben ist:

.. math::

   \omega C - \frac{1}{\omega L} = 0

   
Die Resonanzbedingung kann durch Einstellen von L, C oder :math:`\omega` erreicht werden. Wenn man L und C konstant hält, wird die Resonanzfrequenz :math:`\omega_0` durch:   


.. math::

   \omega_0 = \frac{1}{\sqrt{LC}} \, rad/s (1)

oder 

.. math::

   f_0 = \frac {1}{2 \pi \sqrt{LC}} \, Hz (2)

Frequenzgang: Es handelt sich um eine Darstellung der Größe der Ausgangsspannung eines Resonanzkreises als Funktion der Frequenz. Die Reaktion beginnt natürlich bei Null, erreicht einen Maximalwert in der Nähe der Eigenresonanzfrequenz und fällt dann wieder auf Null, wenn ω unendlich wird. Der Frequenzgang ist in Abbildung 2 dargestellt.  

.. figure:: img/Activity_08_Fig_02.png

   Abbildung 2: Frequenzgang des Parallelschwingkreises

   
Die beiden zusätzlichen Frequenzen ω :sub:`1` und ω :sub:`2` werden ebenfalls angezeigt, die als Halbleistungsfrequenzen bezeichnet werden. Diese Frequenzen lokalisieren diejenigen Punkte auf der Kurve, bei denen der Spannungsverlauf 1/sqrt(2) oder das 0,707-fache des Maximalwertes beträgt. Sie dienen zur Messung der Bandbreite der Ansprechkurve. Dies wird als Halbwertszeit bezeichnet. Bandbreite des Schwingkreises und ist definiert als:  

.. math::

   \beta = \omega_2 - \omega_1 (3)

   
.. figure:: img/Activity_08_Fig_03.png

   Bild 3: Serien-Resonanzkreis

   
Materialien
-----------


Red Pitaya STEMlab 125-14 oder STEMlab 125-10 
Widerstände 100 Ω, 1 KΩ
Kondensatoren 0,01 µF
Induktivitäten 4,7 mH


Vorgehensweise
--------------

Zusätzliche Kalkulation: 
Mit einem der sw-Tools wie Matlab oder Python können wir die Impedanz der parallelen RLC-Schaltung aus Figur 1 berechnen.

Die Admittanz (Y) der Parallelschaltung ist in Gleichung 1 oben angegeben, wobei die Impedanz Z als Z = 1 / Y angegeben ist.
       
       
.. note:: 
	
   Bei dieser Berechnung berücksichtigen wir den Serienwiderstand des Induktors. Dieser Widerstand beeinflusst das Phasenverhalten der RLC-Schaltung bei niedrigeren Frequenzen. Die obige Gleichung wird für ideale Komponenten ohne parasitäre Elemente verwendet. In der Praxis (Messungen) haben wir nur reale Elemente und wir müssen berücksichtigen, dass der Induktor keine reine Induktivität ist, sondern auch einen effektiven Serienwiderstand hat :math:`R_{esr}`, also

   .. math::

      Y_{L} = \frac{1}{(R_{esr} + j 2 \pi f L)}.


      
.. _Impedanz: https://en.wikipedia.org/wiki/Electrical_Impedanz
.. _Antiresonatoren: https://en.wikipedia.org/wiki/Antiresonance


.. note::

   Die Resonanzfrequenz ist definiert als die Frequenz, bei der die Impedanz_ der Schaltung minimal ist. Äquivalent kann es definiert werden als die Frequenz, bei der die Impedanz rein real (d.h. rein resistiv) ist. Dies geschieht, weil die Impedanzen von Induktivität und Kondensator bei Resonanz gleich, aber mit entgegengesetztem Vorzeichen sind und sich aufheben. Schaltungen, bei denen L und C parallel und nicht in Reihe geschaltet sind, haben tatsächlich eine maximale Impedanz und keine minimale Impedanz. Aus diesem Grund werden sie oft als Antiresonatoren bezeichnet_, es ist jedoch immer noch üblich, die Frequenz zu benennen. bei dem dies als Resonanzfrequenz geschieht.

Matlab-Code zur Berechnung von :math:`Z` ist unten aufgeführt.

.. code-block:: Matlab

   close all
   clear all
   clc
   Rs = 100;
   R1 = 1E3;
   L1 = 4.7E-3;
   C1 = 0,1E-6;
   Resr = 6,5;          % Induktor-Serienwiderstand in Ohm
   Vin = 1;
   f = 100:100:1E6;     % Frequenzbereich für die Berechnung

   %%% Berechnung von Z
   Y1 = 1/R1;
   Y2 = i*2*pi.*f*C1;
   Y3 = 1./(Rind+i*2*pi.*f*L1);
   Y = Y1 + Y2 + Y3;
   Z = 1./Y;

   %% Plotting
   ax = plotyy(f,real(Z),f,imag(Z),'semilogx','semilogx','semilogx');
   ylabel(ax(1), 'Realteil von Z / Ohm');
   ylabel(ax(2), 'Realteil von Z / Ohm');
   xlabel('Frequenz / Hz');
   Gitter ein

   
Wenn wir den obigen Code ausführen, erhalten wir folgende Ergebnisse, die auf dem Bild unten gezeigt werden.

.. figure:: img/Activity_08_Fig_04.png
 
   Abbildung 4: Berechnung der Impedanz Z der parallelen RLC-Schaltung.
   Blaue Spur reeller/resistiver Teil von Z, grüne Spur imaginärer/reaktiver Teil von Z. 

   
Wir können auch den Absolutwert von Z berechnen, der die kombinierte Impedanz der RLC-Schaltung aus Figur 1 ist.  Der Absolutwert der Impedanz Z ist die Parameterform, mit der wir vorhersagen können, wie die Messungen aussehen sollen.


Wir können die Schaltung aus Figur 8 modellieren, wie in der folgenden Abbildung gezeigt, wobei Z = 1/Y und Y in Gleichung 1 angegeben ist. 

.. figure:: img/Activity_08_Fig_05.png

   Abbildung 5: Darstellung der parallelen RLC-Schaltung als komplexe Impedanz Z

Aus Abbildung 5 oben können wir deutlich erkennen, dass unsere Schaltung ein einfacher Spannungsteiler ist, wobei Vout=Vin*Z/(Rs+Z). Da das Z jedoch frequenzabhängig ist, ist das Verhältnis zwischen Z und Rs frequenzabhängig und damit das Vin/Vout-Verhältnis.

Bei einer Frequenz f: Wenn der Wert von Z viel kleiner als der Wert von Rs ist, ist die Ausgangsspannungsamplitude viel kleiner als die Eingangsspannungsamplitude.

Bei einer bestimmten Frequenz f: wenn der Wert von Z viel höher ist als der Wert von Rs, wird die Ausgangsspannungsamplitude nahe der Eingangsspannungsamplitude liegen.

Bei einer bestimmten Frequenz f: wobei Z=Rs das Vout sein wird ½ Vin.  

Bei einer bestimmten Frequenz f: wobei Z maximal ist, ist der Vout auch maximal. Dies ist die Resonanzfrequenz. 


.. figure:: img/Activity_08_Fig_06.png

   Abbildung 6: Berechnung des Absolutwertes der Impedanz Z für die in Abbildung 3 dargestellte Schaltung. 


Verwendung von

.. math::

   V_{out} = V_{in} \frac{Z}{R_s + Z}

können wir den Frequenzgang unserer RLC-Schaltung berechnen. Abb. 5 und 8.

.. note::

   Größenänderung in Dezibel (dB)
   
   .. math::

      H_v = 20 \cdot \log_{10}\left\lvert \frac{V_{out}}{V_{in}} \right\lvert.



.. figure:: img/Activity_08_Fig_07.png

   Abbildung 7: Berechnung des Frequenzgangs (Vout/Vin) für die Schaltung in Abbildung 5.


Vorgehensweise:

1. Richten Sie die RLC-Schaltung wie in Abbildung 8 auf Ihrer lötfreien Leiterplatte mit den Bauteilwerten RS = 100 Ω, R1 = 1 KΩ, C1 = 0,1 µF und L1= 4,7 mH ein.

.. figure:: img/Activity_08_Fig_08.png

   Abbildung 8: Parallele RLC-Schaltung für die Messungen.


2. Öffnen Sie die Anwendung Bode analyzer. Im Menü "Einstellungen" die Startfrequenz auf 100Hz, die Endfrequenz auf 1MHz und die Schrittzahl auf 50 einstellen. Und klicken Sie auf die Schaltfläche "RUN". 

.. figure:: img/Activity_08_Fig_09.png

   Abbildung 9: Bode Analysator Anwendung

   
Nachdem die Messungen durchgeführt wurden, sollten Sie den Frequenzgang Ihrer Schaltung erhalten, wie in Abbildung 10q dargestellt.

.. figure:: img/Activity_08_Fig_10.png

    Abbildung 10: Frequenzgang der Schaltung aus Abbildung 8 Aufnahme durch Bode Analysator-Anwendung.



- Vergleichen Sie Messungen und Berechnungen. Wenn es einen Unterschied gibt, versuchen Sie zu erklären, warum.

.. hint:: 

   parasitär


Die Bode-Analysatoranwendung führt einen Frequenzdurchlauf durch, so dass sie ein Sinussignal auf OUT1 innerhalb des von uns gewählten Frequenzbereichs (im Einstellungsmenü) erzeugt.

Das Eingangssignal IN1 ist direkt mit OUT1 verbunden, gefolgt von IN1=Vin. IN2 wird auf der anderen Seite des RLC-Kreises und damit IN2=Vout angeschlossen. Die Anwendung des Bode-Analysators wird dann für jeden Frequenzschritt das Verhältnis von IN1/IN2 nehmen und den Frequenzgang berechnen.  

2. Um zu sehen, wie sich die Signalamplitude von Vout/IN2 in Bezug auf OUT1 ändert, starten Sie die Oszilloskopanwendung, aktivieren Sie in den Einstellungen OUT1 OUT1 OUT1, deaktivieren Sie die SHOW-Taste und betrachten Sie die Signalamplituden von IN1 und IN2. 


   Ändern Sie die OUT1-Frequenz, stellen Sie den t/div-Wert so ein, dass Sie 2 Zyklen des IN1 haben und beobachten Sie die Amplituden von IN1 und IN2. 


   Wiederholen Sie diesen Schritt für die OUT1-Frequenz von 100Hz bis 1MHz und Sie sollten den gleichen Amplitudenverlauf beobachten, wie er mit dem Bode-Messgerät gemessen wird.


   Bode Analysator ist auch die Messphase zwischen IN1 und IN2. Die Phase ist ebenfalls frequenzabhängig.  Das kann man mit der Oszilloskop-Applikation leicht erkennen. 


3. Wiederholen Sie das Experiment für den Serienschwingkreis in Figur 3 und verwenden Sie L1 = 20 mH und C1 = 0,01 uF und R1 = 1 KΩ. Die Vo-Spannung am Widerstand ist proportional zum Serien-RLC-Schaltstrom. 

Fragen zu
---------

Zeichne den Spannungsverlauf der Schaltung auf und erhalte die Bandbreite aus den Halbleistungsfrequenzen unter Verwendung der Gleichung (3).    


