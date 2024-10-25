# Interaktionen und Search Types

Innerhalb des ISiK-Moduls Terminplanung kann ein beteiligtes System verschiedene Rollen einnehmen und somit unterschiedliche Aufgaben übernehmen. In Anlehnung an IHE HMW werden im Folgenden diese Rollen mithilfe der Definition von Akteuren formalisiert und die Interaktionen zugeordnet.

Es ist zu beachten, dass in vielen Fällen ein Terminmangementsystem aus unterschiedlichen Modulen besteht, die mehreren oder allen der genannten Akteure entsprechen:
* Ein **Termin Repository**, da das System das terminführende System ist
* Ein **Termin Requestor**, um intern im System einen Termin zu vereinbaren
* Ein **Termin Consumer** um eine Übersicht der vereinbarten Termine anzuzeigen

# Search Includes and Reverse Includes

Damit diese Akteure sinnvoll miteinander kommunizieren, wird im Folgenden ein grafischer Überblick über die in diesem Modul zu definierten Suchparameter und Operationen gegeben.
Da es sich um eine Zusammenfassung handelt, gelten Bedingungen für die gezeigten Inhalte:
* Alle Must-Support Elemente einer Componente müssen von den entsprechenden Systemen suchbar sein. Diese sind hier nicht erneut aufgezählt.
* Ein Doppelpunkt meint den Zugriff auf ein Element des beinhaltenden Profils.
* Das Elemente hinter einem Doppelpunkt besitzt wiederum die Suchparameter (alle Must-Support Elemente!), die hier in die Suchsyntax zu inkludieren sind.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/rc/main-stufe-4/Material/images/diagrams/searchtypes_interaction.svg" class="center" alt="Searchtypes" width="90%"/>