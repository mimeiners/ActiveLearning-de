Proportionalität und Überlagerung
=================================

Zielsetzung
-----------

Das Ziel dieser Labortätigkeit ist die Überprüfung des
Proportionalität- und  Überlagerungssatzes (Superposition).

.. _E1: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e1
.. _E2: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-14/extent.html#extension-connector-e2
.. _Hardware: http://redpitaya.readthedocs.io/en/latest/doc/developerGuide/125-10/top.html

.. note:: In diesen Tutorials verwenden wir die Terminologie aus dem
	  Benutzerhandbuch wenn es um die Anschlüsse an die Red Pitaya
	  STEMlab-Karte geht. Hardware_. Verlängerungsstecker-Pins,
	  die als 5V- und 3,3V-Spannungsquelle verwendet werden sind
	  in der Dokumentation zu den Steckverbindern E1_ und E2_ aufgeführt.


Hintergrund
-----------
In dieser Übung werden Proportionalitäts- und Überlagerungssätze
untersucht, indem sie auf die, in den folgenden Abbildungen
dargestellten Schaltungen, angewendet werden.



1. Das Proportionalitätstheorem besagt, dass die Reaktion einer
   Schaltung proportional zur Quelle ist, die auf diese Schaltung
   wirkt. Dies wird auch als Linearität bezeichnet. Die
   Proportionalitätskonstante A bezieht die Eingangsspannung auf die
   Ausgangsspannung als:
   

   .. math:: V_{out} = Ein \cdot V_{in}
      :label: 04_eq_01

   Der Proportionalitätsfaktor A wird manchmal als Verstärkung einer
   Schaltung bezeichnet.
   
   Für die Schaltung in Abb. :numref:`04_fig_01` ist die
   Spannungsquelle :math:`V_{in}` die Quellspannung.
   
   Die Ausgangsspannung :math:`V_{out}` liegt über dem :math:`4,7
   k\Omega` Widerstand. Das wichtigste Ergebnis der Linearität ist
   Überlagerung.
   
   
   .. _04_fig_01:
   .. figure:: img/Activity_04_Fig_01.png
      :align: center 
	
      Widerstandsschaltung mit :math:`5V` Spannungsquelle.


2. Der Überlagerungssatz (Superposition) besagt, dass die Reaktion
   einer linearen Schaltung mit mehreren unabhängigen Quellen, wie in
   :numref:`04_fig_02`, durch Addition der individuellen Reaktionen,
   die durch die einzelnen Quellen verursacht werden, die allein
   wirken, erhalten werden kann. Bei einer unabhängigen Quelle, die
   allein arbeitet, werden alle anderen unabhängigen Spannungsquellen
   im Stromkreis durch Kurzschlüsse und alle anderen unabhängigen
   Stromquellen durch Leerläufe ersetzt, wie in Abbildung 3
   dargestellt.
   

   .. _04_fig_02:
   .. figure:: img/Activity_04_Fig_02.png
      :align: center 

      Schaltung mit zwei Spannungsquellen.

      
   .. _04_fig_03:
   .. figure:: img/Activity_04_Fig_03.png
      :align: center 
	
      Schaltung zur Reaktion von nur einer Quelle.



Materialien
-----------

- Red Pitaya STEMlab 125-14 oder STEMlab 125-10 

- Verschiedene Widerstände:
  
  - :math:`1 k\Omega` 

  - :math:`2,2 k\Omega` 

  - :math:`4,7 k\Omega`


Vorgehensweise
--------------

Überprüfen Sie den Proportionalitätssatz:

1. Bauen Sie die Schaltung aus Abb. :numref:`04_fig_01` auf.

2. Im ersten Fall verwenden Sie als Spannungsquelle
   :math:`V_{in} = 5V` den STEMlab-Spannungsstift am
   Erweiterungsstecker E2_.
	 
  
3. Im zweiten Fall verwenden Sie als Spannungsquelle
   :math:`V_{in}=3.3V` den STEMlab-Spannungsstift am
   Erweiterungsstecker E1_.
	 

4. Im dritten Fall verwenden Sie als Spannungsquelle
   :math:`V_{in} = -3.3V` den STEMlab-Spannungsstift am
   Erweiterungsstecker E2_.
  

5. Stellen Sie die Sondendämpfung sowohl an der Oszilloskopsonde als
   auch in der Menü-Einstellung des IN1 in der Oszilloskopanwendung
   auf :math:`\times 10` ein. 

6. Messen Sie :math:`V_{out}` mit der Oszilloskopanwendung.
  
  
7. Sie sollten die tatsächlichen festen Netzspannungen ebenfalls
   messen und aufzeichnen.
   

  
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


 
- Berechnen Sie den jeweiligen Wert von A mit Hilfe der Gl.(1).

- Zeichnen Sie ein Diagramm mit V\ :sub:`in`\ auf der x-Achse und V\
  :sub:`out`\ auf der y-Achse.
       

- Überprüfen des Überlagerungssatzes:

  - Bauen Sie die Schaltung von Abb. 2 auf. Messen und protokollieren Sie die Spannung am :math:`\4.7k\Omega` Widerstand.
    

  - Bauen Sie die Schaltung von Abb. 3 auf. Messen und
    protokollieren Sie die Spannung am :math:`4,7 k\Omega`
    Widerstand.
    

    
.. note:: Das Messen des Spannungsabfalls am gewünschten Widerstand erfolgt so, dass die Oszilloskopsonde von IN1 mit der einen Seite des Widerstands und die Oszilloskopsonde von IN2 mit der anderen Seite des Widerstands verbunden ist. Die Spannungsdifferenz V\ :sub:`in1`\-V\ :sub:`in2`\ gibt eine Spannung am gemessenen Widerstand an.
	  


- Berechnen Sie die Gesamtreaktion "V\ :sub:`out`\" für die Schaltung
  der Figur 2, in dem Sie die Ergebnise aus der Messung der  Schaltung von Figur 1 und Messung der Schaltung von Figur 3 addieren.
  

  V\ :sub:`out`\(figure 2) = V\ :sub:`out`\(figure 1) + V\ :sub:`out`\(figure 3) = _______________


- Vergleichen Sie Ihr berechnetes Ergebnis mit dem, was Sie in Schritt
  2a gemessen haben. Erklären Sie eventuelle Unterschiede.
  

  .. figure:: img/Activity_04_Fig_04.png
     :align: center  
     
     Abbildung 4: Spannungsstift auf der Red Pitays STEMlab-Platine


Fragen zu
---------

1. Ist die erhaltene Grafik eine gerade Linie? Berechnen Sie die Steigung der Grafik an jedem beliebigen Punkt und vergleichen Sie sie mit dem Wert von K, der sich aus den Messungen ergibt. Erklären Sie eventuelle Unterschiede.
   
   
2. Wie genau haben sich die berechneten und gemessenen Ergebnisse für jede der drei Schaltungen, die Sie für das Überlagerungsexperiment gebaut haben, verhalten? Erklären Sie eventuelle Unterschiede.
   









































































































































