Profile: ISiKMedizinischeBehandlungseinheit
Parent: HealthcareService
Id: ISiKMedizinischeBehandlungseinheit
* insert Meta
* active 1..1 MS
* type 1.. MS
* specialty 1.. MS
  * ^comment = "Kodierung aller Fachbereiche unter die die Behandlungseinheit fällt. Eine Behandlungseinheit kann multiprofessionell sein und mehere Fachbereiche abdecken."
* specialty.coding 1.. MS
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
* name 1.. MS

Instance: ISiKMedizinischeBehandlungseinheitExample
InstanceOf: ISiKMedizinischeBehandlungseinheit
Usage: #example
* active = true
* type = http://terminology.hl7.org/CodeSystem/service-type#124
* specialty = $IHEAerztlicheFachrichtungen#ALLG
* name = "Allgemeine Beratungsstelle der Fachabteilung 0100"