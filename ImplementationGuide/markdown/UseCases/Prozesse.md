# {{page-title}}

Ein Terminbuchungsprozess in einem Krankenhaus kann sowohl automatisierte als auch manuelle Zwischenschritte umfassen, um eine nahtlose Terminbuchung und Terminwahrnehmung für Patienten zu gewährleisten. Hier finden sich Skizzen zu einem entsprechenden Prozessen.

## Allgemeiner Prozess (Übersicht)

Ein grobes Prozessmodell gewährt eine Übersicht zu drei möglichen Sub-Prozessen der Terminbuchung:

{{render:Material/images/diagrams/prozess-allgemein.png}}

## Registrierung und Terminbuchung (happy path)

Folgendes BPMN-Diagramm gibt eine Übersicht zu einer Terminbuchung durch einen User mittels Patientenportal:

{{render:Material/images/diagrams/patient-terminbuchung-bpmn.png}}

Folgendes Sequenzdiagramm detailliert den Ablauf unter Berücksichtigung der Akteure Termin Requestor (z.B. Patientenportal) und Termin Repository (z.B. KIS); 
offen bleibt hier allerdings noch der Ablauf zum Austausch von Patientendaten zwischen den Systemen:
 
{{render:Material/images/diagrams/patient-buchung-sequenz.png}}


## Identitätsnachweis der Patienten

Insbesondere zur nahtlosen Integration von Prozessen über verschiedene Systeme (z.B. Patientenportal und KIS), die sich in gekapselten Zugriffsumgebungen befinden, sind Workflows zum Identitätsnachweis von Patienten unabdinglich.

Folgende Alternativen zum Identitätsnachweis können schematisch angeführt werden:

{{render:Material/images/diagrams/identitaetsnachweis-bpmn.png}}

Insbesondere für die Verifizierung des Patienten im Laufe der Registrierung im Patientenportal soll hier ein Workflow vorgestellt werden, der einem künftigen Happy Path zur Terminbuchung samt Datenaustausch über eine validierte Patienten-Identität und zugehöriger Daten (in Portal und KIS) entspricht. 
Der Nachweis-Workflow soll die Übernahme validierter Patienten-Identitäten unter der Annahme von Read-Only Operationen (GET) zwischen den daten-führenden Systemen zur Übernahme sowie vorgelagerter Identifizierung eines Patienten mittels IDP (z.B. gID) skizzieren:

{{render:Material/images/diagrams/identitaetsnachweis-sequenz.png}}