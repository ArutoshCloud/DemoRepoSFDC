trigger TriggerOnEvenParticipant on Event_Participant__c (before insert) {
    if(trigger.IsBefore){            
        if(trigger.IsInsert){
            EventTriggerHandler.NoSameContactUnderSameEvent(trigger.new);
            EventTriggerHandler.NoSameContactUnderEventWithSameEventDate(trigger.new);
            
        }
    }
}