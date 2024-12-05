# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Version 4.0.2

Datum: tbd.

* ´improve´ Falscher Satz über keine notwendige Verbindlichkeit entfernt und Formulierung verbessert https://github.com/gematik/spec-ISiK-Terminplanung/pull/248

---

Version 4.0.1

Datum: 02.12.2024

* Implizites ValueSet expandiert https://github.com/gematik/spec-ISiK-Terminplanung/pull/207
* Dokumentation zur Begründung der Kardinalitäten und Must-Support-Flags ergänzt https://github.com/gematik/spec-ISiK-Terminplanung/pull/209
* Für ISiKTermin Verschiebung des Slicing auf .specialty.coding. https://github.com/gematik/spec-ISiK-Terminplanung/pull/204
* Kardinalität für Schedule.actor.display geschwächt https://github.com/gematik/spec-ISiK-Terminplanung/pull/206
* Anforderungen an die Kodierung von Appointment/Schedule.serviceType geschwächt https://github.com/gematik/spec-ISiK-Terminplanung/pull/227
* Schwächung der Kardinalität von actor.display im Profil StructureDefinition-ISiKTermin https://github.com/gematik/spec-ISiK-Terminplanung/pull/233
 * Ergänzung von Anforderungen an Akteure https://github.com/gematik/spec-ISiK-Terminplanung/pull/236
 * Fix der Canonical URL im Capability-Statement des Terminplanungsserver https://github.com/gematik/spec-ISiK-Terminplanung/pull/238
 * Hinzufügen der Extension "Appointment Replaces" zum Profil ISiKTermin https://github.com/gematik/spec-ISiK-Terminplanung/pull/242
 * Update der Dependency de.ihe-d.terminology auf Version 3.0.1 https://github.com/gematik/spec-ISiK-Terminplanung/pull/240
* Korrektur des Extension Kontext in ISiKKalender https://github.com/gematik/spec-ISiK-Terminplanung/pull/239
* Aktualisierung der Operation ISiKBookOperation https://github.com/gematik/spec-ISiK-Terminplanung/pull/245

----

Version 4.0.0

Datum: 01.10.2024

* Aktive Version ohne weitere Änderungen 

----

Version 4.0.0-rc2

Datum: 26.6.2024

* Schwächung der Anforderung für ISiKBinary (entspricht Änderung in TC 3.0.4) https://github.com/gematik/spec-ISiK-Terminplanung/pull/187 
* Anpassen der MS-Definition für Appointment.communication https://github.com/gematik/spec-ISiK-Terminplanung/pull/191
* Update der IHE ValueSets zu "practiceSetting" in ISiKTermin, ISiKKalender und ISiK MedizinischeBehandlungseinheit https://github.com/gematik/spec-ISiK-Terminplanung/pull/184/files
* Klarstellung, dass unbekannte Kodierungen in .serviceType abgewiesen werden können https://github.com/gematik/spec-ISiK-Terminplanung/pull/195
* Änderung der Anforderung für Suchanfrage zu Terminblöcken aus Kalendern https://github.com/gematik/spec-ISiK-Terminplanung/pull/193

----

Version 4.0.0-rc

Datum: 4.4.2024

* Location als Aktuer eines Kalenders hinzugefügt, da in ISiK Basis Stufe 4 vorhanden by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/178
* Update $book: Verschiebung eines Termins by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/174
* Dependency zu IHE-Package zwecks Auflösung von ValueSets hinzugefügt https://github.com/gematik/spec-ISiK-Terminplanung/pull/175
* Erweiterung von ISiKTermin zur Abdeckung der Kommunikations-Use-Cases und Hinweise zu letzteren https://github.com/gematik/spec-ISiK-Terminplanung/pull/173
* Klarstellung hinzugefügt, dass Terminkalender im Kontext eines Leistungserbringers abgefragt werden können
  * Hinweis zur Abfrage von Behandlungsleistungen im Kontext eines Behandlers @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/87
* Präzisierung book-Operation https://github.com/gematik/spec-ISiK-Terminplanung/pull/177
* Hinweis zur Abfrage von Behandlungsleistungen im Kontext eines Leistungserbringers by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/144
* Fix CpS by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/179
* Klarstellung cancelled-appt-id by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/177

