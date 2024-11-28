Profile: ISiKTermin
Parent: Appointment
Id: ISiKTermin
* obeys ISiK-app-1
* meta MS
  * tag 0..* MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * tag contains Source 0..1 MS
  * ^comment = "Ein Tag kann verwendet werden um zu kennzeichnen, dass die Ressource von Extern erstellt worden ist."
  * tag[Source] from http://fhir.de/ValueSet/common-meta-tag-de (required)
* insert Meta
* extension MS
* extension contains ISiKNachrichtExtension named Nachricht 0..* MS
  * ^comment = "Einschränkung der übergreifenden MS-Definition: Falls ein bestätigungsrelevantes System das ISiK-Profil ISiKNachricht implementiert, MUSS das System auch dieses Element unterstützten. Andernfalls KANN das System dieses Element unterstützen. 
  
  Begründung zum Must Support: Nachrichten die für diesen Termin verfasst wurden können somit direkt abgerufen werden."
* extension contains AppointmentReplaces named replaces 0..1 MS
  * ^comment = "Begründung zum Must Support: Termineabsagen sollten verkettbar sein, da am originalen Termin noch weitere Informationen hängen können."
* status MS
  * ^comment = "Begründung zu Must Support : Im ISiK Kontext ist der Status eines Termins von entscheidender Bedeutung, um den aktuellen Stand und die Verfügbarkeit des Termins zu kommunizieren."
* cancelationReason MS
  * ^comment = "Begründung zu Must Support: Dieses Feld ist optional (0..1), muss jedoch implementiert werden (MS), um die Möglichkeit zu bieten, einen Grund für die Absage eines Termins zu hinterlegen."
* cancelationReason from ISiKTerminCancelationReason (required)
* start 1..1 MS
  * ^comment = "Begründung zu Kardinalität und Must Support: Der Startzeitpunkt eines Termins ist von entscheidender Bedeutung, um die Verfügbarkeit und Planung des Termins zu gewährleisten. Daher ist dieses Feld verpflichtend (1..1) und muss unterstützt werden (MS)."
* end 1..1 MS
  * ^comment = "Begründung zu Kardinalität und Must Support: Der Endzeitpunkt eines Termins ist von entscheidender Bedeutung, um die Verfügbarkeit und Planung des Termins zu gewährleisten. Daher ist dieses Feld verpflichtend (1..1) und muss unterstützt werden (MS)."
* slot MS
  * reference 1.. MS
* slot ^comment = "Begründung zu Kardinalität und Must Support: Die Kardinalität der slot-Eigenschaft bleibt 0..*, sodass ein Termin-Requestor bei der Terminbuchung nur einen Termin und ein Verweis auf ein ISiKKalender übergeben kann. Es ist dann die Aufgabe des Termin-Repositories in Abhängigkeit der gebuchten Dienstleistung freie Terminblöcke zu finden. Diese sind im Appointment zu referenzieren."
* comment MS
  * ^comment = "Hinweis: Im ISiK Kontext sollte dieses Feld zur internen Kommunikation zwischen Leistungserbringern verwendet werden, z.B. für interne Notizen rund um den Termin.

Begründung zum Must Support: Dieses Feld ist optional (0..1), muss jedoch implementiert werden (MS), um die Möglichkeit zu bieten, zusätzliche Informationen zum Termin zu hinterlegen und abrufen zu können. 

Es gilt weiterhin die Semantik des Elements nach FHIR-Kernspezifikation:

'Additional text to aid in facilitating the appointment. For instance, a comment might be, 'patient should proceed immediately to infusion room upon arrival'

Where this is a planned appointment and the start/end dates are not set then this field can be used to provide additional guidance on the details of the appointment request, including any restrictions on when to book it.'"
* patientInstruction MS
  * ^comment = "Hinweis: Dieses Feld sollte im Kontext von ISIK verwendet werden für die Kommunikation im Sinne der Definition der FHIR-Kernspezifikation - sowohl von Systemseite (administrativ) als auch von Seiten des medizinischen Fachpersonals.

Beispiel für eine Nachricht: 'Bitte nüchtern erscheinen' etc.

Begründung zum Must Support: Dieses Feld ist optional (0..1), muss jedoch implementiert werden (MS), um die Möglichkeit zu bieten, zusätzliche Informationen für Patienten zum Termin zu hinterlegen und abrufen zu können. 

