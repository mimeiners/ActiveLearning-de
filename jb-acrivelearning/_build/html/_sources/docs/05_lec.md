<!-- !split -->
<!-- jupyter-book 05_lec.md -->
# Graphische Analysemethoden

* Bode-Diagramm, Frequenz- und Phasengang <a href="lunze2014.html#lunze2014">[2]</a><a href="philippsen2019.html#philippsen2019">[3]</a>
* Nyquist-Ortskurve, kurz [Ortskurve](https://elektroniktutor.de/elektrophysik/ortskurv.html) <a href="mietke2020.html#mietke2020">[4]</a><a href="schenke2020.html#schenke2020">[5]</a>

<!-- !split -->
## Frequenzgang &ndash; Übergangsverhalten

*Kurzbeschreibung.* 
Der Frequenzgang beschreibt, wie ein dynamisches System eine sinusförmige Eingangsgröße überträgt.

<!-- <img src="fig/lec_5s1.png" width="200"> -->
![](fig/lec_5s1.png)

$$
 F(j\omega) = \frac{\underline{U}_2}{\underline{U}_1} = \frac{j \omega R_1 C_1}{1+j \omega R_1 C_1} 
$$



<!-- !split -->
### Exercise: Bode-Diagramm einer RC-Schaltung

<div id="ipynb:bode"></div>

Ermitteln Sie den Betrags- und Phasengang der einfachen RC-Schaltung mit Hilfe der komplexen Wechselstromrechnung (KWR).
Nutzen Sie Python oder Matlab zur Darstellung des Bode-Diagramms.


~~~{.Python}
#!/usr/bin/env python

""" Bode-Diagramm einer RC-Schaltung """

import numpy as np
import matplotlib.pyplot as plt

# Spezifikation der Impedanz/Admittanz
R = 2e3
C = 156e-9

# Frequenzvektor
f = np.logspace(0, 5, 100)
w = 2*np.pi*f

# Bestimmung der Impedaanzen
Z1 = R
Z2 = 1/(1j*w*C)

# Spannungsuebertrangungsfunktion
F_U = Z1 / (Z1 + Z2)

abs_F_U = 20*np.log10(abs(F_U))
arg_F_U = np.arctan(F_U.imag/F_U.real)

# Bode-Diagramm
plt.subplot(2, 1, 1)
plt.semilogx(f, abs_F_U)
plt.ylabel(r'|F(j$\omega$)|/dB')
plt.grid(b=True)
plt.title('Bode-Diagramm einer RC-Schaltung')

plt.subplot(2, 1, 2)
plt.semilogx(f, arg_F_U)
plt.xlabel(r'Frequenz f/Hz')
plt.ylabel(r'arg(F(j$\omega$)/rad')
plt.grid(b=True)

plt.show()
~~~

<!-- !split -->
## Ortskurven
Als Referenz zu diesem Thema sei das Kapitel 5 aus <a href="buettner2014.html#buettner2014">[6]</a> empfohlen.

*Vergleich zum Zeigerdiagramm.* 
* Zeigerdiagramm nur für konstante Parameter
* Im Zeigerdiagramm keine Aussagen über Auswirkungen von Änderungen der Frequenz oder Schaltelemente
* "Für jeden Wert der Zweipole $R$, $L$, und $C$ oder jede Frequenz müssten gesonderte Zeigerdiagramme erstellt werden."
* "Man verzichtet auf die Darstellung der Zeiger und trägt in der komplexen Zahlenebene nur die Kurve auf."



<!-- !split -->
### Exercise: Ortskurve einer RC-Schaltung

<div id="ipynb:rc"></div>

"Mit den Bauteilen $R$ = 2 k $\Omega$ und $C$ = 159 nF kann eine Reihen- oder Parallelschaltung
gebildet werden. Die komplexe Impedanz der Reihenschaltung ist von der Frequenz abhängig und grafisch in der komplexen
Ebene als Ortskurve mit der Frequenz als Parameter dargestellt. Die Blindwiderstandswerte wurden für einen bestimmten
Frequenzbereich errechnet und im Polarkoordinatensystem eingetragen. Alle Werte liegen im 4. Quadranten auf einer
Geraden. Da der ohmsche Widerstand ist von der Frequenz unabhängig ist, verläuft sie parallel zur imaginären Achse im
Abstand von 2 k $\Omega$. Auf die reelle (Re) Achse bezogen ist der Phasenwinkel der Impedanz negativ. Das Diagramm
ist mit den angegebenen gerundeten Rechenwerten des Blindwiderstands, der Impedanz und des Phasenwinkels erstellt."

<!-- <img src="fig/lec_5s2.png" width="200"> -->
![](fig/lec_5s2.png)

$$
 \underline{Z} = R_1 + \frac{1}{j \omega C_1} 
$$


~~~{.Python}
#!/usr/bin/env python

""" Ortskurve einer RC-Reihenschltung """

import numpy as np
import matplotlib.pyplot as plt

# Spezifikation der Impedanz/Admittanz
R = 2e3
C = 156e-9
f = np.linspace(0.2e3, 5e3, 5)
w = 2*np.pi*f
Z = R + 1/(1j*w*C)

# Ortskurve der Impedanz
plt.plot(Z.real, Z.imag, '-x')
plt.grid(b=True)
plt.xlabel(r'Re{Z}')
plt.ylabel(r'Im{Z}')
plt.show()
~~~

"Die Ortskurve kann auch für die Parallelschaltung von R und C mit der Frequenz als Parameter gezeichnet werden. Im
Polardiagramm wird sie durch die Zeiger aller Gesamtleitwerte oder Admittanzen gebildet und verläuft im 1. Quadranten
parallel zur imaginären Achse. Die Achsenbezeichnungen der Leitwerte werden in Siemens S angeben. Die Phasenwinkel sind
auf die Re-Achse bezogen positiv." <a href="mietke2020.html#mietke2020">[4]</a>

<!-- !split -->
### Reihenschaltung von $R$, $L$ und $C$

<!-- !split -->
### Parallelschaltung von $R$, $L$ und $C$

<!-- !split -->
### Inversion von Ortskurven

<div id="inversion"></div>

"Bei der Konstruktion einer Ortskurve ist es oft notwendig von der Widerstandsform $\underline{Z}(\omega)$ auf die
Leitwertsform $\underline{Y}(\omega)$ überzugehen und umgekehrt. Beide Funktionen gehen jeweils aus der Kehrwertbildung
der anderen hervor, man nennt sie zueinander inverse Funktionen und die Kehrwertbildung selbst Inversion." <a href="buettner2014.html#buettner2014">[6]</a>

* Inversion eines Punktes (Widerstandsform/Impedanz): $\underline{Z} (5 + 5j) \Omega$
* Ma{\ss}stäbe $M_Z = 2 \Omega/cm$ und $M_Y = 0.1 S/cm$
* Leitwertform/Admittanz: $\underline{Y} = 1 / \underline{Z}$

$$
\begin{equation}
\underline{Y} = \frac{1}{(5 + 5j) \Omega} = \frac{(5 - 5j)S}{50} = (0.1 - 0.1j) S
\end{equation}
$$

* Inversion von Ortskuven durch Inversion einzelner Punkte <a href="buettner2014.html#buettner2014">[6]</a>:
 a. In die komplexe Zahlenebene wird der Zeiger $Z$ eingetragen, dessen Spitze invertiert werden soll.
 b. Um den Ursprung des Koordinatensystems wird ein Inversionskreis mit beliebigem Radius $r$ geschlagen.
 c. Von der Spitze des Zeigers $Z$ aus werden Tangenten an den Kreis gelegt, sie ergeben die Berührungspunkte $T_1$ und $T_2$. Die Tangentenpunkte kann man auch finden, wenn man um die Mitte des Zeigers einen Kreis mit dem Radius $Z / 2$, d.h. einen Thaleskreis, schlägt (siehe [Höhensatz](https://de.wikipedia.org/wiki/Höhensatz)).
 d. Die beiden Punkte $T_1$ und $T_2$ werden miteinander verbunden.
 e. Wo die Verbindungslinie den Zeiger $Z$ schneidet, liegt die Spitze des konjugiert komplexen Zeigers $Y^*$.
 f. Spiegelt man den Zeiger $Y^*$ an der reellen Achse, so erhält man $Y$. Die Spitze dieses Zeigers entspricht also der invertierten Spitze von $Z$.
 g. Bezeichnet man die Maßstäbe für den komplexen Scheinwiderstand mit $M_Z$ und den Scheinleitwert mit $M_Y$ sowie die Länge des Zeigers $Z$ mit $L_Z$ und die der Zeiger $Y$  bzw. $Y^*$ mit $L_Y^*$  bzw. $L_Y$, so ist – da das Dreieck 0T1P rechtwinklig ist – nach dem [Kathetensatz](https://de.wikipedia.org/wiki/Satzgruppe_des_Pythagoras#Kathetensatz_des_Euklid): $r^2 = L_Z \cdot L_Y^* = L_Z \cdot L_Y$


<!-- !split -->