**Full Changelog**: https://github.com/gematik/spec-ISiK-Terminplanung/compare/v3.0.3...v.4.0.0-rc

----

Version: 3.0.4

Diese Technical Correction entfällt für Stufe 4, da die Änderungen direkt in Stufe 4 (4.0.0-rc2) eingebracht sind.

---

Version: 3.0.3

Datum: 25.3.2024

* Reduzierung der Anforderung für ISiKNachricht https://github.com/gematik/spec-ISiK-Terminplanung/pull/172
* Präzisieren der Suchparameter-Anforderungen für Slot : https://github.com/gematik/spec-ISiK-Terminplanung/pull/168
* Präzisieren der Anforderungen für Encounter: https://github.com/gematik/spec-ISiK-Terminplanung/commit/d596744d910fd39b421fc7f6f97f73edf471d47a 
* Präzisierung informativ zu ISiKMedizinischeBehandlungseinheit (HealthcareService) https://github.com/gematik/spec-ISiK-Terminplanung/pull/176
* Update Dependency des Basismoduls auf 3.0.4

----

Version: 3.0.2

Datum: 03.01.2024

* Update ISiK Basismodul Dependency -> 3.0.1
* Klärung zur Verwendung der Binary: add link for clarification by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/156
* CapabilityStatement Anforderungen entsprechend angepasst: fix CpS Encounter Read and Search interaction by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/154
* Klärung zur Verwendung der Ressourcen aus dem Basismodul: Feature/ptdata 723 update interactions by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/158
* Klärung zur Nutzung der ISiKNachricht;  Feature/clarify bidirectional anfisk 178 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/160

**Full Changelog**: https://github.com/gematik/spec-ISiK-Terminplanung/compare/v3.0.1...v3.0.2

----
Version: 3.0.1

Datum: 30.10.2023

Mit dem Release der Stufe 3.0.1 werden die unten gelisteten Änderungen normativ festgesetzt.

* Fixing KalenderName extension name ISiKKalenderSchedule.md by @alexey-tschudnowsky in https://github.com/gematik/spec-ISiK-Terminplanung/pull/110
* Fix Suchparameter "content-mode" zu "context-type-value" by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/120
* Anpassung CapabilityStatement an die textuelle Beschreibung der verpflichtenden Interaktionen by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/125
* Informative Anmerkung für den Fall, dass .extenstion:name nicht verfügbar ist by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/129
* Anpassung Sequenzdiagramme by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/127 
* Example Canonical für Behandlungsleistung angepasst by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/134
* Abfrage aller verfügbaren Slots für Kalender durch Termin-Requestor by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/135
* Verwendung realistische Dauer für einen Slot in den Beispielen by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/137
* Angleichung der Regeln zu meta.tag in Appointments by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/136
* Fix HTTP return code by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/131
* Hinweis zur Abfrage von Behandlungsleistungen hinzugefügt by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/139
* BookOperation Anforderung von KANN zu SOLLTE by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/143
* Austausch der Communication/Binary-Ressourcen genauer beschrieben by @alexzautke in https://github.com/gematik/spec-ISiK-Terminplanung/pull/140
* Enhancement: Appointment and Slot reference MS by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/133


**Full Changelog**: https://github.com/gematik/spec-ISiK-Terminplanung/compare/v.2.0.3...v3.0.1



----
Version: 3.0.0

Datum: 01.07.2023

* Mit dem Release der Stufe 3.0.0 werden die unten gelisteten Änderungen normativ festgesetzt.

----
Version: 3.0.0-rc2

Datum: 31.05.2023

* ISiKTerminAppointment
  * Änderung zu Appointment.serviceType aus 3.0.0-rc1 (Kommentierung) wurde zurückgezogen
    * wurde  revert Changes for Appointment.serviceType #88 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/89
  * Eine IG Seite zur Encounter Beschreibung für Terminplanung wurde hinzugefügt
    * Encounter Beschreibung für Terminplanung by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/87
  * Mehrere Slots müssen nicht mehr  ein und denselben Schedule referenzieren
    * rm cosntraint: allow different Schedules #82 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/92
  * Die Änderung zu Appointment.specialty wurde um eine textuelle Vorgabe zum MS ergänzt
    * add MS + textual constraint #72 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/91
