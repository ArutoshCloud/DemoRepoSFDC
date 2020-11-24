trigger LeadTrigger on Lead (before insert) {

    if(trigger.isbefore){
        if(trigger.Isinsert){
                    LeadTriggerHandler.toStopUserToCreateLeadOnLimit(trigger.new);
        }
    }
    
    

}