Es gilt weiterhin der Hinweis der FHIR Kernspezifikation:
'Note that FHIR strings SHALL NOT exceed 1MB in size'"
* participant MS
  * actor 1..1 MS
    * display MS
      * ^comment = "Hinweis: Für alle Target-Ressourcen SOLL ein Displaywert für die Referenz angegeben werden, sodass Systeme eine Übersicht der am Termin beteiligten Akteure anzeigen können ohne die Referenzen auflösen zu müssen. Somit kann ein Termin-Consumer direkt anzeigen welche Akteure für den Termin relevant sind."
  * status 1..1 MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "actor.resolve()"
  * ^slicing.rules = #open
* participant ^comment = "Hinweis: Die Kardinalität von actor.display und das MS-Flag von .status wird an die Slices vererbt und diese sind entsprechend zu implementieren.

Begründung zu Kardinalität und Must Support: Die Teilnehmer eines Termins sind von entscheidender Bedeutung, um die Verfügbarkeit und Planung des Termins zu gewährleisten. Daher muss dieses Feld unterstützt werden (MS)."
* participant contains AkteurPatient 1.. MS
* participant[AkteurPatient].actor only Reference(Patient)
* participant[AkteurPatient].actor MS
* participant[AkteurPatient].actor.reference 1..1 MS
* participant[AkteurPatient] ^comment = "Hinweis: Im ISIK-Kontext MUSS der referenzierte Patient konform zum [ISIKPatient](https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPatient) des Basismoduls sein.

Begründung zu Kardinalität und Must Support: Die teilnehmenden Patienten eines Termins sind von entscheidender Bedeutung, um die Verfügbarkeit und Planung des Termins zu gewährleisten. Daher ist dieses Feld verpflichtend (1..*) und muss unterstützt werden (MS)."
* participant contains AkteurPersonImGesundheitsberuf 0.. MS
* participant[AkteurPersonImGesundheitsberuf].actor only Reference(Practitioner)
* participant[AkteurPersonImGesundheitsberuf].actor MS
* participant[AkteurPersonImGesundheitsberuf].actor.reference 1..1 MS
* participant[AkteurPersonImGesundheitsberuf] ^comment = "Im ISIK-Kontext MUSS die referenzierte Practitioner-Ressource konform zum [ISiKPersonImGesundheitsberuf](https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPersonImGesundheitsberuf) des Basismoduls sein.

Begründung zu Kardinalität und Must Support: Die teilnehmenden Personen mit einem Gesundheitsberuf eines Termins sind entscheidend und müssen daher implementiert werden (MS), allerdings sind sie nicht zwingend erforderlich (0..*), da die Übernahme auch durch eine Behandlungseinheit erfolgen kann."
* participant contains AkteurMedizinischeBehandlungseinheit 0.. MS
* participant[AkteurMedizinischeBehandlungseinheit].actor only Reference(HealthcareService)
* participant[AkteurMedizinischeBehandlungseinheit].actor MS
* participant[AkteurMedizinischeBehandlungseinheit].actor.reference 1..1 MS
* specialty MS
  * ^comment = "Optionale Angabe aller Fachbereiche aus denen ein oder mehrere Akteure für die Durchführung des Termins benötigt werden. 
  
  Begründung zu Kardinalität und Must Support: KANN auch anhand des Kalenders, in dem ein Termin gebucht wird, ermittelt werden.
  Die Angabe der Fachbereiche ist optional (0..*), muss jedoch implementiert werden (MS), um die Spezialisierung hinsichtlich der zugeordneten Behandlungseinheit des Termins eindeutig zu definieren und eine korrekte Zuordnung zu gewährleisten.
  "
* specialty.coding 1..* MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* specialty.coding contains 
  Fachrichtung 1..1 MS and
  ErweiterterFachabteilungsschluessel 0..1
