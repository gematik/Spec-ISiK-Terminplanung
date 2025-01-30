## ISiKKalender [(Schedule)](https://hl7.org/fhir/R4/schedule.html)

---

### Motivation

Das Datenobjekt ISiKKalender bietet die Möglichkeit Kalender für verschiedene Akteure (Practitioner, Device, HealthcareService) zu exponieren, sodass für die Ressourcen Termine gebucht werden können.

---

### Kompatibilität

Siehe {{pagelink:ImplementationGuide/markdown/UseCases/Kompatibilitaet.md, text:Kompatibilität}}.

---

### FHIR-Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKKalender' )
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

### `Schedule.extension:KalenderName`

**Bedeutung:** Gebräuchlicher Name des Kalenders

**Hinweis:** Im alltäglichen Kontext besitzen Kalender neben der Zugehörigkeit zu einer Ressource teilweise einen Namen. Dieser muss nicht zwingend ein eineindeutiger Identifier sein. Aufgrund dessen kann dieser Name zusätzlich abgebildet werden. Falls kein Name angegeben wird, kann ein Termin-Consumer einen Namen z.B. aus den Elementen "serviceType" oder "specialty" für Anzeigezwecke ableiten.

### `Schedule.active`

**Bedeutung:** Ist der Kalender in aktiver Verwendung?

**Hinweis:** Historische Kalender können ebenfalls über die ISiK-Schnittstelle ausgetauscht werden. Für diese dürfen jedoch keine Termine vereinbart werden. Das terminführende System MUSS dies bei der Buchung überprüfen.

### `Schedule.serviceType`

**Bedeutung:** Welche Besuchsgründe / Behandlungsleistungen werden durch diesen Kalender erfasst?

**Hinweis:** Die Besuchsgründe / Behandlungsleistungen SOLLEN im Schedule angegeben werden, falls unter Schedule.actor nur Referenzen mit Referenz.display angegeben werden oder direkt auf einen Practitioner referenziert wird. Im Falle, dass ein HealthcareService referenziert wird, SOLLEN die gleichen Informationen wie in HealthcareService.type angegeben werden. Seitens der aktuellen Spezifikation werden keine Vorgaben bezüglich der zu verwendenden Terminologie gemacht. Entsprechend verwendete Kataloge müssen als CodeSystem-Ressource exponiert werden.

### `Schedule.specialty`

**Bedeutung:** Welche Fachrichtung(en) führen die Behandlungsleistungen, die durch diesen Kalender erfasst werden, aus?

**Hinweis:** Die Fachrichtung(en) SOLL(EN) im Schedule angegeben werden, falls unter Schedule.actor nur Referenzen mit Referenz.display angegeben werden oder direkt auf einen Practitioner referenziert wird. Im Falle, dass ein HealthcareService referenziert wird, SOLLEN die gleichen Informationen wie in HealthcareService.specialty angegeben werden.

### `Schedule.actor`

**Bedeutung:** Für welche Akteure wird der Kalender geführt?

**Hinweis:** Nicht alle Target-Ressourcen dieser Referenz existieren als Profil innerhalb des ISiK-Basismoduls oder ISiK-Terminplanung. Für alle Target-Ressourcen SOLL ein Displaywert für die Referenz angegeben werden. Nur für HealthcareService und Practitioner MUSS Reference.reference angegeben werden.

---

### Interaktionen

Für die Ressource Schedule MUSS die REST-Interaktion "READ" implementiert werden.

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Schedule?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "active" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Schedule?active=true```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Schedule.active" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "service-type" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Schedule?service-type=http://example.org/fhir/CodeSystem/ScheduleServiceType|CT```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Schedule.serviceType" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

1. Der Suchparameter "specialty" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Schedule?specialty=urn:oid:1.2.276.0.76.5.114|535```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Schedule.specialty" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).


1. Der Suchparameter "actor" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Schedule?actor=Practitioner/ISiKPractitionerExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Schedule.actor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](https://hl7.org/fhir/R4/search.html#reference).

---

### Beispiele

{{json:ISiKKalenderExample}}

Ein Beispiel zu einer gebündelten Suchabfrage auf einen Slot (wie in ISiKKalender.actor erwähnt) ist folgende:

GET https://example.org/fhir/Slot?schedule.actor:HealthcareService.type=http://dicom.nema.org/resources/ontology/DCM|CT&schedule.actor:Location.name=RaumXYZ