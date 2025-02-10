# {{page-title}}

Ein Terminbuchungsprozess in einem Krankenhaus kann sowohl automatisierte als auch manuelle Zwischenschritte umfassen, um eine nahtlose Terminbuchung und Terminwahrnehmung für Patienten zu gewährleisten. Hier finden sich Skizzen zu entsprechenden Prozessen.


## Allgemeiner Prozess (Übersicht)

Ein grobes Prozessmodell gewährt eine Übersicht zu drei möglichen Sub-Prozessen der Terminbuchung:

{{render:Material/images/diagrams/process-allgemein.svg}}

## Registrierung und Terminbuchung (happy path)

Folgendes BPMN-Diagramm gibt eine Übersicht zu einer Terminbuchung durch einen User mittels Patientenportal:

{{render:Material/images/diagrams/patient-terminbuchung-bpmn.png}}

Folgendes Sequenzdiagramm detailliert den Ablauf unter Berücksichtigung der Akteure Termin Requestor (z.B. Patientenportal) und Termin Repository (z.B. KIS); 
offen bleibt hier allerdings noch der Ablauf zum Austausch von Patientendaten zwischen den Systemen:
 
{{render:Material/images/diagrams/patient-buchung-sequenz.png}}

Einzelne Interaktionen, die in diesem Sequenzdiagramm skizziert werden und für die der vorliegende Implementierungsleitfaden spezifischere Festlegungen trifft, sind unter {{pagelink:ImplementationGuide/markdown/UseCases/Interaktionen.md, text:Interaktionen}} gelistet.


## Identitätsnachweis der Patienten

Insbesondere zur nahtlosen Integration von Prozessen über verschiedene Systeme (z.B. Patientenportal und KIS), die sich in gekapselten Zugriffsumgebungen befinden, sind Workflows zum Identitätsnachweis von Patienten unabdinglich.

Folgende Alternativen zur Erbringung eines Identitätsnachweises können schematisch angeführt werden:

{{render:Material/images/diagrams/identitaetsnachweis-bpmn.png}}

Insbesondere für die Verifizierung des Patienten im Laufe der Registrierung im Patientenportal soll hier ein Workflow vorgestellt werden, der einem künftigen Happy Path zur Terminbuchung samt Datenaustausch über eine validierte Patienten-Identität und zugehöriger Daten (in Portal und KIS) entspricht. 
Der Nachweis-Workflow soll die Übernahme validierter Patienten-Identitäten unter der Annahme von Read-Only Operationen (GET) zwischen den daten-führenden Systemen zur Übernahme sowie vorgelagerter Identifizierung eines Patienten mittels IDP (z.B. gID) skizzieren:

{{render:Material/images/diagrams/identitaetsnachweis-sequenz.png}}

Die Abfragen von Patientendaten gegenüber dem Basis-Server dienen anknüpfenden Workflows (z.B. zur Bereitstellung von Dokumenten, Vitaldaten etc.). Das Zugriffsmanagement bleibt bei dieser Skizze jedoch noch offen.