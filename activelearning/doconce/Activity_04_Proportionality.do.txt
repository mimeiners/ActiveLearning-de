Proportionalität und Überlagerung
=================================

Zielsetzung
-----------

Das Ziel dieser Labortätigkeit ist es, die Verhältnismäßigkeit zu überprüfen.
und Überlagerungssätze. 

Notizen
-------

.. _E1: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e1
.. _E2: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html

In diesen Tutorials verwenden wir die Terminologie aus dem Benutzerhandbuch wenn es um die Anschlüsse an die Red Pitaya STEMlab-Karte geht.
Hardware_. Verlängerungsstecker-Pins, die als 5V- und 3,3V-Spannungsquelle verwendet werden sind in der Dokumentation zu den Steckverbindern E1_ und E2_ aufgeführt. 


Hintergrund
-----------

In dieser Tätigkeit sind Proportionalität und Überlagerungstheoreme geprüft, indem sie auf die nachfolgend dargestellten Schaltungen angewendet werden Zahlen. 

1. Der Proportionalitätstheorem besagt, dass die Reaktion einer
   Schaltung ist proportional zur Quelle, die auf die Schaltung
   wirkt. Dies ist auch der Fall bekannt als *Linearität*. Die
   Proportionalitätskonstante A bezieht sich auf die Eingangsspannung
   zur Ausgangsspannung als:  

   .. math:: 
	
      V_{out} = Ein \cdot V_{in} 

   Der Proportionalitätsfaktor A wird manchmal als der sogenannte
   Verstärkung einer Schaltung. Für die Schaltung in Fig. 1 ist die
   Quelle Die Spannung ist V\ :sub:`in`\. Die Antwort V\ :sub:`out`\
   ist across der :math:`4,7 k\Omega` Widerstand. Das wichtigste
   Ergebnis der Linearität ist Überlagerung.
   

   .. figure:: img/Activity_04_Fig_01.png
      :align: center 
	
      Abbildung 1: Widerstandsschaltung mit 5V Spannungsquelle


2. Der Überlagerungssatz besagt, dass die Reaktion eines linearen
   Schaltung mit mehreren unabhängigen Quellen, wie in Figur 2, kann
   erhalten werden, indem man die einzelnen Antworten addiert, die
   durch die einzelne Quellen, die allein handeln. Für eine
   unabhängige Quelle, die handelt. allein, alle anderen unabhängigen
   Spannungsquellen im Stromkreis sind ersetzt durch Kurzschlüsse und
   alle anderen unabhängigen Ströme. Quellen werden durch offene
   Stromkreise ersetzt, wie in Abbildung 3 dargestellt.
   

   .. figure:: img/Activity_04_Fig_02.png
      :align: center 

      Abbildung 2. Schaltung mit zwei Spannungsquellen 

      
   .. figure:: img/Activity_04_Fig_03.png
      :align: center 
	
      Abbildung 3. Schaltung zur Reaktion von nur einer Quelle

      
Materialien
-----------

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10 

- Verschiedene Widerstände:
  - :math:`1 k\Omega`, 
  - :math:`2,2 k\Omega`, 
  - :math:`4,7 k\Omega`.


Vorgehensweise
--------------

Überprüfen Sie den Satz des Proportionalitätssatzes:

- Konstruieren Sie die Schaltung aus Figur 1.

- Fall 1: Für die Spannungsquelle "V\ :sub:`in`\=5V", dargestellt in
  Abbildung 1. Verwenden Sie den STEMlab-Spannungsstift am
  Erweiterungsstecker E2_. 
  
- Fall 2: Für die Spannungsquelle "V\ :sub:`in`\=3.3V", dargestellt in
  der Abbildung.1. Verwenden Sie den STEMlab-Spannungsstift am
  Erweiterungsstecker E1_.  

- Fall 3: Für die Spannungsquelle "V\ :sub:`in`\=-3.3V", dargestellt
  in der Abbildung. 1 Verwenden Sie den STEMlab-Spannungsstift am
  Erweiterungsstecker E2_.
  

- Stellen Sie die Sondendämpfung auf x10 ein (an der Oszilloskopsonde
  und an der Oszilloskop IN1 Menüeinstellungen)
  

- Messen Sie V\ :sub:`out`\ mit dem Oszilloskop genau Anwendung.
  
  
- Sie sollten die tatsächlichen festen Netzspannungen messen und aufzeichnen auch. 

  
  .. table:: Tabelle 1
     :widths: auto

     +---------------+----------------+-------+	
     | V\ :sub:`in`\ | V\ :sub:`out`\ |   A   |  
     +---------------+----------------+-------+
     |    5.0 V      |                |       |	
     +---------------+----------------+-------+
     |    3.3 V      |                |       |
     +---------------+----------------+-------+
     |   -3.3 V      |                |       |
     +---------------+----------------+-------+


 
- Berechnen Sie den Wert von A jeweils mit Äquivalent (1).

- Zeichne ein Diagramm mit V\ :sub:`in`\ auf der x-Achse und V\
  :sub:`out`\ auf der y-Achse.
       

- Überprüfen des Überlagerungssatzes:

  - Konstruieren Sie die Schaltung von Fig. 2. Messen und
    protokollieren Sie die Spannung über dem :math:`4,7 k\Omega`
    Widerstand.
    

  - Konstruieren Sie die Schaltung von Fig. 3. Messen und
    protokollieren Sie die Spannung über dem :math:`4,7 k\Omega`
    Widerstand.
    

    
.. note:: Die Messung des Spannungsabfalls am gewünschten Widerstand
	  erfolgt in den Bereiche so, dass die Oszilloskop-Sonde von
	  IN1 mit dem Gerät verbunden ist eine Seite des Widerstandes
	  und der Oszilloskop-Sonde von IN2 ist die mit einer anderen
	  Seite des Widerstandes verbunden sind. Spannung Unterschied
	  V\ :sub:`in1`\-V\ :sub:`in2`\ gibt einen Spannung am
	  gemessenen Widerstand.
	  


- Berechnen Sie die Gesamtreaktion "V\ :sub:`out`\" für die Schaltung
  der Figur 2 durch Hinzufügen der Antworten aus der Messung der
  Schaltung von Figur 1 und Messung der Schaltung von Figur 3.
  

  V\ :sub:`out`\(figure 2) = V\ :sub:`out`\(figure 1) + V\ :sub:`out`\(figure 3) = _______________


- Vergleichen Sie Ihr berechnetes Ergebnis mit dem, was Sie in Schritt
  2a gemessen haben. Erklären Sie eventuelle Unterschiede.
  

  .. figure:: img/Activity_04_Fig_04.png
     :align: center  
     
     Abbildung 4: Spannungsstift auf der Red Pitays STEMlab-Platine


Fragen zu
---------

1. Ist die erhaltene Grafik eine gerade Linie? Berechnen Sie die
   Steigung des Diagramm an beliebiger Stelle und vergleichen Sie es
   mit dem Wert von K, der sich ergibt aus die Messungen. Erklären Sie
   eventuelle Unterschiede.
   
   
2. Für jeden der drei Schaltkreise, die du für die Überlagerung gebaut
   hast.Experiment, wie gut die berechneten und gemessenen Ergebnisse
   waren vergleichen? Erklären Sie eventuelle Unterschiede.
   









































































































































