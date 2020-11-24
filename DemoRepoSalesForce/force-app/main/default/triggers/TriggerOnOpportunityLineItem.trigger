trigger TriggerOnOpportunityLineItem on OpportunityLineItem (before insert) {
    if(trigger.Isbefore){
        if(trigger.IsInsert){
            OpportunityTriggerHandler.ToStopOpportunitylineItemWhenmorethanTwo(trigger.new);
        }

        
    }
}