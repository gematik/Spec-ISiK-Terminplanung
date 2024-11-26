## ISiKTerminblock [(Slot)](https://hl7.org/fhir/R4/slot.html)

---

### Motivation

Die Slot-Ressource repräsentiert die Verbindung eines Termins (Appointment) und den dazugehörigen Ressourcen (z.B. HealthcareService, Device, Practitioner). Für diese Ressourcen können separate Kalender (Schedules) verwaltet werden. Der Slot agiert als Verbindungsstück zwischen diesen Ressourcen.

---

### Kompabilität

Siehe {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/Kompatibilitaet.md, text:Kompabilität}}.

---

### FHIR-Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock' for differential.element.constraint select key, severity, human, expression```

---

### Anmerkungen zu Must-Support-Feldern

### `Slot.schedule`

**Bedeutung:** Verknüpfung einer Termins / Terminblocks und den dazugehörigen Terminlisten bzw. deren Ressourcen.

**Hinweise:** Die Referenz auf Schedule bietet die Möglichkeit der Abfrage eines Appointments / Slots auf Basis einer Verknüpfung mit einem Schedule bzw. eines Schedules für eine bestimmte Ressource (Schedule.actor).

### `Slot.status`

**Bedeutung:** Indikator ob ein Slot verwendbar ist für die Buchung eines Appointments.

**Hinweise:** Inbesondere eine Differenzierung des Status "busy" ermöglicht es einem Termin Requestor passende Termine einem Benutzer zur Verfügung zu stellen. Durch entsprechende Kombinationen können somit Termine in einer passenden Länge gebucht werden.

### `Slot.start`

**Bedeutung:** Startdatum des Slots (sekundengenau).

**Hinweise:** Falls sich ein Appoinment über mehrere Slots erstreckt, kann mit Hilfe des Startdatums der Beginn eines zu vereinbarenden Termins gefunden werden.

### `Slot.end`

**Bedeutung:** Enddatum des Slots (sekundengenau).

**Hinweise:** Falls sich ein Appoinment über mehrere Slots erstreckt, kann mit Hilfe des Enddatums der Slot gefunden werden, welcher als nächste innerhalb einer Reihe gebucht werden muss, sodass das Appointment eine gewünschte Länge erreicht.

---

### Interaktionen

Für die Ressource Slot MUSS die REST-Interaktion "READ" implementiert werden.

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Slot?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "schedule" MUSS in Kombination mit einem definierten Startzeitpunkt mittels Suchparameter "start" unterstützt werden. Der Suchparameter "schedule" KANN alleinstehend unterstützt werden.
Beim Fehlen des "start"-Suchparameters SOLL der aktuelle Zeitpunkt des Servers als Startzeitpunkt per Default verwendet werden.

    Beispiele:

    ```GET [base]/Slot?schedule=Schedule/ISiKKalenderExample&start=2022-12-10T09:00:00Z```

    ```GET [base]/Slot?schedule=Schedule/ISiKKalenderExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Slot.schedule" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"]https://hl7.org/fhir/R4/search.html#reference).

    In diesem Fall ist auch ein Chaining auf weitere verknüpfte Akteure möglich: `GET https://example.org/fhir/Slot?schedule.actor:HealthcareService.type=https://example.org/fhir/CodeSystem/Behandlungsleistung|CT`

Dies kann notwendig sein, falls interdisziplinäre Kalender durch das Termin-Repository gepflegt werden (z.B. ein Kalender pro Station). In solchen Fälle wäre es sinnvoll, wenn das Termin-Repository einem Termin-Requestor eine Verknüpfung zwischen Kalender (Schedule) und Behandlungsleistung (HealthcareService) bereitstellen würde.

3. Der Suchparameter "status" MUSS in Kombination ('&') mit einer Abfrage auf Schedule unterstützt werden. Diese Abfrage KANN entweder eine direkte Angabe einer Referenz oder eine Angabe von weiteren Chaining-Parametern sein:

    Beispiele:

    ```GET [base]/Slot?status=free&schedule=Schedule/ISiKTerminExample```

    ```GET [base]/Slot?status=free&schedule.actor:Practitioner.name=Musterarzt```


    Anwendungshinweise: Der Suchparameter MUSS NICHT alleinstehend unterstützt werden. Weitere Informationen zur Suche nach "Slot.status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](https://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "start" MUSS in Kombination ('&') mit einer Parameter-Abfrage auf Schedule unterstützt werden. Diese Abfrage KANN entweder eine direkte Angabe einer Referenz oder eine Angabe von weiteren Chaining-Parametern sein:

    Beispiele:

    ```GET [base]/Slot?start=2022-12-10T09:00:00Z&schedule=Schedule/ISiKTerminExample```

    ```GET [base]/Slot?start=2022-12-10T09:00:00Z&schedule.actor:Practitioner.name=Musterarzt```

    Anwendungshinweise: Der Suchparameter MUSS NICHT alleinstehend unterstützt werden. Weitere Informationen zur Suche nach "Slot.start" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date Search"](https://hl7.org/fhir/R4/search.html#date).

---

### Beispiele

{{json:isikterminblockexample}}
