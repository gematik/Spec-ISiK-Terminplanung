ValueSet: ISiKTerminCancelationReason
Id: ISiKTerminCancelationReason
Description: "Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins"
* insert Meta
* $cancelationReason#pat
* $cancelationReason#prov
* $cancelationReason#maint
* $cancelationReason#meds-inc
* $cancelationReason#other

ValueSet: ISiKTerminPriority
Id: ISiKTerminPriority
Description: "Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind"
* insert Meta
* $sct#709122007 "ASAP"
* $sct#441808003 "Delayed priority"
* $sct#103390000 "Elective"
* $sct#25876001 "Emergency"
* $sct#394849002 "High priority"
* $sct#88694003 "Immediate"
* $sct#1251527002 "Low priority"
* $sct#394848005 "Normal priority"
* $sct#76561005 "Reclassified"
* $sct#44408006 "Reclassified and rescheduled"
* $sct#64695001 "Repeat elective"
* $sct#21282002 "Repeat emergency"
* $sct#58334001 "Rescheduled"
* $sct#50811001 "Routine"
* $sct#416774000 "Scheduled - priority"
* $sct#49499008 "Stat"
* $sct#103391001 "Urgent"