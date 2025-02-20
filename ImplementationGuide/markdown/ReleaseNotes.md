# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

Version: 3.0.7

Datum: 20.02.2025

* `change` Die Verbindlichkeit der Suchparameter `subject`  in Communication sowie `include` (für `Communication:recipient` und `Communication:sender`) wurde von SHALL auf MAY reduziert https://github.com/gematik/spec-ISiK-Terminplanung/pull/257
* `fixed` Display Values ISiKTerminCancelationReason https://github.com/gematik/spec-ISiK-Terminplanung/pull/265
* `fixed` Korektur des Constraints zur Kardinalität im Sinne der Kohärenz mit Schedule (Kalender) auch bei Appointment.participant.actor.display https://github.com/gematik/spec-ISiK-Terminplanung/pull/263
* `fixed` Anpassung der Kardinalität von Appointment.start/end um 'proposed', 'cancelled', 'waitlist' als Status zu ermöglichen https://github.com/gematik/spec-ISiK-Terminplanung/pull/261

---


Version: 3.0.6

Datum: 19.11.2024

* Implizites ValueSet expandiert https://github.com/gematik/spec-ISiK-Terminplanung/pull/220
* Änderung der Anforderung für Suchanfrage zu Terminblöcken aus Kalendern (u.a. in Bezug auf Start-Vorgabe) https://github.com/gematik/spec-ISiK-Terminplanung/pull/200
* Kardinalität für Schedule.actor.display geschwächt https://github.com/gematik/spec-ISiK-Terminplanung/pull/216
* Änderung des Slicings der .specialty auf .specialty.coding für ISiKKalender, ISiKMedizinischeBehandlungseinheit und ISiKTermin + Schwächung Schedule.actor.display + Zulassen der .actor Reference auf Location + Schedule Schwächung des MS für ISiKNachricht https://github.com/gematik/spec-ISiK-Terminplanung/pull/215
* Revinclude nicht verpflichtend https://github.com/gematik/spec-ISiK-Terminplanung/pull/225
* Klarstellung, dass Freitextbeschreibung der Dienstleistung ausreichend ist https://github.com/gematik/spec-ISiK-Terminplanung/pull/228


----


Version: 3.0.5

Datum: 03.07.2024

* Update der IHE ValueSets zu "practiceSetting" in ISiKTermin, ISiKKalender und ISiK MedizinischeBehandlungseinheit (analog zu 2.0.5 und 4.0.0-rc2) https://github.com/gematik/spec-ISiK-Terminplanung/pull/199/commits/7218c4f9f085604e311761d5e76647d09aea04d1

----


Version: 3.0.4

Datum: 7.5.2024

* Update ISIK Basismodul Dependency to Wildcard
* Schwächung der Anforderung für ISiKBinary https://github.com/gematik/spec-ISiK-Terminplanung/pull/181

----

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
