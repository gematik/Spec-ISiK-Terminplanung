Profile: ISiKKalender
Parent: Schedule
Id: ISiKKalender
* insert Meta
* active 1..1 MS
* serviceType 1..* MS
* specialty 1..* MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* specialty contains 
  Fachrichtung 0..1 MS and 
  Fachspezialisierung 0..1 and 
  ErweiterterFachabteilungsschluessel 0..1
* specialty[Fachrichtung] from $IHEpracticeSettingVS (required)
  * ^definition = "Einschränkung der übergreifenden MS-Definition: ein bestätigungsrelevantes System SOLL das ValueSet (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) implementieren, MUSS es jedoch NICHT."
  * ^comment = "Hintergrund zum MS: die MS-Änderung erfolgt als Technical Correction in Stufe 3 während der Implementierungsphase, daher ist die Abbildung dieses ValueSets nicht verpflichtend.

  Hintergrund zum ValueSet: Die Wahl des hinterlegten ValueSets (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) wurde mit einem Mitglied der IHE Deutschland Arbeitsgruppe XDS ValueSets (https://www.ihe-d.de/projekte/xds-value-sets-fuer-deutschland/) sowie mit der KBV abgestimmt (Stand:13.06.2024)."
* specialty[Fachspezialisierung] from $authorSpecialtyVS (required)
  * ^comment = "Dieses Slice SOLL NICHT genutzt werden und ist nur aufgrund der Kompatibilität beibehalten worden. Es SOLL dagegen das  ValueSet durch den Slice 'Fachrichtung' (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) umgesetzt werden (Stand:13.06.2024)."
* specialty[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
  * ^comment = "Dieses ValueSet KANN über ein Mapping (siehe Abschnitt https://wiki.hl7.de/index.php?title=IG:Value_Sets_f%C3%BCr_XDS#DocumentEntry.practiceSettingCode) mit dem ValueSet der Fachrichtung verknüpft werden und darüber ggf. die Integration von Systemen erleichtern."  
* actor 1..* MS  
  * identifier 0..1 MS
  * display 1..1 MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* actor contains Akteur 0..1 MS
* actor[Akteur] only Reference(Practitioner or HealthcareService)
* actor[Akteur] ^comment = "Im ISIK-Kontext MUSS die referenzierte Practitioner-Ressource konform zum [ISiKPersonImGesundheitsberuf](https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPersonImGesundheitsberuf) des Basismoduls sein."
* actor[Akteur].reference 1..1 MS
* extension MS
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name named KalenderName 0..1 MS
  * valueString 1..1

// This extension can be safely removed as soon as a package for R5 backport extensions is published and referenced by this project
//WIP
Extension: ScheduleName
Id: ScheduleName
* insert Meta
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Schedule.name"
* value[x] only string
* valueString 0..1

Instance: ISiKKalenderExample
InstanceOf: ISiKKalender
Usage: #example
* active = true
* serviceType = http://terminology.hl7.org/CodeSystem/service-type#124
* specialty = $IHEAerztlicheFachrichtungen#ALLG
* actor.reference = "Practitioner/example"
* actor.display = "Dr. Fleming"