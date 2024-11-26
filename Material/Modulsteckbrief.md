# Terminplanung

## Kurzbeschreibung
Das Modul Terminplanung umfasst alle Datenmodule die notwendig sind, um eine Abfrage für eine Behandlungsleistung inkl. anschließender Terminvereinbarung durchzuführen. Die Terminvereinbarung ist durchführbar durch die Patientinnen und Patienten oder deren vorgelagerten Leistungserbringern.

Dies umfasst:

- Abbildung von verfügbaren teil- und voll- stationäre Behandlungen (Hinweis KHZG: Dies schließt Leistungen der spezialärztlichen Versorgung (ASV) im Krankenhaus nach § 116b SGB V mit ein, sofern diese durch das Krankenhaus angeboten werden.)
- Abfrage von verfügbaren Terminen
- Buchungsmanagement von verfügbaren Terminen (Zusage, Absage, Temporäre Buchung, Wiederholende Termine)
- Benachrichtigungen bei Terminänderungen
- Anlage eines neues Patienten im KIS (Übermittelung Patient/Coverage Informationen)

## Bezug KHZG
Fördertatbestand 2: Patientenportale (§ 19 Abs. 1 Satz 1 Nr. 2 KHSFV): Terminplanung

Auszug Förderrichtlinie nach § 21 Abs. 2 KHSFV 4.3.2.1. Digitales Aufnahmemanagement:

```
Das digitale Aufnahmemanagement soll Patientinnen und Patienten bereits im Vorfeld ihres Krankenhausaufenthalts entlasten. 
Es soll möglich werden, dass Patientinnen und Patienten online ihre notwendigen Daten selbst erfassen, aber auch (Behandlungs-) Entscheidungen in ihrer gewohnten Umgebung treffen können – abseits der Stresssituation innerhalb des Kran- kenhauses. 
Darüber hinaus wird das Ziel verfolgt, auch die Mitarbeiterinnen und Mitarbeiter in der Organisation der administrativen sowie der stationären Aufnahme durch den Einsatz digitaler Dienste zu entlasten, sowie die Kommunikation zu vorgelagerten Leistungserbrin- gern effizienter zu gestalten.
```

```
Ein digitales Aufnahmemanagement muss:
- es den Patientinnen und Patienten oder deren vorgelagerten Leistungserbringern er- möglichen, Termine für ambulante Versorgungsleistungen (u.a. Untersuchungen im Rahmen der Vor- und Nachsorge), online zu vereinbaren sowie für die teil- und voll- stationäre Behandlung online anzufragen und abzustimmen. 
Dies schließt Leistungen der spezialärztlichen Versorgung (ASV) im Krankenhaus nach § 116b SGB V mit ein, sofern diese durch das Krankenhaus angeboten werden.
```

## Stakeholder

* bvitg 
* KBV

## Relevante Spezifikationen
- [Argo-Scheduling Implementation Guide Release 1.0.0](https://fhir.org/guides/argonaut/scheduling/index.html)
- [KBV eTerminservice](https://simplifier.net/eterminservice)
- [SMART Scheduling Links](https://github.com/smart-on-fhir/smart-scheduling-links)

## Datenobjekte/FHIR-Ressourcen
### aus anderen Modulen

* Patient (Basis)
* Coverage (Basis)

### neue Datenobjekte

* Appointment (Termin den ein Patient/Leistungserbringer buchen kann)
* ~~AppointmentResponse (Antwort auf eine Terminanfrage)~~ (AppointmentResponse wird nicht weiter betrachtet, da dies nur system-intern für das bestätigungsrelevante System notwendig wäre)
* Slot (Verfügbare Zeiteinheit in der Termine gebucht werden können)
* Schedule (Container für Slots)
* HealthcareService (Behandlungsleistung verfügbar an Standort X)


## Potentielle Probleme/Risiken
* KIS muss Schnittstelle mit Schreibrechten zur Verfügung stellen (Anlegen eines neues Patienten/Coverage)
* Komplexe Workflows für interne Terminbuchungen sind unbekannt => Feedback von Hersteller bestätigungsrelevanter System notwendig
* Kodierung der Behandlungsleistungen unbekannt => Feedback von Hersteller bestätigungsrelevanter System notwendig

## Anwendungsfälle

### Anwendungsfälle im Patientenportal

Einbindung des Patienten vor, während und nach dem Besuch/Aufenthalt
* Die Beteiligung des Patienten in einem Patientenportal kann nur erfolgen, wenn die notwendigen Trigger vom KIS an das
Patientenportal übermittelt werden
  * Termin mit Besuchsgrund und Fachrichtung
  * Klinischer Auftrag mit angeforderter Leistung / Prozedur
* Aufgaben für den Patient können im Patientenportal in Abhängigkeit von Besuchsgrund, Fachrichtung, Prozedur definiert
werden:
  * Formular, Fragebogen Ausfüllen
  * Dokument teilen/hochladen
  * Dokument lesen und ggf. signieren
  * Anstoßen von weiteren Prozessen
* Patientenkommunikation
  * Terminbestätigungen und -Erinnerungen vom Patientenportal an den Patienten senden

### Anwendungsfälle Online-Terminierung

24/7 Terminbuchungen durch Patienten und Überweiser
* Terminbuchung durch den Patienten
  * Online-Terminbuchung
  * Integration von Apps für Sprach- & Textgesteuerte Terminbuchung (z.B. Chat-Bot)
* Terminbuchung durch einen Überweiser
  * Kalenderfreigaben für Terminbuchungen durch Überweiser
  * Online-Terminbuchung
  * Übermittlung des Überweisungsscheins
* Mehrwert durch Online-Buchung: Entlastung der Praxis- und Krankenhausmitarbeiter

### Anwendungsfälle Terminverwaltungssystem

Terminbuchung und Terminmanagement durch medizinisches Personal
* Terminbuchungen außerhalb des KIS durch Werkzeuge von 3. Anbieter
  * Multi-Ressourcen Planung
  * Unterstützung komplexer Terminierungszenarien, z.B.:
     * Kettentermine
     * Terminanfragen und Terminbestätigungen
     * Patientenflusssteuerung & Optimierung der Ressourcen-Auslastung
  * Unterstützung mobiler Endgeräte für Terminierung und Verwaltung
  * Terminbestätigungen und -Erinnerungen vom Patientenportal an den Patienten senden
* Kalender UI Optimierung zur bestmöglichen Planungsunterstützung der Anwender
* Terminbuchungen und Verwaltung über internes oder externes Call-Center
