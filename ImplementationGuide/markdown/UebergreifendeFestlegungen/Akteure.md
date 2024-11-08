## {{page-title}}

Innerhalb des ISiK Moduls Terminplanung kann ein beteiligtes System verschiedene Rollen einnehmen und somit unterschiedliche Aufgaben innerhalb der im Abschnitt {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/Interaktionen.md}} definierten Arbeitsabläufe übernehmen. Im Weiteren werden diese Rollen mithilfe der Definition von Akteuren formalisiert, sodass eine Zuordnung von relevanten Interaktionen zum jeweiligen Akteur erfolgen kann.

Grundsätzlich wird als Terminblock eine für einen Termin buchbare Zeiteinheit verstanden, in der bestimmte Ressourcen (z.B. Fachabteilungen, Personen im Gesundheitswesen, Geräte, Räume) zur Verfügung stehen. Übergreifend über ein oder mehrere Terminblöcke hinweg kann für diese Ressourcen anschließend ein Termin vereinbart werden.

### Termin Repository

**Definition:**

Als Termin Repository werden alle Systeme definiert, die Informationen zu verfügbaren Termineinheiten von Ressourcen (vgl. zuvor genannte Definition) vorhalten und die dafür vereinbarten Termine als führendes System verwalten.

Das Termin Repository kann intern in ein Repository für die Termine und ein separates Repository für die buchbaren Terminblöcke (Terminblock Repository) geteilt werden.

**Beispielsysteme:**

* Patientenportal im Falle, dass das System selbst terminführend ist
* KIS / KAS inkl. Terminverwaltung 

### Termin Requestor / Termin Source

**Definition:**

Als Termin Requestor (in Anlehnung an die IHE Terminologie auch als Termin Source zu bezeichnen) werden alle Systeme definiert, die zur Erhebung, Erfassung, Anpassung oder Veränderung von Termininformationen dienen. Ein Termin Requestor verfügt über keine permanente Persistierung der verarbeiteten Informationen. Der Termin Requestor übernimmt die Koordination der Schnittstellenaufrufe, um einen Termin zu buchen. 

**Beispielsysteme:**

* Patientenportal im Falle, dass ein externes System das terminführende System ist

### Termin Consumer

**Definition:**

Als Termin Consumer werden alle System definiert, die Termininformationen abfragen, um diese einem Benutzer zu präsentieren. Ein Termin Consumer verfügt über keine permanente Persistierung der abgefragten Informationen. Durch den Termin Consumer erfolgt explizit nur die Aufbereitung und Präsentation der Termininformationen. Eine anderweitige Verarbeitung der Termininformationen fällt in die Kategorie der anderen Akteure.

**Beispielsysteme:**

* Apps zum Anzeigen eines Kalenders
* Backendsysteme zum Versenden von Benachrichtigungen im Kontext eines Termins
* Ressourcenmanagementsoftware

### Übersicht der Akteure

Es sei zu beachten, dass in vielen Fällen ein Terminmangementsystem aus unterschiedlichen Modulen besteht, die mehreren oder allen der genannten Akteure entsprechen:
1. Ein Termin Repository, da das System das terminführende System ist
2. Ein Termin Requestor, um intern im System einen Termin zu vereinbaren
3. Ein Termin Consumer um eine Übersicht der vereinbarten Termine anzuzeigen

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/main-stufe-3/Material/images/diagrams/akteure_1.svg" alt="Übersicht Termin Akteure 1" width="90%"/>

Darüber hinaus kann auch der Fall eintreten, dass ein Termin Repository als Termin Requestor interagiert. In diesem Fall ist das Termin Repository (z.B. ein Patientenportal) das terminführende System und übermittelt die vereinbarten Termine einem weiteren (internen) Termin Repository zur Synchronisation.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/main-stufe-3/Material/images/diagrams/akteure_2.svg" alt="Übersicht Termin Akteure 2" width="90%"/>