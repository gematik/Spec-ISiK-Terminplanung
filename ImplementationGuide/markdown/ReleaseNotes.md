# Release Notes

Im Rahmen der ISiK-Veröffentlichungen wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

----

Version 2.0.6

Datum: tbd.

* Erneute Änderung der Anforderung für Suchanfrage zu Terminblöcken aus Kalendern im Sinne einer Verfeinerung der Anforderung und Anpassung an Stufe 3 und 4 https://github.com/gematik/spec-ISiK-Terminplanung/pull/202
* Revinclude nicht verpflichtend https://github.com/gematik/spec-ISiK-Terminplanung/pull/226 
* Kardinalität für Schedule.actor.display geschwächt https://github.com/gematik/spec-ISiK-Terminplanung/pull/217 
* Änderung des Slicings der .specialty auf .specialty.coding für ISiKKalender, ISiKMedizinischeBehandlungseinheit und ISiKTermin + Schedule Schwächung des MS für ISiKNachricht https://github.com/gematik/spec-ISiK-Terminplanung/pull/222

----

Version 2.0.5

Datum: 20.06.2024

* Ändern der ValueSets von IHE https://github.com/gematik/spec-ISiK-Terminplanung/pull/186
* Änderung der Anforderung für Suchanfrage zu Terminblöcken aus Kalendern https://github.com/gematik/spec-ISiK-Terminplanung/pull/190

----

Version: 2.0.4

Datum: 29.11.2023

* remove releasematrix by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/106
* Link fix stufe2 by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/117
* fix parameter name by @f-peverali in https://github.com/gematik/spec-ISiK-Terminplanung/pull/119
* reference to R4 by @MaxMTheilig in https://github.com/gematik/spec-ISiK-Terminplanung/pull/152


**Full Changelog**: https://github.com/gematik/spec-ISiK-Terminplanung/compare/v.2.0.3...v2.0.4

----


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