# Konformitätserklärung [(CapabilityStatement)](https://hl7.org/fhir/R4/capabilitystatement.html)

Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html)-Ressource bereitstellen.

Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Spezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden.
Der "MODE"-Parameter kann ignoriert werden.

Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind` = "requirements"). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN, gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)-Extension mit den möglichen Werten "SHALL" (=MUSS) und "MAY" (=KANN) verwendet.

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind`= "instance" liefern und im Element `software` den Namen und die Versionsnummer angeben.

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement mit "SHALL" gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit "MAY" gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.

Die Verwendung der [CapabilityStatement-Expectation](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich.

## CapabilityStatement (Requirement) ISiK-Terminplanung

Das nachfolgende CapabilityStatement repräsentiert die Anforderungen an ein Termin-Repository.

[Link Simplifier Profil Übersicht](https://simplifier.net/isik-terminplanung-v4/isikcapabilitystatementterminplanungserver)

{{render:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminplanungServer}}
