<!-- !split -->
<!-- jupyter-book 08_lec.md -->
# Resonanzkreise

<div id="sec:resonanzkreise"></div>
## Physikalische Grundlagen

* periodische Zustandsänderung in einem physikalischen System
* periodischer Energieaustausch zw. zwei unterschiedlichen Energiespeichern (potentiellen und kinetischen), z.B. Feder udn Masse, Induktivität und Kapazität
* maßgebende Zustandsgröße $x(t)$, z.B. Auslenkung, Spannung oder Ladung, folgen einer DGL

$$
\begin{align}
\ddot{x} + \omega_0 x &=0
\end{align}
$$

* harmonische Schwingung, $x(t+T_0) = x(t)$, wobei $T_0$ Periode, $\omega_0=2 \pi f_0 = 2\pi \frac{1}{T_0}$ Eigenfrequenz und $f_0$ Resonanzfrequenz
* DGL gehorcht dem Energieerhlatungssatz

$$
\begin{align}
W_{ges}(x) &= W_{pot}(x) + W_{kin}(x) = \const. \\
\tdd{W_{ges}}{t} &= \tdd{W_{pot}}{x} \tdd{x}{t} + \tdd{W_{kin}}{x} \tdd{x}{t} = 0 \\
x(t) &= x_{max} \cos(\omega_0 t + \varphi_0)\quad\mbox{Lösung}
\end{align}
$$

* Zusammenschaltung von Induktivität $L$ und Kapazität $C$ heißt (idealer) Schwing- oder Resonanzkreis

$$
\begin{align}
W_{pot} &:= \mbox{Kondensator} \\
W_{kin} &:= \mbox{Induktivität}
\end{align}
$$

* freie und erzwungene Schwingung
* ungedämpfte und gedämpfte Schwingung

## Realer (verlustbehafteter) Schwingkreis
\begin{block}{Maschengleichung}
$$
\begin{align}
      u_Q(t) &= L \tdd{i}{t} + i\, R + \frac{1}{C} \int i \di t  \\
      0 &= \tdd{i}{t^2} + \frac{R}{L} \tdd{i}{t} + \frac{1}{LC} i  \\
      i(t) &= I_0 e^{-d \omega_0 t} \cos(\sqrt{1 -d^2} \omega_0 t) \quad \mbox{Lösung}
    \end{align}
$$
\end{block}

* Dämpfung $d = \frac{1}{2 Q} = \frac{R}{\omega_0 L}$
* Güte $Q = \frac{\omega_0 \cdot \mbox{ges. Speicherenergie}}{\mbox{Verlustleistung}}$
* Reihenkreis $Q = \frac{\omega_0 L}{R} = \frac{1}{R}\sqrt{\frac{L}{C}}$
* Parallelkreis $Q = \frac{\omega_0 C}{G} = \frac{1}{G}\sqrt{\frac{C}{L}}$

## Grundeigenschaften von Reihen- und Parallelschwingkreis
\begin{block}{Reihenkreis/Impedanz}

$$
\begin{align}
      \cmplx{Z} &= R_r + j\left(\omega L_r - \frac{1}{\omega C_r}\right) \\
                &= R_r + j X(\omega) \\
      \magn{\cmplx{Z}} &= \sqrt{R_r^2 + X^2(\omega)} \\
      \arg{\cmplx{Z}} &= \arctan \frac{X(\omega)}{R_r}
    \end{align}
$$
\end{block}

\begin{block}{Parallelkreis/Admittanz}

$$
\begin{align}
      \cmplx{Y} &= G_p + j\left(\omega C_p- \frac{1}{\omega L_p}\right) \\
                &= G_r + j B(\omega) \\
      \magn{\cmplx{Y}} &= \sqrt{G_p^2 + B^2(\omega)} \\
      \arg{\cmplx{Y}} &= \arctan \frac{B(\omega)}{G_p}
    \end{align}
$$
\end{block}

* Thomsonsche Formel $\omega_0 = \frac{1}{L_rC_r} = \frac{1}{L_pC_p}$
* bei Resonanz erreichen Impedanz und Admittanz ein Minimum

$$
\begin{align}
\left . \cmplx{Z} \right\lvert_{\omega_0} &\Rightarrow \magn{\cmplx{Z}} = R_r \\
\left . \cmplx{Y} \right\lvert_{\omega_0} &\Rightarrow \magn{\cmplx{Y}} = G_p
\end{align}
$$


                     $X(\omega)$  $B(\omega)$  
-------------------  -----------  -----------  
$\omega < \omega_0$   kapazitiv     induktiv   
$\omega > \omega_0$    induktiv    kapazitiv   


## Vereinheitlichte Kennzeichnung

* Verstimmung $v$
* 3dB-Frequenz
* Bandbreite

<!-- !split -->
