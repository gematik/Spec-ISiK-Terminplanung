Profile: ISiKMedizinischeBehandlungseinheit
Parent: HealthcareService
Id: ISiKMedizinischeBehandlungseinheit
* insert Meta
* active 1..1 MS
  * ^comment = "Bedeutung: Ist der HealthcareService in aktiver Verwendung.
  
  Hinweis: Historische HealthcareServices können ebenfalls über die ISiK-Schnittstelle ausgetauscht werden. Für diese dürfen jedoch keine Termine vereinbart werden. Das terminführende System MUSS dies bei der Buchung überprüfen.
  
  Begründung Kardinalität und Must-Support-Flag (MS): Die Kardinalität 1..1 und das Must-Support-Flag (MS) für das 'active'-Element stellen sicher, dass jede Behandlungseinheit eindeutig als aktiv oder inaktiv gekennzeichnet ist. Dies ist entscheidend für die Ressourcenplanung und Verfügbarkeit von Behandlungseinheiten."
* type 1.. MS
* type ^comment = "**Bedeutung:** Klassifikation der Behandlungsleistung welche durch den HealthcareService erbracht wird

**Hinweis:** Diese Klassifikation SOLL stets auch in Appointment.serviceType und Schedule.serviceType angegeben werden. Seitens der aktuellen Spezifikation werden keine Vorgaben bezüglich der zu verwendenden Terminologie gemacht. Entsprechend verwendete Kataloge müssen als CodeSystem- und ValueSet-Ressourcen exponiert werden. Siehe [Suchparameter 'context-type-value' in ISiK Basis - Datenobjekt ValueSet](https://simplifier.net/resolve?&scope=isik-basis-v4@current&canonical=https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet).

**Begründung Kardinalität:** Eine Behandlungseinheit muss mindestens einen Typ haben, sodass im Rahmen der Terminplanung ermittelt werden kann welcher Akteur für die Durchführung eines Termins zur Verfügung steht."
* specialty 1.. MS
  * ^comment = "**Bedeutung:** Fachrichtung der Behandlungsleistung welche durch den HealthcareService erbracht wird

**Hinweis:** Diese Fachrichtung SOLL stets auch in Appointment.specialty und Schedule.specialty angegeben werden.
  
**Begründung Kardinalität:** Eine Behandlungseinheit kann multiprofessionell sein und mehere Fachbereiche abdecken. Sie muss jedoch mindestens einem Fachbereich zugeordnet sein, sodass die Behandlungseinheit während der Terminplanung als Akteur miteinbezogen werden für passende Termine."
* specialty.coding 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "Begründung Kardinalität Fachrichtung: Die Kardinalität der Fachrichtung-Eigenschaft wird auf 1..1 festgelegt, um sicherzustellen, dass genau eine Fachrichtung per IHE-XDS-Kodierung vorhanden ist. Dies ist notwendig, um die Spezialisierung der Behandlungseinheit eindeutig zu definieren und eine korrekte Zuordnung zu gewährleisten.
  
  Begründung Kardinalität ErweiterterFachabteilungsschluessel: Die Kardinalität der ErweiterterFachabteilungsschluessel-Eigenschaft wird auf 0..1 festgelegt, um sicherzustellen, dass optional ein erweiterter Fachabteilungsschlüssel vorhanden sein kann."
* specialty.coding contains 
  Fachrichtung 1..1 MS and
  ErweiterterFachabteilungsschluessel 0..1
* specialty.coding[Fachrichtung] from $IHEpracticeSettingVS (required)
  * ^comment = "Die Wahl des hinterlegten ValueSets (http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode) wurde mit einem Mitglied der IHE Deutschland Arbeitsgruppe XDS ValueSets (https://www.ihe-d.de/projekte/xds-value-sets-fuer-deutschland/) sowie mit der KBV abgestimmt (Stand:13.6.2024)."
* specialty.coding[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
  * ^comment = "Dieses ValueSet KANN über ein Mapping (siehe Abschnitt https://wiki.hl7.de/index.php?title=IG:Value_Sets_f%C3%BCr_XDS#DocumentEntry.practiceSettingCode) mit dem ValueSet der Fachrichtung verknüpft werden und darüber ggf. die Integration von Systemen erleichtern."  
* name 1.. MS
  * ^comment = "**Bedeutung:** Informeller Name der Behandlungseinheit

**Hinweis:** Es wird im Rahmen dieser Spezifikation davon ausgegangen, dass für einen HealthcareService keine natürlichen Identifier vorliegen, die in einem realen Kontext vergeben werden. Somit kann durch den Namen ein informeller, jedoch identifizierender Bezeichner vergeben werden.

**Begründung Kardinalität:** Eine Behandlungseinheit muss mindestens einen Namen haben, um eine Wiedererkennbarkeit im Rahmen der Terminplanung zu gewährleisten." 

Instance: ISiKMedizinischeBehandlungseinheitExample
InstanceOf: ISiKMedizinischeBehandlungseinheit
Usage: #example
* active = true
* type = http://terminology.hl7.org/CodeSystem/service-type#124
* specialty.coding[Fachrichtung] = $IHEAerztlicheFachrichtungen#ALLG
* name = "Allgemeine Beratungsstelle der Fachabteilung 0100"
