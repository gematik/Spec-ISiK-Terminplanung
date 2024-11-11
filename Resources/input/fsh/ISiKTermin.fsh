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
  * tag[Source] from http://fhir.de/ValueSet/common-meta-tag-de (required)
* insert Meta
* extension MS
* extension contains ISiKNachrichtExtension named Nachricht 0..* MS
  * ^definition = "Bedingtes Must Support - Einschränkung der übergreifenden MS-Definition: Falls ein bestätigungsrelevantes System das ISiK-Profil ISiKNachricht implementiert, MUSS das System auch dieses Element unterstützten. Andernfalls KANN das System dieses Element unterstützen."
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.replaces named replaces 0..1 MS
* status 1..1 MS
* cancelationReason 0..1 MS
* cancelationReason from ISiKTerminCancelationReason (required)
* start 1..1 MS
* end 1..1 MS
* slot 0..* MS
  * reference 1.. MS
* slot ^comment = "Zur Referenzierung auf eine Slot-Ressource MUSS eine Reference.reference mit einer URL verwendet werden. Das Termin-Repository muss so gestaltet sein, dass es aus Perspektive des Clients nur eine Service-BaseUrl gibt." //Zur Begründung: verschiedene Referenzierungs-Arten (z.B. mit Business-Identifiern) sind ggf. nicht interoperabel
* patientInstruction 0..1 MS
* participant 1..* MS
  * actor 1..1 MS
  * actor.display 1..1 MS
  * status 1..1 MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "actor.resolve()"
  * ^slicing.rules = #open
* participant ^comment = "Die Kardinalität von actor.display und das MS-Flag von .status wird an die Slices vererbt und diese sind entsprechend zu implementieren."
* participant contains AkteurPatient 1.. MS
* participant[AkteurPatient].actor only Reference(Patient)
* participant[AkteurPatient].actor MS
* participant[AkteurPatient].actor.reference 1..1 MS
* participant[AkteurPatient] ^comment = "Im ISIK-Kontext MUSS der referenzierte Patient konform zum [ISIKPatient](https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPatient) des Basismoduls sein."
* participant contains AkteurPersonImGesundheitsberuf 0.. MS
* participant[AkteurPersonImGesundheitsberuf].actor only Reference(Practitioner)
* participant[AkteurPersonImGesundheitsberuf].actor MS
* participant[AkteurPersonImGesundheitsberuf].actor.reference 1..1 MS
* participant[AkteurPersonImGesundheitsberuf] ^comment = "Im ISIK-Kontext MUSS die referenzierte Practitioner-Ressource konform zum [ISiKPersonImGesundheitsberuf](https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPersonImGesundheitsberuf) des Basismoduls sein."
* participant contains AkteurMedizinischeBehandlungseinheit 0.. MS
* participant[AkteurMedizinischeBehandlungseinheit].actor only Reference(HealthcareService)
* participant[AkteurMedizinischeBehandlungseinheit].actor MS
* participant[AkteurMedizinischeBehandlungseinheit].actor.reference 1..1 MS
* specialty 0..* MS
  * ^comment = "Optionale Angabe aller Fachbereiche aus denen ein oder mehrere Akteure für die Durchführung des Termins benötigt werden. KANN auch anhand des Kalenders, in dem ein Termin gebucht wird, ermittelt werden."
* specialty.coding 1..* MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* specialty.coding contains 
  Fachrichtung 0..1 MS and 
  Fachspezialisierung 0..1 and 
  ErweiterterFachabteilungsschluessel 0..1
* specialty.coding[Fachrichtung] from $IHEpracticeSettingVS (required)
  * ^definition = "Einschränkung der übergreifenden MS-Definition: ein bestätigungsrelevantes System SOLL das ValueSet (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) implementieren, MUSS es jedoch NICHT."
  * ^comment = "Hintergrund zum MS: die MS-Änderung erfolgt als Technical Correction in Stufe 3 während der Implementierungsphase, daher ist die Abbildung dieses ValueSets nicht verpflichtend.

  Hintergrund zum ValueSet: Die Wahl des hinterlegten ValueSets (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) wurde mit einem Mitglied der IHE Deutschland Arbeitsgruppe XDS ValueSets (https://www.ihe-d.de/projekte/xds-value-sets-fuer-deutschland/) sowie mit der KBV abgestimmt (Stand:13.06.2024)."
* specialty.coding[Fachspezialisierung] from $authorSpecialtyVS (required)
  * ^comment = "Dieses Slice SOLL NICHT genutzt werden und ist nur aufgrund der Kompatibilität beibehalten worden. Es SOLL dagegen das  ValueSet durch den Slice 'Fachrichtung' (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) umgesetzt werden (Stand:13.06.2024)."
* specialty.coding[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
  * ^comment = "Dieses ValueSet KANN über ein Mapping (siehe Abschnitt https://wiki.hl7.de/index.php?title=IG:Value_Sets_f%C3%BCr_XDS#DocumentEntry.practiceSettingCode) mit dem ValueSet der Fachrichtung verknüpft werden und darüber ggf. die Integration von Systemen erleichtern."  
* serviceType 1..* MS 
  * text MS
    * ^comment = "Must-Support-Flag: Aufgrund der Bandbreite möglicher Codierungen, soll in jedem Fall der serviceType als Text implementiert werden."
* priority MS
* priority.extension MS
* priority.extension contains ISiKTerminPriorityExtension named Priority 0..1 MS

Extension: ISiKNachrichtExtension
Id: ISiKNachrichtExtension
* insert Meta
* value[x] only Reference(ISiKNachricht)

Extension: ISiKTerminPriorityExtension
Id: ISiKTerminPriorityExtension
* insert Meta
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from ISiKTerminPriority (required)

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
* comment = "Dies ist ein Test Kommentar!"
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

Instance: ISiKTerminExampleOld
InstanceOf: ISiKTermin
Usage: #example
* meta
  * tag = http://fhir.de/CodeSystem/common-meta-tag-de#external
* extension[ISiKNachrichtExtension].valueReference = Reference(ISiKNachrichtExample)
* status = $appointmentStatus#proposed
* start = "2022-12-10T09:00:00Z"
* end = "2022-12-10T09:30:00Z"
* slot = Reference(ISiKSlotExample)
* priority
  * extension[ISiKTerminPriorityExtension].valueCodeableConcept = http://snomed.info/sct#25876001
* serviceType = http://terminology.hl7.org/CodeSystem/service-type#124
* specialty = urn:oid:1.2.276.0.76.5.114#010
* participant
  * actor.display = "Test Patient"
  * actor.reference = "Patient/example"
  * status = #accepted

// This extension can be safely removed as soon as a package for R5 backport extensions is published and referenced by this project
Extension: AppointmentReplaces
Id: AppointmentReplaces
* insert Meta
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.replaces"
* value[x] only Reference(Appointment)
