## Funktionentheorie 
Der Kurs zur [Funktionentheorie in Wikiversity](https://de.wikiversity.org/Kurs:Funktionentheorie) verwendet für einzelne Lerneinheiten OpenSource-Software für die Visualisierung.
Diese sind:
* Die [Statistiksoftware R](https://www.r-project.org/) (Linux/Windows/Mac) mit dem [Paket KnitR](https://de.wikiversity.org/KnitR) (siehe https://github.com/yihui/knitr Code-Repository), um Dokumente mit mathematischen Formeln mit ausführbaren Code zur Berechnung von Ableitungen und Stammfunktionen höherer Ordnung in das Textdokument zu erhalten. Dabei wird verwendet, dass R den Datentyp der komplexen Zahl besitzt und z.B. Funktionen mit komplexen Zahlen als Argument unter Verwendung von `Ryacas` als Computeralgebrasystem (CAS) berechnet werden können.
```R
myfct <- function (z,n=1,c=1) {
    # Parameter
    # n ist der Exponent bzw. Grad des Polynoms
    # c ist eine Konstante des Polynoms
    return(c*z^n)
}

## der folgende Funktionsaufruf berechnet den Wert von 1/4 * (2+4i)^4 = -28-96i
myfct(2+4i,n=4,c=1/4)
```
* [wxMaxima](https://wxmaxima-developers.github.io/wxmaxima/) mit [Maxiama CAS](https://maxima.sourceforge.io/) als Computeralgebrasystem - (Linux/Windows/Mac) 
