trigger ContactTrigger on Contact (before insert,before update,before delete,After insert,After update,After delete) {
    if(trigger.IsBefore){
        
        
        if(trigger.IsInsert){
            contactTriggerHandler.contactwithoneOrmultipleAccount(trigger.new);
            ContactTriggerHandler.contactwithAccountAddress(trigger.new);
            ContactTriggerHandler.contactwithsameuserNaccountCountry(trigger.new);
            ContactTriggerHandler.contactwithAccountAddress(trigger.new);
            ContactTriggerHandler.copycontactLastnameToAccountName(trigger.new);
            
        }
        if(trigger.Isupdate){
            
        }
        if(trigger.Isdelete){
            ContactTriggerHandler.deletecontactLastnameFromAccountName(trigger.old);
        }
        if(trigger.Isundelete){}
        
        
    }
    
    
    if(trigger.IsAfter){
        
        
        if(trigger.IsInsert){
            ContactTriggerHandler.copyuserAddressToContactNAccount(trigger.new);
            
        }
        if(trigger.Isupdate){
            
        }
        if(trigger.Isdelete){
            ContactTriggerHandler.deletecontactLastnameFromAccountName(trigger.old);
        } 
    }
    
}