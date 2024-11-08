# Motivation

Die Vereinbarung von Terminen für Behandlungsleistungen repräsentiert oftmals für Patienten oder für sie zuständige Leistungserbringer den Einstieg in den Versorgungsablauf im Krankenhaus. Die Terminplanung agiert somit als kritische Schnittstelle zwischen diversen Akteuren im Gesundheitswesen, inklusive der zu behandelnden Personen. Informationen zu notwendigen bzw. gewünschten Behandlungen, Verfügbarkeiten der involvierten Personen und abrechnungsrelevante Details zur Krankenversicherung müssen potenziell ausgetauscht werden, um einen optimierten Ablauf des Aufenthaltes im Krankenhaus zu ermöglichen.

Das Krankenhauszukunftsgesetz (KHZG) hebt die zentrale Rolle der Terminvereinbarung hervor in dem in den dazugehörigen Fördertatbeständen Vorgaben für die Terminplanung im digitalen Aufnahmemanagement bzw. für die Terminplanung mittels Patientenportalen gemacht werden (vgl. §19 Abs. 1 Satz 1 Nr. 2 KHSFV bzw. §21 Abs. 2 KHSFV).

Angelehnt an diese Vorgaben soll mittels ISiK die Grundlage geschaffen werden, um die beschriebenen oder ähnliche Use Cases durchzuführen und die fachlich-inhaltlichen Informationen in einer interoperablen Art und Weise auszutauschen. ISiK versteht sich somit als Schnittstellenbeschreibung, um eine einheitliche API zu dokumentieren, durch die ein Termin vereinbart und verwaltet werden kann. Das vorliegende ISiK-Modul bietet somit explizit KEIN umfassendes Datenmodell für die krankenhausinterne Ressourcenplanung. Hingegen werden durch ISiK Minimalvorgaben für bestätigungsrelevante Systeme spezifiziert, auf die komplexere Workflows ausgestaltet werden können.

Durch ISiK Terminplanung sollen folgende Möglichkeiten eröffnet werden:

* Abruf von Abbildungen von verfügbaren teil- und voll- stationären Behandlungsleistungen durch ein Krankenhaus
* Abfrage von Terminen und Verfügbarkeiten
* Buchungsmanagement von verfügbaren Terminen
* Benachrichtigungen bei Terminänderungen
* Anlage eines neuen Patienten im terminführenden System (Übermittlung Patient/Versicherungsinformationen)