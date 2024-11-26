## {{page-title}}

Für folgende Interaktionen werden im vorliegenden Implementierungsleitfaden Vorgaben für die Umsetzung innerhalb der ISiK-Schnittstelle definiert:


| Akteure             | Transaktionen                                                                                                                   | Optionalität |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------|-------------|
| **Termin Repository** | - Übermittlung von Patienteninformationen <br> - Verfügbare Behandlungsleistungen abrufen <br> - Verfügbare Terminlisten abrufen <br> - Abfrage von (verfügbaren) Terminblöcken <br> - Termin neu buchen (Buchungsmanagement von verfügbaren Terminen) <br> - Termin absagen (ausgehend vom Client) <br> - Termin verschieben (ausgehend vom Client) <br> - Terminzusatzinformationen aktualisieren (ausgehend vom Client) | Verplichtend           |
| **Termin Requestor**  | - Übermittlung von Patienteninformationen <br> - Verfügbare Behandlungsleistungen abrufen <br> - Verfügbare Terminlisten abrufen <br> - Abfrage von (verfügbaren) Terminblöcken <br> - Termin neu buchen (Buchungsmanagement von verfügbaren Terminen) <br> - Termin absagen (ausgehend vom Client) <br> - Termin verschieben (ausgehend vom Client) <br> - Terminzusatzinformationen aktualisieren (ausgehend vom Client) | Optional           |
| **Termin Consumer**   | - Abfrage von (vereinbarten) Terminen                                                                                      | Optional           |

Zudem kann die Situation eintreten, dass ein System die Aufgaben eines Termin Repositories übernimmt, jedoch kein terminführendes System ist (z. B. ein Patientenportal) und die Termine mit einem weiteren Termin Repository synchronisiert (z. B. KIS). In diesem Fall übernimmt das System, welches Termine an das terminführende System sendet, die Rolle eines Termin-Requestors. Diese Option steht einem Termin Repository offen, falls es für bestimmte Use Cases notwendig ist; jedoch ist dies nicht verpflichtend für die Rolle des Termin Repositories.

---

{{render:Material/images/Interaktionen/1. Übermittelung Patienteninformationen - zum Termin zugehörige Vorabinformationen.png}}

Für die Auswahl eines verfügbaren Terminblocks kann es notwendig sein, dass das Termin Repository vorab durch den Termin Requestor Vorabinformationen (z.B. für die Krankenversicherung) erhält. Diese können über eine schreibende Schnittstelle an das Terminrepository übermittelt werden. Es ist zu beachten, dass das Termin Repository gegebenenfalls diese Informationen separat von eigens erstellten Datenobjekten vorhält und/oder die Information dauerhaft erst nach einer manuellen Überprüfung durch eine Benutzer freigibt.

Gleichermaßen können Informationen zum Patienten vorab übermittelt werden, sodass gewisse Basisangaben bereits im Terminrepository vorliegen.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Operations.md, text:Anlage einer Patient-Ressource}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/2. Verfügbare Behandlungsleistungen abrufen.png}}

Als Einstiegspunkt in die Terminvereinbarung können durch den Termin Requester alle verfügbaren Behandlungsleistungen (HealthcareServices) abgerufen werden, für die das Termin Repository Informationen zu notwendigen Ressourcen (Räume, Personen, Geräte, etc.) bereitstellt.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/ISiKMedizinischeBehandlungseinheitHealthcareService.md, text: ISiKMedizinischeBehandlungseinheit (HealthcareService) - Interaktionen}} für die technische Umsetzung. Es sind die Hinweise zum Abruf der ValueSets für die Kodierung der Medizinischen Behandlungseinheit zu beachten.

---

{{render:Material/images/Interaktionen/3. Verfügbare Terminlisten abrufen.png}}

Der Termin Requestor kann nach der Auswahl einer Behandlungsleistung verfügbare Terminlisten (Schedules) für diese im Termin Repository abrufen. Die Terminlisten repräsentieren somit den "Kalender" in dem Termine gebucht werden können.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/ISiKKalenderSchedule.md, text: ISiKKalender (Schedule) - Interaktionen}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/4. Abfrage von (verfübaren) Terminblöcken.png}}

Für einen jeweiligen Kalender kann der Termin Requestor die darin definierten Terminblöcke abfragen. Diese können entsprechend eines Zeitraums und/oder Status (verfügbar, belegt) gefiltert werden.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/ISiKTerminblockSlot.md, text: ISiKTerminblock (Slot) - Interaktionen}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/5. Termin neu buchen - Buchungsmanagemnent von verfügbaren Terminen.png}}

Für einen durch den Benutzer ausgewählten Terminblock bzw. mehreren aufeinander folgenden Terminblöcken kann durch den Termin Requestor ein Termin angefragt werden. Dieser kann direkt oder erst nach manueller Bestätigung durch das Termin Repository freigegeben werden.

Es ist zu beachten, dass innerhalb dieser Aktion ein terminführendes Termin Repository die Rolle des Termin Requestors übernehmen kann und den neu-angelegten Termin in ein weiteres Terminrepository spiegelt.

In diesem Kontext kann das Termin-Repsoitory zudem Zusatzinformationen (z.B. Lagepläne) an den Termin-Requestor übermitteln.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Operations.md, text:Buchung eines Termins}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/6.1 Termin absagen (ausgehend vom Client).png}}


{{render:Material/images/Interaktionen/6.2 Termin absagen (ausgehend vom terminführenden System).png}}

Termine können sowohl durch den Termin Requestor als Client oder durch das Termin Repository als terminführendes System abgesagt werden.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Operations.md, text:Aktualisierung / Absage eines Termins}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/7.1 Termin verschieben (ausgehend vom Client).png}}

{{render:Material/images/Interaktionen/7.2 Termin verschieben (ausgehend vom Termin Repository).png}}

Termine können sowohl durch den Termin Requestor als Client oder durch das Termin Repository als terminführendes System verschoben werden. Im Falle, dass das Termin Repository den Termin verschiebt ist der Termin Consumer darüber zu benachrichtigen.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Operations.md, text:Buchung eines Termins}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/8.1 Terminzusatzinformationen aktualisieren (ausgehend vom Client).png}}

{{render:Material/images/Interaktionen/8.2 Terminzusatzinformationen aktualisieren (ausgehend vom Termin Repository).png}}

Termine können sowohl durch den Termin Requestor als Client oder durch das Termin Repository als terminführendes System durch Zusatzinformationen (z.B. welche Teilnehmer oder Ressourcen sind Teil des Termins) erweitert werden.

In diesem Kontext kann der Termin-Requestor zudem Zusatzinformationen (z.B. Einwilligungen) an das Termin-Repository übermitteln.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/Operations.md, text:Aktualisierung / Absage eines Termins}} für die technische Umsetzung.

---

{{render:Material/images/Interaktionen/9. Abfrage von (verinbarten) Terminen.png}}

Der Termin Requestor oder Termin Consumer kann einen, mehrere oder alle Termine eines Termin Repositories abfragen.

Siehe {{pagelink:ImplementationGuide/markdown/Datenobjekte/ISiKTerminAppointment.md, text: ISiKTermin (Appointment) - Interaktionen}} für die technische Umsetzung.
