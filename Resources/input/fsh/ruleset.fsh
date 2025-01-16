RuleSet: Meta
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^version = "4.0.2"
* ^date = "2024-12-05"

RuleSet: MetaInstance
* status = #active
* experimental = false
* publisher = "gematik GmbH"
* version = "4.0.2"
* date = "2024-12-05"

RuleSet: Meta-CapabilityStatement
* insert MetaInstance
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Terminplanung"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminplanungServer"

RuleSet: Expectation (expectation)
* extension.url = $capabilitystatement-expectation
* extension.valueCode = {expectation}

RuleSet: CommonSearchParameters
* searchParam[+]
  * insert Expectation (#SHALL)
  * name = "_id"
  * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
  * type = #token
  * documentation = 
        "**Beispiel:**    
        `GET [base]/[Resourcetype]?_id=103270`    
        **Anwendungshinweis:**  
        Der Parameter `_id` wird selten alleinstehend verwendet, da sich zum Abruf einer Ressource 
        anhand der `id`  die `READ`-Interaktion besser anbietet. Der Parameter kann jedoch verwendet werden,
        um den Abruf einer Ressource bspw. mit einem `_include` weiterer Ressourcen zu verbinden,
        z.B. zum Abruf eines Encounters in Verbindung mit dem zugehörigen Patienten:    
        `GET [base]/Encounter?_id=103270&_include=Encounter:patient` 
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
* searchParam[+]
  * insert Expectation (#SHALL)
  * name = "_tag"
  * definition = "http://hl7.org/fhir/SearchParameter/Resource-tag"
  * type = #token
  * documentation = 
        "**Beispiel:**    
        `GET [base]/[Resourcetype]?_tag=https://example.org/codes|needs-review`    
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all) 
        sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags).  "
* searchParam[+]
  * insert Expectation (#SHALL)
  * name = "_count"
  * type = #number
  * documentation = 
        "**Beispiel:**    
        `GET [base]/[Resourcetype]?_count=100`    
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Page Count](https://www.hl7.org/fhir/R4/search.html#count).  "
* searchParam[+]
  * insert Expectation (#MAY)
  * name = "_has"
  * type = #string
  * documentation = 
        "**Beispiel:** Suche nach allen Patienten, die eine Observation  mit dem Code '1234-5' haben   
        `GET [base]/Patient?_has:Observation:patient:code=1234-5`    
        **Beispiel:** Suche nach allen Encountern, bei denen die Diagnose 'A12.3' gestellt wurde     
        `GET [base]/Encounter?_has:Condition:encounter:code=A12.3`  
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has).  "