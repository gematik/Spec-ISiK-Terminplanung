Profile: ISiKKalender
Parent: Schedule
Id: ISiKKalender
* insert Meta
* active 1..1 MS
* serviceType 1..* MS
  * text MS
    * ^comment = "Must-Support-Flag: Aufgrund der Bandbreite möglicher Kodierungen, soll in jedem Fall der serviceType als Text implementiert werden."
* specialty 1..* MS
  * ^comment = "Ein Kalender kann für einen Akteur gepflegt werden. Dieser Akteur kann in einer oder mehreren Fachrichtungen agieren. Für die Ressourcenplanung (z.B. welche Akteure sind für einen Termin verfügbar) sollte auch auf die Speciality des Akteurs zurückgegriffen werden für den Fall, dass ein Kalender pro Fachbereich gepflegt wird."
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
* actor 1..* MS
  * ^comment = "Ein dezidierter Kalender ist für jeden Akteur zu pflegen."  
  * identifier 0..1 MS
  * display MS
    * ^comment = "Begründung zu Must Support: Dieses Feld ist optional (0..1), muss jedoch implementiert werden (MS), um die Möglichkeit zu bieten, einen Display-Wert (z.B. Namen) für einen Akteur zu verarbeiten und zu persistieren, dem der Kalender zugewiesen ist.
    
    Hinweis: Für alle Target-Ressourcen SOLL ein Displaywert für die Referenz angegeben werden, sodass Systeme eine Übersicht der am Termin beteiligten Akteure anzeigen können ohne die Referenzen auflösen zu müssen."  
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* actor contains Akteur 0..1 MS
* actor[Akteur] only Reference(Practitioner or HealthcareService or Location)
* actor[Akteur] ^comment = "Im ISIK-Kontext MUSS die referenzierte Practitioner-Ressource konform zum [ISiKPersonImGesundheitsberuf](https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf) des Basismoduls sein. Dieses Element dient dazu, um alle Akteure zu gruppieren, sodass für diese Einheit von Terminressourcen ein Terminblock herausgegeben werden kann. Unter 'Akteure' fallen hier auch Standorte und Dienstleistungen."
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