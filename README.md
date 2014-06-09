StataFolien
===========

Folien zur Einführung in Stata. Diese Folien sind in der Vorbereitung auf das Sommersemester 2014 an der Ruhr-Universität Bochum entstanden. Dort sind sie in den Empiriemodulen `Empirische Arbeitsmarktforschung` und `Empirische Fragen der Familienpolitik und -ökonomik` (mit B. Hartmann) eingesetzt worden. Der Foliensatz wurde für BA-Studierende der Fakultät für Sozialwissenschaft konzipiert und orientiert sich am Wissensstand von Studierenden, die zuvor noch kein Statistikprogramm genutzt haben.

## Inhalt

Der Foliensatz ist in einzelne Sinnabschnitte (Parts) unterteilt.

* Der `Einstieg` umfasst sowohl eine Einführung in die Nutzung von Stata über den Do-File-Editor sowie einen Ausblick in erste eigene deskriptive Auswertungen. Dieser Block umfasst in etwa 90 Minuten und sollte als Eniheit abgeschlossen werden.

* `Variablen` umfasst eine Vielzahl der Grundlagen, die für die Arbeit mit Variablen notwendig sind. Generieren, umbenennen, klassifizieren und die Handhabung fehlender Werte. Dieser Block ist abermals auf 90 Minuten angelegt.

* `Grafiken` ist knapp gehalten, da Stata eine Vielzahl an Möglichkeiten bietet, die allerdings an derer Stelle besser nachgeschlagen werden können. Der Block beansprucht demzufolge nur wenig Zeit.

* Im `Fortgeschrittenen Datenhandling` werden neben einzelnen vertiefenden Elementen auch einige spezifische für die Nutzung des SOEPs notwendige Funktionen wie `merge` besprochen. Hier sind wieder 90 Minuten angedacht.

* In Statistik werden einzelne deskriptive Auswertungen in Form von Kreuztabellen und Maßzahlen besprochen. Hierbei wird sich an den in der VL Statistik I gelehrten Kenntnissen orientiert. (Weitere Folien zur linearen und logistischen Regression existieren und werden zum kommenden Semester in den Foliensatz eingepflegt.) Der abschließende Block umfasst nochmals rund 90 Minuten.

## pdflatex
Tex-Dateien sind im Ordner tex hinterlegt, Bilder in Form von eps-Dateien in images.
Das Syntaxhighlighting orientiert sich am Do-File-Editor in Version 12 und kann mittels
```
\begin{lstlisting}
// Syntaxkommentar
\end{lstlisting}
```
genutzt werden. Die dazugehörige Datei liegt im Ordner lstlisting. Die Syntax ist jeweils zwei Leerzeichen eingerückt.
Auf einzelnen Folien sind Post-its abgebildet. Diese sind normal Gelb, im Handout-Modus werden sie schwarz-weiß erzeugt.
```
  \begin{tikzpicture}[transform shape, rotate=10, overlay]
\node at (8,2) [mybox] (box) {%
    \begin{minipage}[t!]{0.35\textwidth}
    \tiny\textcolor{black}{\texttt{Beispieltext.}}
    \end{minipage}
    };
```
Die Boxen sind nicht LaTeX default und müssen deshalb ein wenig angepasst werden. Dazu dienen die zwei Zahlen hinter `\node at`. Diese Boxen sind auch der Grund für die vielen Warnings.
Abschließend wird noch ein Index erzeugt. Das ist bei Beamer kein Standard und muss deshalb erst konstruiert werden.

## Was ist mit R?
Eine Version mit R wird gerade erstellt.

