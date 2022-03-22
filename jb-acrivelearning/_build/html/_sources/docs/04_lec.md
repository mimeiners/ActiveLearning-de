<!-- !split -->
<!-- jupyter-book 04_lec.md -->
# Impedanz, Admittanz und Leistung

<div id="sec:imp"></div>
<!-- !split -->
## Widerstandsoperator (1)
*u/i-Verhalten.* 
$$
\begin{equation}
\frac{\underline{u}(t)}{\underline{i}(t)} 
= \frac{\underline{\hat{U}}e^{j \omega t}}{\underline{\hat{I}}e^{j \omega t}}
= \frac{\hat{U}}{\hat{I}} e^{j(\varphi_u \varphi_i)} = \underline{Z}
\end{equation}
$$



<!-- !split -->
## Widerstandsoperator (2)
*Impedanz.* 
$$
\begin{align}
\underline{Z} &= \frac{\underline{u}(t)}{\underline{i}(t)} =
\frac{\underline{\hat{U}}e^{j \omega t}}{\underline{\hat{I}}e^{j \omega t}} =
\frac{\hat{U}}{\hat{I}}e^{\varphi_u-\varphi_i} \\
&= Z e^{j \varphi_z} = Z \left( \cos(\varphi_z) + j \sin(\varphi_z) \right) \\
&= \operatorname{Re}{\underline{Z}} + j \operatorname{Im}{\underline{Z}} \\
&= R + j X
\end{align}
$$



<!-- !split -->
## Widerstandsoperator (3)
*Eigenschaften.* 
$$
\begin{align}
Z &= \lvert\underline{Z}\lvert = \sqrt{R^2 + X^2} & &\mbox{Scheinwiderstand} \\
R &= \operatorname{Re}{\underline{Z}} & &\mbox{Wirkwiderstand (Resistanz)} \\
X &= \operatorname{Im}{\underline{Z}} & &\mbox{Blindwiderstand (Reaktanz)} \\
\tan(\varphi_z) &= \frac{\operatorname{Im}{\underline{Z}}}{\operatorname{Re}{\underline{Z}}} = \frac{X_r}{R_r}  & & \\
\varphi_z &= \varphi_u - \varphi_i = \arctan\left(\frac{X_r}{R_r}\right) & &
\end{align}
$$



<!-- !split -->
## Leitwertoperator (1)
*Harmonische Anregung.* 
$$
\begin{align}
u(t) &= \hat{U} \cos(\omega t + \varphi_u) & \underline{u}(t) &= \underline{\hat{U}} e^{j \omega t} \\
i(t) &= \hat{I} \cos(\omega t + \varphi_i) & \underline{i}(t) &= \underline{\hat{I}} e^{j \omega t}
\end{align}
$$



<!-- !split -->
## Leitwertoperator (2)
*Admittanz.* 
$$
\begin{align}
\underline{Y} &= \frac{\underline{i}(t)}{\underline{u}(t)} =
\frac{\underline{\hat{I}}e^{j \omega t}}{\underline{\hat{U}}e^{j \omega t}} =
\frac{\hat{I}}{\hat{U}}e^{\varphi_i-\varphi_u} \\
&= Y e^{j \varphi_y} = Y \left( \cos(\varphi_y) + j \sin(\varphi_y) \right) \\
&= \operatorname{Re}{\underline{Y}} + j \operatorname{Im}{\underline{Y}} \\
&= G + j B
\end{align}
$$



<!-- !split -->
## Leitwertoperator (3)
*Eigenschaften.* 
$$
\begin{align}
Y &= \lvert\underline{Y}\lvert = \sqrt{G^2 + B^2} & &\mbox{Scheinleitwert} \\
G &= \operatorname{Re}{\underline{Y}} & &\mbox{Wirkleitwert (Konduktanz)} \\
B &= \operatorname{Im}{\underline{Y}} & &\mbox{Blindleitwert (Suszeptanz)} \\
\tan(\varphi_y) &= \frac{\operatorname{Im}{\underline{Y}}}{\operatorname{Re}{\underline{Y}}} = \frac{B}{G}  & & \\
\varphi_y &= \varphi_i - \varphi_u = \arctan\left(\frac{B}{G}\right) & &
\end{align}
$$