* specialty.coding[Fachrichtung] from $IHEpracticeSettingVS (required)
  * ^comment = "Begründung zur Kardinalität: Die Kardinalität der Fachrichtung-Eigenschaft wird auf 1..1 festgelegt, um sicherzustellen, dass genau eine Fachrichtung vorhanden ist. Dies ist notwendig, um die Spezialisierung des Termins eindeutig zu definieren und eine korrekte Zuordnung zu gewährleisten.
  
  Hintergrund zur Entscheidung: Die Wahl des hinterlegten ValueSets (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) wurde mit einem Mitglied der IHE Deutschland Arbeitsgruppe XDS ValueSets (https://www.ihe-d.de/projekte/xds-value-sets-fuer-deutschland/) sowie mit der KBV abgestimmt (Stand:13.6.2024)."
* specialty.coding[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
  * ^comment = "Dieses ValueSet KANN über ein Mapping (siehe Abschnitt https://wiki.hl7.de/index.php?title=IG:Value_Sets_f%C3%BCr_XDS#DocumentEntry.practiceSettingCode) mit dem ValueSet der Fachrichtung verknüpft werden und darüber ggf. die Integration von Systemen erleichtern."  
* serviceType 1..* MS
  * ^comment = "Begründung zu Kardinalität und Must Support: Die Dienstleistungsart eines Termins ist von entscheidender Bedeutung, um die Verfügbarkeit und Planung des Termins zu gewährleisten. Daher ist dieses Feld verpflichtend (1..*) und muss unterstützt werden (MS). Aufgrund der Heterogenität von Dienstleistungen ist eine standardisierte Kodierung nicht zwingend notwendig, eine Freitextbeschreibung ist ausreichend."
  * text MS
* priority MS
  * ^comment = "Begründung Must Support: Die Priorität eines Termins ist von entscheidender Bedeutung, um die Dringlichkeit und Relevanz des Termins zu kommunizieren und zu priorisieren. Eine Priorität ist nicht zwingend erforderlich, muss jedoch implementiert werden (MS), um die Möglichkeit zu bieten, die Dringlichkeit und Relevanz des Termins abzurufen."
* priority.extension MS
* priority.extension contains ISiKTerminPriorityExtension named Priority 0..1 MS
  * ^comment = "Hinweis: In R5 ist die Priority ein CodeableConcept. 
  
  Begründung zu Must Support: Dieses Element ist optional (0..1), muss jedoch implementiert werden (MS), um besonders einen Notfall als solchen ausweisen zu können."

Extension: ISiKNachrichtExtension
Id: ISiKNachrichtExtension
Context: Appointment
* insert Meta
* value[x] only Reference(ISiKNachricht)

Extension: ISiKTerminPriorityExtension
Id: ISiKTerminPriorityExtension
Context: Appointment.priority
* insert Meta
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from ISiKTerminPriority (required)

// This extension can be safely removed as soon as a package for R5 backport extensions is published and referenced by this project
//WIP
Extension: AppointmentReplaces
Id: AppointmentReplaces
Context: Appointment
* insert Meta
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.replaces"
* value[x] only Reference(Appointment)
* valueReference 0..1

Invariant: ISiK-app-1
Description: "Der Endzeitpunkt eines Termins MUSS nach dem Startzeitpunkt liegen"
Severity: #error
Expression: "start <= end"

Instance: ISiKTerminExample
InstanceOf: ISiKTermin
Usage: #example
* meta
  * tag = http://fhir.de/CodeSystem/common-meta-tag-de#external
* extension[ISiKNachrichtExtension].valueReference = Reference(ISiKNachrichtExample)
* status = $appointmentStatus#proposed
* start = "2022-12-10T09:00:00Z"
* end = "2022-12-10T11:00:00Z"
* slot = Reference(ISiKTerminblockExample)
* priority
  * extension[ISiKTerminPriorityExtension].valueCodeableConcept = http://snomed.info/sct#25876001
* serviceType = http://terminology.hl7.org/CodeSystem/service-type#124
* specialty = $IHEAerztlicheFachrichtungen#ALLG
* participant
  * actor.display = "Test Patient"
  * actor.reference = "Patient/example"
  * status = #accepted

Instance: ISiKTerminExampleExtendedICU
InstanceOf: ISiKTermin
Usage: #example
* meta
  * tag = http://fhir.de/CodeSystem/common-meta-tag-de#external
* extension[ISiKNachrichtExtension].valueReference = Reference(ISiKNachrichtExample)
* status = $appointmentStatus#proposed
* start = "2022-12-10T09:00:00Z"
* end = "2022-12-10T09:30:00Z"
* slot = Reference(ISiKTerminblockExample)
* priority
  * extension[ISiKTerminPriorityExtension].valueCodeableConcept = http://snomed.info/sct#25876001
* serviceType = http://terminology.hl7.org/CodeSystem/service-type#174
* specialty.coding[Fachrichtung] = $IHEAerztlicheFachrichtungen#INTM
* specialty.coding[ErweiterterFachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#3600
* participant
  * actor.display = "Test Patient"
  * actor.reference = "Patient/example"
  * status = #accepted
