## ISiKMedizinischeBehandlungseinheit [(HealthcareService)](https://hl7.org/fhir/R4/healthcareservice.html)

---

### Motivation

Unter einer medizinischen Behandlungseinheit wird hier im weiten Sinne eine Dienstleistung (diagnostisch, therapeutisch, im weiten Sinne gesundheitsfördernd etc.) zum Zweck einer Terminbuchung verstanden. Hierfür können von der Fachabteilung (Organization) unabhängige Kalender gepflegt werden. Im Kontext der Terminplanung können somit angebotene Leistungen (z.B. CT/MRT-Untersuchungen, chirurgische Eingriffe, Beratungsstunden zur Geburt etc.) abgebildet werden.

Der Kontext zu diesem Profil wird mit folgender User Story veranschaulicht: 

**User Story**: Ein Patient erhält von seiner Hausärztin einen Überweisungsschein für eine weitere diagnostische Untersuchung in Form einer Kapselendoskopie der Speiseröhre. Der Patient nutzt ein Patientenportal, um unter Angabe der benötigten diagnostische Leistung nach einem verfügbaren Termin zu suchen und findet einen passenden Termin bei der Fachabteilung für Gastroenterologie eines örtlichen Krankenhauses.

Hintergrund: Die Suche nach verfügbaren Terminenblöcken (Slot) unter Einbeziehung der Dienstleistung entspricht der Angabe des Überweisungsscheins, ermöglicht hier zugleich eine präzisere Suche und vergrößert darüber hinaus den Raum möglicher Termine über verschiedene Abteilungen (und Institutionen im Patientenportal) hinweg.


---

### Kompatibilität

Siehe {{pagelink:ImplementationGuide/markdown/UseCases/Kompatibilitaet.md, text:Kompatibilität}}.

---

### FHIR-Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit' for differential.element.constraint select key, severity, human, expression```


Die Verknüpfung mit anderen Parametern, wie beteiligten Akteuren, erfolgt über ISiKTermin (Appointment) oder ISiKKalender (Schedule).


---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKMedizinischeBehandlungseinheit' )
for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
  Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
  Strength: strength,
  URL: valueSet
}
```

---

### Anmerkungen zu Must-Support-Feldern

### `HealthcareService.active`

**Bedeutung:** Ist der HealthcareService in aktiver Verwendung.

**Hinweis:** Historische HealthcareServices können ebenfalls über die ISiK-Schnittstelle ausgetauscht werden. Für diese dürfen jedoch keine Termine vereinbart werden. Das terminführende System MUSS dies bei der Buchung überprüfen.

### `HealthcareService.type`

**Bedeutung:** Klassifikation der Behandlungsleistung welche durch den HealthcareService erbracht wird

**Hinweis:** Diese Klassifikation SOLL stets auch in Appointment.serviceType und Schedule.serviceType angegeben werden. Seitens der aktuellen Spezifikation werden keine Vorgaben bezüglich der zu verwendenden Terminologie gemacht. Entsprechend verwendete Kataloge müssen als CodeSystem- und ValueSet-Ressourcen exponiert werden. Siehe [Suchparameter "context-type-value" in ISiK Basis - Datenobjekt ValueSet](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_ValueSet?version=current).

### `HealthcareService.specialty`

**Bedeutung:** Fachrichtung der Behandlungsleistung welche durch den HealthcareService erbracht wird

**Hinweis:** Diese Fachrichtung SOLL stets auch in Appointment.specialty und Schedule.specialty angegeben werden.

### `HealthcareService.name`

**Bedeutung:** Informeller Name der Behandlungseinheit

**Hinweis:** Es wird im Rahmen dieser Spezifikation davon ausgegangen, dass für einen HealthcareService keine natürlichen Identifier vorliegen, die in einem realen Kontext vergeben werden. Somit kann durch den Namen ein informeller, jedoch identifizierender Bezeichner vergeben werden.

---

### Interaktionen

Für die Ressource HealthcareService MUSS die REST-Interaktion "READ" implementiert werden.

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/HealthcareService?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "active" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/HealthcareService?active=true```

    Anwendungshinweise: Weitere Informationen zur Suche nach "HealthcareService.active" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "service-type" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/HealthcareService?service-type=http://example.org/fhir/CodeSystem/ScheduleServiceType|CT```

    Anwendungshinweise: Weitere Informationen zur Suche nach "HealthcareService.type" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "specialty" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/HealthcareService?specialty=urn:oid:1.2.276.0.76.5.114|535```

    Anwendungshinweise: Weitere Informationen zur Suche nach "HealthcareService.specialty" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "name" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/HealthcareService?name=Medizinische Behandlungseinheit Des Fachbereichs 0100```

    Anwendungshinweise: Weitere Informationen zur Suche nach "HealthcareService.name" finden sich in der [FHIR-Basisspezifikation - Abschnitt "string"](https://www.hl7.org/fhir/R4/search.html#string).

---

### Beispiele

{{json:ISiKMedizinischeBehandlungseinheitExample}}