<!-- !split -->
## $R$, $L$, $C$ &ndash; Netzwerke
*Vergleich.* 
$$
\begin{align*}
\mbox{Zeitbereich}&: & u&= i R &  u&= \frac{1}{C} \int i\, dt & u&= L \frac{di}{dt} \\
\mbox{Frequenzbereich}&: & \underline{u}&= \underline{i} R &
\underline{u}&= \frac{1}{j \omega C} \underline{i} &
\underline{u}&= j \omega L \underline{i} \\
\mbox{Impedanz}&: & \underline{Z}&= R &
\underline{Z}&= j X_C = -\frac{j}{\omega C} &
\underline{Z}&= j X_L = j \omega L \\
\mbox{Phase}&: & \varphi_Z&= 0 & \varphi_Z&= -\frac{\pi}{2} & \varphi_Z&= \frac{\pi}{2}
\end{align*}
$$



<!-- !split -->
## Leistung von Wechselsignalen (1)
*Harmonische Anregung.* 
$$
\begin{align}
u(t) &= \hat{U} \cos(\omega t + \varphi_u) & i(t) &= \hat{I} \cos(\omega t + \varphi_i) \\
&= \frac{1}{2} \left( \underline{\hat{U}} e^{j \omega t} + \underline{\hat{U}}^* e^{-j \omega t}\right) & 
&= \frac{1}{2} \left( \underline{\hat{I}} e^{j \omega t} +  \underline{\hat{I}}^* e^{-j \omega t}\right) \\
&= \operatorname{Re}{\underline{\hat{U}}e^{j \omega t}} & &= \operatorname{Re}{\underline{\hat{U}}e^{j \omega t}}
\end{align}
$$



<!-- !split -->
## Leistung von Wechselsignalen (2)
*Komplexe Leistung.* 
$$
\begin{align}
p(t) &= u(t) \cdot i(t) \\
&= \frac{1}{4} \left( \underline{\hat{U}} e^{j \omega t} +
\underline{\hat{U}}^* e^{-j \omega t}\right)  
\left(\underline{\hat{I}} e^{j \omega t} + \underline{\hat{I}}^* e^{-j \omega t}\right) \\
&= \underbrace{\frac{1}{4} \left(\underline{\hat{U}} \underline{\hat{I}}^* +
\underline{\hat{U}}^* \underline{\hat{I}} \right)}_{\mbox{zeitunabh. Anteil}} +
\underbrace{\frac{1}{4} \left( \underline{\hat{U}}
\underline{\hat{I}} e^{2j \omega t} + \underline{\hat{U}}^*
\underline{\hat{I}}^* e^{-2j \omega t}\right)}_{\mbox{zeitabh. Anteil}}
\end{align}
$$



<!-- !split -->
## Leistung von Wechselsignalen (3)
*Komplexe Leistung.* 
$$
\begin{align}
\underline{P} &= \frac{1}{4} \left(\underline{\hat{U}} \underline{\hat{I}}^* +
\underline{\hat{U}}^* \underline{\hat{I}} \right), \quad
\mbox{Momentanwert, konstanter Anteil bzw. linearer Mittelwert, Momentanleistung} \\
p(t) &= \frac{1}{2} \operatorname{Re}{\underline{\hat{U}}\underline{\hat{I}}^*} \\
&= \frac{1}{2} \operatorname{Re}{\hat{U}\hat{I} e^{j(\varphi_u-\varphi_i)}} \\
&= \frac{1}{2} \hat{U} \hat{I} \cos(\varphi_u-\varphi_i)
\end{align}
$$



<!-- !split -->
## Leistung von Wechselsignalen (4)
*Eigenschaften.* 
$$
\begin{align}
S &= \lvert\underline{P}\lvert = \sqrt{P^2 + Q^2} & &\mbox{Scheinleistung} \\
P &= \operatorname{Re}{\underline{P}} & &\mbox{Wirkleistung} \\
Q &= \operatorname{Im}{\underline{P}} & &\mbox{Blindleistung}
\end{align}
$$



<!-- !split -->
