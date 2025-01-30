## ISiKNachricht [(Communication)](https://hl7.org/fhir/R4/communication.html)

---

### Motivation

Die Communication-Ressource dient als Datenobjekt für den bidirektionalen Austausch von Nachrichten zwischen einem Leistungserbringer und einem Patienten.  Es können sowohl Textnachrichten als auch Binärdateien ausgetauscht werden. 

Zu einer Liste angrenzender Use Cases siehe Abschnitt zur Benachrichtigung unter {{pagelink:ImplementationGuide/markdown/UseCases/UseCases.md}} - hier wird der spezifische Use Case für dieses Profil von anderen abgegrenzt.

Es liegt in der Verantwortung des bestätigungsrelevanten Systems, eine dem Schutzbedarf der ausgetauschten Nachrichten angemessene Sicherheit in Bezug auf Vertraulichkeit, Integrität und Verfügbarkeit herzustellen. Die Vorgaben des BSI, z. B. aus der TR-03161, sind zu beachten. Grundsätzlich liegen der vorliegenden Definition von ISiKNachricht die folgenden Annahmen zugrunde, die auch eine Nutzung einfach umsetzbarer Sicherheitsmaßnahmen ermöglichen:
* ISiKNachricht SOLL ausschließlich für den Austausch administrativer, nicht personenbezogener Informationen im Kontext der Terminbuchung verwendet werden, z. B. zur Übermittlung von Coronahinweisen oder Lageplänen.
* Der Austausch personenbezogener medizinischer Daten SOLL ausschließlich über die dafür vorgesehenen sicheren Dienste der Telematikinfrastruktur, wie z. B. ePA und zukünftig auch den TI-Messenger, erfolgen.

#### Normativer Status und Bestätigung

Dieses Profil MUSS im Rahmen der Bestätigung NICHT unterstützt werden. Falls das Profil unterstützt werden soll, MÜSSEN die hier definierten Festlegungen greifen (auch im Bestätigungsverfahren; in diesem Sinn sind auch die SHALL-Vorgaben im CapabilityStatement als bedingte zu verstehen).

---

### Kompabilität

Siehe {{pagelink:ImplementationGuide/markdown/UseCases/Kompatibilitaet.md, text:Kompabilität}}.

---

### FHIR-Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKNachricht' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKNachricht, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKNachricht' for differential.element.constraint select key, severity, human, expression```

---

### Anmerkungen zu Must-Support-Feldern

### `Communication.inResponseTo`

**Bedeutung:** Falls die Communication-Ressource in einen zeitlichen Zusammenhang mit weiteren Nachrichten gebracht werden muss, KÖNNEN die Nachrichten miteinander verknüpft werden. Neue Nachrichten MÜSSEN auf die bereits zuvor existierenden Nachrichten zeigen.

### `Communication.subject`

**Bedeutung:** Patient-Referenz als Aussage für welche Patienten die Communication verfasst wird

**Hinweis:** Ein Patientenbezug muss stets gegeben sein, soweit möglich.

### `Communication.recipient`

**Bedeutung:** Empfänger der Communication

**Hinweis:** Für Practitioner und HealthcareService muss Reference.reference angegeben werden. Für weitere Ressourcen MUSS ein Reference.display angegeben werden.

### `Communication.sender`

**Hinweis:** Für Patient, Practitioner und HealthcareService muss Reference.reference angegeben werden. Für weitere Ressourcen MUSS ein Reference.display angegeben werden.

### `Communication.payload`

**Bedeutung:** Inhalt der Communication

**Hinweis:** Ein bestätigungsrelevantes System MUSS sowohl Freitext, als auch base64-kodierte Inhalte unterstützten. Falls strukturierte Metadaten über das zu übermittelnde Dokument verfügbar sind, KANN ein bestätigungsrelevantes System es als DocumentReference-Ressource ablegen. Für die Anlage einer solchen Ressource wird auf das [ISiK Dokumentenaustausch](https://simplifier.net/guide/isik-dokumentenaustausch-v4?version=current) verwiesen. Die erzeugte Ressource SOLL anschließend durch das bestätigungsrelevante System unter dem contentReference-Element als Referenz angegeben werden. Jegliche Funktionalität bezogen auf das Modul Dokumentenaustausch ist nicht bestätigungsrelevant. Dokumente welche als Attachment angegeben werden, MÜSSEN in ihrer URL auf eine [ISiKBinary](https://simplifier.net/guide/isik-basis-v4/ImplementationGuide-markdown-Datenobjekte-Datenobjekte_Binary?version=current) Ressource verweisen. Diese Binary-Ressource SOLL per CREATE-Interaktion angelegt werden im empfangenden System.

---

### Interaktionen

Für die Ressource Communication MÜSSEN die REST-Interaktionen "READ", "CREATE", "UPDATE" implementiert werden.

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Communication?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](https://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Communication?subject=Patient/ISiKPatientExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Communication.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](https://hl7.org/fhir/R4/search.html#reference)

1. Der Suchparameter "recipient" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Communication?recipient=Practitioner/ISiKPractitionerExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Communication.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](https://hl7.org/fhir/R4/search.html#reference)

1. Der Suchparameter "sender" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Communication?sender=Practitioner/ISiKPractitionerExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Communication.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](https://hl7.org/fhir/R4/search.html#reference)


---

### Beispiele

{{json:ISiKNachrichtExample}}