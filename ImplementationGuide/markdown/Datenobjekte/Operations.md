### {{page-title}}

Es gelten die allgemeinen Vorgaben der FHIR-Kernspezifikation für die Ausführung von [Custom Operations](https://www.hl7.org/fhir/R4/operations.html).

---

### Buchung eines Termins

{{render:ISiKAppointmentBookOperation}}

### Übersicht Interaktion Termin-Requestor mit Termin-Repository

Folgende Schritte KÖNNEN notwendig sein, sodass ein Termin durch einen Termin-Requestor innerhalb eines Termin-Repository eingestellt wird. Es ist zu beachten, dass für spezielle Implementierungen nicht alle Schritte hiervon relevant sind und übersprungen werden können.

Generell wird darauf hingewiesen, dass abhängig davon, welcher Client oder Benutzer eine Interaktion ausführt, unterschiedliche Ergebnisse zurückgeliefert werden können. Die vorliegende Spezifikation macht keine Vorgaben, wie eine Authentifizierung und Autorisierung zu implementieren ist. Es wird hierzu auf das [ISiK-Modul 'Sicherheit'](https://simplifier.net/guide/isik-sicherheit-v3?version=current) verwiesen.

User Story für die folgenden Beispiele: Ein Patient bucht über ein externes Patientenportal einen Termin in der allgemeinmedizinischen Ambulanz eines Krankenhauses. Da der Patient seit Tagen Bauchschmerzen hat, die in den letzten Stunden stärker werden, wählt er die Priorität "Notfall".

1. Abfrage aller Kodierungen der angebotenen gesundheitlichen Dienstleistungen durch den Termin-Requestor: `GET https://example.org/fhir/CodeSystem?context-type-value=https://gematik.de/fhir/isik/CodeSystem/ContextType|ResourceUsage$http://hl7.org/fhir/resource-types|HealthcareService` bzw. `GET https://example.org/fhir/CodeSystem?context-type-value=https://gematik.de/fhir/isik/CodeSystem/ContextType|ResourceUsage$http://hl7.org/fhir/resource-types|Schedule`

Das Termin-Repository MUSS alle CodeSysteme exponieren, welche für die Kodierung einer verfügbaren gesundheitlichen Dienstleistungen relevant sind. Die Anfrage ist nicht auf HealthcareService beschränkt, weitere Ressourcen-Kontexte können hierfür relevant sein. Beispielsweise erfolgt die Kodierung der Leistungen für einen Behandler im Kontext eines Schedules (vgl. {{pagelink:ImplementationGuide/markdown/Datenobjekte/ISiKKalenderSchedule.md, text:Schedule.serviceType}}). Alle verwendeten CodeSysteme MÜSSEN exponiert werden, insoweit diese sich als CodeSystem-Ressourcen ausdrücken lassen.

Hinweis: Diese Abfrage ist für eine Initialisierung des Termin-Requestors gedacht. Es ist davon auszugehen, dass diese Auswahlliste nicht dynamisch angepasst wird durch das Termin-Repository und nicht bei jeder Terminbuchung erneut abgefragt werden muss.

2. Abfrage aller verfügbaren Kalender durch den Termin-Requestor: `GET https://example.org/fhir/Schedule` bzw. `GET https://example.org/fhir/Schedule?actor=Practitioner/ISiKPractitionerExample`

Der Termin-Requestor KANN durch die Abfrage aller verfügbaren Kalender aller Ressourcen abfragen, für die eine Terminbuchung zur Verfügung stehen. Diese Abfrage kann auf ein oder mehrere Akteure eingeschränkt werden.

3. Abfrage aller verfügbaren Slots für einen Kalender durch den Termin-Requestor: `GET https://example.org/fhir/Slot?schedule=<Schedule/ISiKKalenderExample>&status=free`

In diesem Fall ist auch ein Chaining auf weitere verknüpfte Akteure möglich: `GET https://example.org/fhir/Slot?schedule.actor:HealthcareService.type=http://dicom.nema.org/resources/ontology/DCM|CT`

4. Anlage einer Patient-Ressource durch den Termin-Requestor: `POST https://example.org/fhir/Patient`

```json
{
    "resourceType": "Patient",
    "meta": {
        "tag": [
            {
                "system": "http://fhir.de/CodeSystem/common-meta-tag-de",
                "code": "external"
            }
        ]
    }
    [...]
}
```

5. Aufruf der $book-Operation durch den Termin-Requestor: `POST https://example.org/fhir/Appointment/$book`

```json
{
  "resourceType": "Appointment",
  "id": "ISiKTerminExample",
  "meta": {
    "tag": [
      {
        "code": "external",
        "system": "http://fhir.de/CodeSystem/common-meta-tag-de"
      }
    ],
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKTermin"
    ]
  },
  "extension": [
    {
      "url": "https://gematik.de/fhir/isik/StructureDefinition/ISiKNachrichtExtension",
      "valueReference": {
        "reference": "Communication/ISiKNachrichtExample"
      }
    }
  ],
  "status": "proposed",
  "start": "2022-12-10T09:00:00Z",
  "end": "2022-12-10T09:30:00Z",
  "slot": [
    {
      "reference": "ISiKSlotExample"
    }
  ],
  "serviceType": [
    {
      "coding": [
        {
          "code": "124",
          "system": "http://terminology.hl7.org/CodeSystem/service-type"
        }
      ]
    }
  ],
  "specialty": [
    {
      "coding": [
        {
          "code": "010",
          "system": "urn:oid:1.2.276.0.76.5.114"
        }
      ]
    }
  ],
  "participant": [
    {
      "actor": {
        "display": "Test Patient",
        "reference": "Patient/example"
      },
      "status": "accepted"
    }
  ],
  "_priority": {
    "extension": [
      {
        "url": "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminPriorityExtension",
        "valueCodeableConcept": {
          "coding": [
            {
              "code": "25876001",
              "system": "http://snomed.info/sct"
            }
          ]
        }
      }
    ]
  }
}
```

Antwort des Termin-Repository:

```json
{
  "resourceType": "Appointment",
  "id": "ISiKTerminExample",
  "meta": {
    "tag": [
      {
        "code": "external",
        "system": "http://fhir.de/CodeSystem/common-meta-tag-de"
      }
    ],
    "profile": [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKTermin"
    ]
  },
  "extension": [
    {
      "url": "https://gematik.de/fhir/isik/StructureDefinition/ISiKNachrichtExtension",
      "valueReference": {
        "reference": "Communication/ISiKNachrichtExample"
      }
    }
  ],
  "status": "booked",
  "start": "2022-12-10T09:00:00Z",
  "end": "2022-12-10T09:30:00Z",
  "slot": [
    {
      "reference": "ISiKSlotExample"
    }
  ],
  "serviceType": [
    {
      "coding": [
        {
          "code": "124",
          "system": "http://terminology.hl7.org/CodeSystem/service-type"
        }
      ]
    }
  ],
  "specialty": [
    {
      "coding": [
        {
          "code": "010",
          "system": "urn:oid:1.2.276.0.76.5.114"
        }
      ]
    }
  ],
  "participant": [
    {
      "actor": {
        "display": "Test Patient",
        "reference": "Patient/example"
      },
      "status": "accepted"
    }
  ],
  "_priority": {
    "extension": [
      {
        "url": "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminPriorityExtension",
        "valueCodeableConcept": {
          "coding": [
            {
              "code": "25876001",
              "system": "http://snomed.info/sct"
            }
          ]
        }
      }
    ]
  }
}
```

Für den Fall, dass ein Termin-Repository zum aktuellen Zeitpunkt keine Terminbestätigung geben kann, wird in der Antwortnachricht zurückgegebenen Appointment-Ressource der Wert von "Appointment.status" auf "pending" gesetzt. Als HTTP-Status-Code MUSS das Termin-Repository "202 - Accepted" zurückgeben.
Beispielsweise kann dies der Fall sein, falls ein Termin zunächst manuell im Termin-Repository bestätigt werden muss. Sobald ein Termin im Status "pending" seitens des Termin-Repository bestätigt oder abgesagt wurde, MUSS das Termin-Repository den Status des Termins auf "booked" bzw. "canceled" stellen. Sofern dieses unterstützt wird, SOLL eine Benachrichtigung des Termin-Consumers per Push-Mechanismus erfolgen (siehe auch nächster Abschnitt). In jedem Fall MUSS der Termin-Consumer über eine Lese- oder Such-Anfrage jederzeit den aktuellen Status der Terminbuchung ermitteln können.

---

### Aktualisierung / Absage eines Termins

Es ist zu beachten, dass es aus Effizienzgründen für bestimmte Implementierungen sinnvoll sein kann, dass Updates einer Appointment-Ressource ausgelöst durch das Termin-Repository mittels eines Push-Mechanismus an Termin-Consumer / Termin-Requestor übermittelt werden. Im Standard-Fall müssen diese Akteure die Ressourcen mittels des entsprechenden Endpunktes eigenständig abfragen und auf Updates überprüfen. Für einen Push-Mechanismus wird auf [FHIR Subscriptions](https://www.hl7.org/fhir/R4/subscription.html) verwiesen. Die vorliegende Spezifikation macht jedoch KEINE Vorgaben für die Verwendung einer solchen Methodik.

Eine Aktualisierung der Ressource erfolgt mittels einer [HTTP PATCH-Interaktion](https://www.hl7.org/fhir/R4/http.html#patch). Updates einer Appointment-Ressource MUSS das Termin Repository unterstützen. Es MUSS mindestens die PATCH-Interaktion auf Basis einer FHIRPath-Patch-Parameter Ressource unterstützt werden.

Folgende Elemente DÜRFEN NICHT durch ein Update der Ressourcen verändert werden:

- Appointment.slot
- Appointment.start
- Appointment.end
- Appointment.participant.actor.where(resolve() is Patient)

**Hinweis:** Ein Termin Repository MUSS einen Termin ablehnen, falls der Termin auf einen nicht vorhandenen (gelöscht oder inkativ) Patienten referenziert. Dies gilt insbesondere auch nachträglich für vorläufig angelegte Patienten-Ressourcen.

Sollte die PATCH-Parameter-Ressource eins dieser Elemente verändern, MUSS die Operation mit einem Status Code "HTTP 400 - Bad Request" zurückgewiesen werden. Eine OperationOutcome Ressource MUSS zurückgegeben werden, die in kodierter Form den entsprechenden Fehler beschreibt.

Beispiel: Absage eines Termins

```json
{
    "resourceType": "Parameters",
    "parameter": [{
        "name": "operation",
        "part": [
            {
                "name": "type",
                "valueCode": "replace"
            },
            {
                "name": "path",
                "valueString": "Appointment.status"
            },
            {
                "name": "value",
                "valueCode": "canceled"
            }
        ]
    }]
}
```

Falls die Aktualisierung eines Termins die Veränderung eines der oben genannten Elemente zur Folge hat, z.B. aufgrund einer zeitlichen Verschiebung des Termins, so kann die Appointment-Ressource erneut unter Beibehaltung der id an die $book-Operation übergeben werden. Das Termin-Repository kann so feststellen, ob der Termin in abgeänderter Form verfügbar ist.

---

### Anlage einer Patient-Ressource

Ein Termin Repository MUSS die Anlage (Create-Interaktion) einer Patient-Ressource entsprechend der Vorgaben des [ISiK-Basismoduls](https://simplifier.net/guide/isik-basis-v4/markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen_Rest?version=current) unterstützen.


---

### Asynchrone Ausführung $book

Die Operation zur Buchung eines Termin MUSS ebenfalls asynchron ausgeführt werden können, für den Fall, dass ein Termin-Repository keine Zusagen zu Antwortzeiten machen kann und so dass Problem besteht, dass der Client in einen Timeout läuft. Beispielsweise kann dies der Fall sein, wenn die Buchungsanfrage im Termin-Repository asynchrone Anfragen an andere Systeme auslöst und der Termin erst bestätigt werden kann, wenn diese durchgelaufen sind. Es gelten die Regeln der [FHIR Kernspezifikation - Abschnitt 3.2.0.7 Executing an Operation Asynchronously](https://www.hl7.org/fhir/r4/operations.html):

- Der Aufruf der $book-Operation erfolgte auch im asynchronen Fall durch einen POST-Request
- Ein HTTP-Header mit dem Namen "Prefer" und dem Inhalt "respond-async" MUSS im Aufruf der Operation enthalten sein
- Als HTTP-Status-Code MUSS das Termin-Repository 202 - Accepted zurückgeben
- Im Fehlerfall MUSS ein 4XX- oder 5XX-HTTP-Status-Code zurückgeben werden
- Zudem MUSS das Termin-Repository einen "Content-Location"-Header zurückliefern indem eine valide absolute URL enthalten ist unter welcher die oben beschriebene Appointment- bzw OperationOutcome-Ressource als Antwort auf die Buchung des Termins abgerufen werden kann

