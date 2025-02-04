## Kompatibilität zu anderen nationalen FHIR-basierten Spezifikationen

Die vorliegende Spezifikation orientiert sich teilweise an bereits vorhandenen (internationalen) FHIR-Projekten zum Thema Terminvergabe. Hier sei vorallem das [Argonaut Scheduling Project](https://fhir.org/guides/argonaut/scheduling/) hervorgehoben.

## Kompatibilität zum KBV eTerminService

Bei folgenden FHIR-Ressourcen existiert zum Zeitpunkt der Veröffentlichung eine inhatliche Überschneidung mit dem [eTerminService der KBV](https://simplifier.net/eTerminservice-R4/~introduction):

* [Patient](https://simplifier.net/eterminservice-r4/patientets) - Jede ISiK "Patient"-Instanz ist auch valide gegen das entsprechende KBV ETS Profil falls:
  * Elemente, die auf eine Kardinalität von 0..0 beschränkt sind, entfernt werden

* [Appointment](https://simplifier.net/eterminservice-r4/appointmentets-duplicate-2) - Jede ISiK "Appointment"-Instanz ist auch valide gegen das entsprechende KBV ETS Profil falls:
  * Elemente, die auf eine Kardinalität von 0..0 beschränkt sind, entfernt werden
  * Eine PractitionerRole Referenz als Akteur angegeben wird

Aufgrund von fachlichen Unterschieden in den zu unterstützenden Arbeitsabläufen sind die OperationDefinitions für die Buchung eines Termins nicht vergleichbar.