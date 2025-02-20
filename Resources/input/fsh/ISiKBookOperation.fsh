Instance: Book
InstanceOf: OperationDefinition
Usage: #example
* insert MetaInstance
* id = "ISiKAppointmentBookOperation"
* name = "ISiKAppointmentBookOperation"
* url = "https://gematik.de/fhir/isik/OperationDefinition/AppointmentBook"
* kind = #operation
* name = "Book"
* code = #book
* resource = #Appointment
* system = false
* type = true
* instance = false
* affectsState = true
* description = "OperationDefinition für die Buchung eines Termins. Die Operation überprüft ob der Termin noch verfügbar ist im Termin-Repository."
* parameter[+]
  * name = #appt-resource
  * use = #in
  * min = 1
  * max = "1"
  * documentation	= "Eine Appointment-Ressource entsprechend dem dazugehörigen ISiK-Profil MUSS übergeben werden. Falls das Parameter-Element 'Appointment' als einziges Parameter-Element verwendet wird, SOLL die Appointment-Ressource direkt im HTTP Body übergeben werden, alternativ zu einer Parameter-Ressource inklusive dem eingebetteten Appointment-Element. Invalide Ressourcen MÜSSEN abgelehnt werden durch das Termin Repository (zur Form der Ablehnung s.u.). Das Appointment MUSS den Status 'proposed' enthalten. Bei Terminverschiebungen (keine Terminabsage!) kann ein Appointment mit einem angepassten Zeitfenster in diesem Parameter übergeben werden. Appointment-Ressourcen, die dem Termin-Repository bekannt sind unter der im Appointment enthaltenen id, MÜSSEN durch das Termin-Repository geupdatet werden unter Beibehaltung der id."
  * type = #Appointment
* parameter[+]
  * name = #cancelled-appt-id
  * use = #in
  * min = 0
  * max = "1"
  * documentation	= "Im Falle einer Terminverschiebung kann die Situation vorkommen, dass Terminressourcen (z.B. Räume oder angebotene Dienstleistungen) nicht verfügbar sind. Dadurch kann es notwendig sein, den zu verschiebenden Termin neu zu planen. Dies wird als zweistufiger Prozess durch die $book-Operation unterstützt, bei dem ein Termin storniert und ein neuer Termin neu gebucht wird. Dieser Parameter repräsentiert die Ressourcen-Id des zu stornierenden Appointments. Der uri-Parameter kann eine absolute URL enthalten, Server SOLLEN jedoch nur Termine für ihre eigene Domäne verwalten. Im neu-angelegten Appointment MUSS eine Reference auf den abgesagten Termin hinterlegt werden (vgl. Appointment.extension:replaces) durch den Server. Der Status der abgesagten Ressource MUSS durch den Server angepasst werden (status = 'cancelled'). Die Verschiebung ist als transaktionale Operation zu verstehen, d.h. die Absage des originalen Termins DARF durch den Server nur bestätigt werden, wenn der neue vorgeschlagene Termin angenommen werden kann. Andernfalls MUSS die Terminverschiebung mit einem entsprechenden Hinweis abgelehnt werden."
  * type = #uri
* parameter[+]
  * name = #schedule
  * use = #in
  * min = 0
  * max = "1"
  * type = #Reference
  * documentation	= "Im Falle dass ein Appointment keine Referenz auf ein oder mehrere Slots enthält, MUSS der Server die benötigten Slots auf Basis der Referenz auf Schedule, sowie dem Start- und Endzeitpunkt im Appointment ermitteln."
  * targetProfile = Canonical(ISiKKalender)
* parameter[+]
  * name = #patient
  * use = #in
  * min = 1
  * max = "1"
  * documentation	= "Eine Patient-Ressource, die die Person identifiziert, für die der Termin gemäß dem Parameter 'appt-resource' gebucht werden soll. Die Ressource KANN vom ISiKPatient-Profil abweichen, falls für die Terminbuchung irrelevante Pflichtangaben aus dem Profil nicht bekannt sind. Invalide Ressourcen MÜSSEN vom Termin-Repository abgelehnt werden (zur Form der Ablehnung s.u.). Dieser Parameter dient der Übermittlung der Patienteninformationen, falls diese dem Termin-Repository noch nicht bekannt sind. Das Termin-Repository SOLL im bestätigten Termin eine Referenz auf einen Patienten zurückgeben, sofern kein Patient unter Appointment.participant im 'appt-resource'-Parameter referenziert ist."
  * type = #Patient
* parameter[+]
  * name = #related-person
  * use = #in
  * min = 1
  * max = "1"
  * documentation	= "Eine RelatedPerson-Ressource, die eine Person identifiziert, die den Termin im Namen des Patienten bucht. Die Ressource KANN vom ISiKRelatedPerson-Profil abweichen, falls für die Terminbuchung irrelevante Pflichtangaben aus dem Profil nicht bekannt sind. Invalide Ressourcen MÜSSEN vom Termin-Repository abgelehnt werden (siehe Form der Ablehnung unten). Dieser Parameter dient der Übermittlung der RelatedPerson-Informationen, falls diese dem Termin-Repository noch nicht bekannt sind. Das Termin-Repository SOLL im bestätigten Termin eine Referenz auf eine RelatedPerson zurückgeben, sofern keine RelatedPerson unter Appointment.participant im 'appt-resource'-Parameter referenziert ist."
  * type = #Patient
* parameter[+]
  * name = #return
  * use = #out
  * min = 0
  * max = "1"
  * documentation	= "Falls die Interaktion erfolgreich ist, ist der Status Code HTTP 201 - Created zurückzugeben. Im Erfolgsfall MUSS als Return-Parameter eine Appointment-Ressource (entsprechend dem dazugehörigen ISiK-Profil) zurückgegeben werden. Das id-Element der Appointment-Ressource MUSS korrekt gefüllt werden. Der Server MUSS den Status der Appointment-Ressource auf 'booked' oder 'pending' ändern. Der Server MUSS die verwendeten Slot-Ressourcen als Referenz im Appointment angeben. Die Appointment-Ressource SOLL direkt im HTTP Body zurückgegeben werden, falls es sich um den einzigen Rückgabewert handelt. Alternativ kann die Appointment-Ressource innerhalb einer Parameter-Ressource zurückgegeben werden. Als Teil der Parameter-Ressource können zusätzlich Hinweise zum Termin als OperationOutcome zurückgegeben werden."
  * type = #Appointment
* parameter[+]
  * name = #return
  * use = #out
  * min = 0
  * max = "1"
  * documentation	= "Falls die Interaktion fehlschlägt, MUSS als Return-Parameter eine OperationOutcome-Ressource zurückgegeben werden. Syntaktische Fehler in der Appointment-Ressource MUSS mit einem HTTP Status-Code 400 - Bad Request zurückgewiesen werden. Anderweitig invalide Appointment-Ressourcen MÜSSEN mit einer OperationOutcome-Ressource abgewiesen werden. In diesem Fall SOLL der HTTP Status-Code HTTP 422 - Unprocessable Entity verwendet werden. Eine OperationOutcome-Ressource KANN zu informativen Zwecken in jedem Fall zurückgegeben werden (s.o.)."
  * type = #OperationOutcome