* Operations: statt eines Bundle reicht als Return-Wert ein Appointment
  * update return Ressources #85 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/93

----
Version: 3.0.0-rc1

Datum: 04.04.2023

* ISiKTerminKontaktMitGesundheitseinrichtung - by @f-peverali in <https://github.com/gematik/spec-ISiK-Terminplanung/commit/9f523157682bd26a304f388a6f0d7c91a91811da> : Entfernen des Profils da kein integraler Use Case für Terminvereinbarung und Inkompatibilität zum ISiK Basisprofil
* ISiKNachricht: Hinweis zum Thema Sicherheit eingefügt. Ohne weitere Maßnahmen können über ISiKNachricht keine medizinischen Daten ausgetauscht werden. Hierfür sollte daher bevorzugt die ePA verwendet werden.
* ISiKTermin - Enhancement/appointment by @jcaumann in <https://github.com/gematik/spec-ISiK-Terminplanung/pull/79> :
  * Kardinalität der Elemente Appointment.specialty und Appointment.serviceType von 1..* auf 0..* geändert. MustSupport dieser Elemente von "true" auf "false" geändert.
    * FHIR erlaubt die Anlage von Appointments ohne Bindung an einen Slot und außerhalb des Worksflows über einen Kalender. Dies kann z.B. auch dann erforderlich sein, wenn ein Termin außerhalb der definierten Slots per Telefon vereinbart und dann in das System eingespeist wird. In diesem Fall findet keine "Vererbung" von serviceType und specialty aus einem Kalender statt. Die Person, die den Termin in das System einträgt sollte hier selbst entscheiden können, welche Attribute sie explizit angibt und welche sich implizit aus dem Kontext erschließen.
    * ISiK Terminblöcke referenzieren auf Kalender, die auch andere als ISIK Kalender sein können. Damit ist nicht sichergestellt, dass eine durchgängige, automatische "Vererbung" von specialty und serviceType über Schedule und Slot in ein Appointment möglich ist (in FHIR Schedule und ISiK Terminblock ist die Kardinalität jeweils "0..*", d.h. diese Angaben können auch gänzlich fehlen).
  * Kongruenz der Angaben in Appointment.start/end und Appointment.slot.start/end von MUSS auf SOLL herabgestuft.
    * s.o. Bei off-band-Buchungen wird eine gewisse Flexibilität im Umgang mit dem Kalender benötigt.
  * Hinweise zu den erwarteten Ergebnissen bei Suchanfragen auf "sepcialty" und "serviceType" in Fällen, bei denen diese Elemente keinen Wert haben.
* ISiKBookOperation : Für die Abbildung eines manuellen Buchungsprozesses wurden die Vorgaben zu den Return Values beim Appointment.status um "pending" erweitert
  * in  Enhancement/appointment by @jcaumann in <https://github.com/gematik/spec-ISiK-Terminplanung/pull/79>

**Full Changelog**: <https://github.com/gematik/spec-ISiK-Terminplanung/compare/master...3.0.0-rc1>

____
Version: 2.0.3

Datum: 24.03.2023

* enhancement: backport extension r5 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/61
  * ISiKKalender - Harmonisierung mit den Empfehlungen der Basisprofile DE
* quickfix: typo IG by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/63


**Full Changelog**: https://github.com/gematik/spec-ISiK-Terminplanung/compare/v2.0.2...v.2.0.3

----
Version: 2.0.2

Datum: 31.01.2023

- ISiKTerminblock
  - Reference(Schedule) statt Reference(ISiKKalender). Reference-Element erweitert auf die Kernspezifikation (entspricht allgemeinem Design-Prinzip), damit die Profile auch außerhalb des ISiK-Kontextes nutzbar sind.
- Update Basismodul Dependency -> 2.0.4
- weitere Änderungen an IG (informativ)

----
Version: 2.0.1

Datum: 31.10.2022

- Update Basismodul Dependency -> 2.0.2

----
Version: 2.0.0

Datum: 30.06.2022

- Initialer Release

----
Version: 2.0.0 (Ballotierung)

Datum: 31.03.2022
 - Initiale Ballotierungsversion für ISiK Stufe 2

----
